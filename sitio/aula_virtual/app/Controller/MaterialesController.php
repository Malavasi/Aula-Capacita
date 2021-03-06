<?php
App::uses('AppController', 'Controller');
App::uses('Usuario', 'Model');
App::uses('Matriculas', 'Model');
App::uses('Programas', 'Model');
App::uses('CakeEmail', 'Network/Email');
App::uses('Folder', 'Utility');
App::uses('File', 'Utility');
App::uses('Correo', 'Lib');
/**
 * Materiales Controller
 *
 * @property Material $Material
 * @property PaginatorComponent $Paginator
 */
 session_start();
class MaterialesController extends AppController {

	public $uses = array('Material', 'Curso');
	public $helpers = array('Html', 'Form');
/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');

/**
 * index method
 *
 * @return void
 */
	public function index($id = NULL) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
            if($_SESSION['tipo_usuario']>1 and $_SESSION['id_curso'] != $id) {
                $this->redirect(array('controller' =>'aulas','action' => 'index/'.$_SESSION['id_curso'])); 
            }
            if($id == NULL) {
                $this->Material->recursive = 0;
		        $this->set('materiales', $this->Paginator->paginate());    
            } else {
                $this->Material->recursive = 0;
                $this->set('materiales', $this->Paginator->paginate(array ('curso_id'=>$id)));    
            }
		} else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
			if (!$this->Material->exists($id)) {
				throw new NotFoundException(__('Archivo inválido'));
			}
			$options = array('conditions' => array('Material.' . $this->Material->primaryKey => $id));
			$this->set('material', $this->Material->find('first', $options));
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * add method
 *
 * @return void
 */
	function add() {
		
		if (isset($_SESSION['id_curso'])) {
			$this->Material->recursive = 0;
            $this->set('infoCurso', $this->Curso->findById($_SESSION['id_curso']));
		} else {
			echo 'No se ha podido obtener la información del archivo.';
		}
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
	        if (!empty($this->request->data)) {
	            $this->request->data['Material']['curso_id'] = $_SESSION['id_curso'];
	            $this->request->data['Material']['usuario_id']	= $_SESSION['id_usuario'];
	            $this->request->data['Material']['fecha'] = date("Y-m-d H:i:s");
				$this->request->data['Material']['tamano'] = $this->request->data['Material']['url']['size'] * 0.001;//tamano en KB
				
				if (empty($this->request->data['Material']['url']['name'])){
					$this->request->data['Material']['nombre'] = $this->request->data['Material']['link'];
				} else {
					$this->request->data['Material']['nombre'] = $this->request->data['Material']['url']['name'];
				}
				
                if(strcmp($this->request->data['Material']['programas'],'')==0) {
                    $programas = new Programas();
                    $archivo = explode('.',$this->request->data['Material']['nombre']);
                    $extension = strtolower($archivo[1]);
                    $programa = $programas->find('all', array('conditions' => array('extension' => $extension )) );
                    if(isset($programa[0]['Programas'])) {
                        $this->request->data['Material']['programas'] = $programa[0]['Programas']['programas'];
                    }
                }
				
				$this->Material->create();
	            if($this->Material->save($this->request->data)) {
                    //correo
                    $usuarios = new Matriculas();
                    $matriculas = $usuarios->find('all', array('conditions' => array('curso_id' => $_SESSION['id_curso'] )) );
                    $usuarios = new Usuario();     
                    foreach($matriculas as $matricula) {
                        $estudiantes =  $usuarios->find('all', array('conditions' => array('Usuario.id' =>$matricula['Matriculas']['usuario_id'] )) );
                        if(isset($estudiantes[0]) &&  $estudiantes[0]['Usuario']['notificaciones']==1) {
                            $correo = new Correo();
                            $correo->enviar($estudiantes[0]['Usuario']['email'],'Nuevo archivo','archivo',array('Usuario' =>$estudiantes[0]['Usuario']['nombre'].' '.$estudiantes[0]['Usuario']['apellidos'], 'archivo'=>$this->request->data['Material']['url']['name'],'curso'=>''),FALSE);0
                        }
                    }
					
	            	$this->Session->setFlash(__('El archivo ha sido guardado.'));
					return $this->redirect(array('controller' => 'Materiales', 'action' => 'index', $_SESSION['id_curso']));
	            } else {
	            	$this->Session->setFlash(__('El archivo no se ha podido guardar. Por favor, intente de nuevo.'));
	            }       
	        }
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
    }

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		
		if (isset($_SESSION['id_curso'])) {
			$this->Material->recursive = 0;
            $this->set('infoArchivo', $this->Paginator->paginate(array ('Material.id' => $id, 'Material.curso_id'=>$_SESSION['id_curso'])));   
		}
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3) {
			if (!$this->Material->exists($id)) {
				throw new NotFoundException(__('Archivo inválido'));
			}
			$archivoViejo = $this->Material->findById($id);
			$replaceFile = 0;//para confirmar que se va a reemplazar el archivo guardado
			if ($this->request->is(array('post', 'put'))) {
				if (empty($this->request->data['Material']['url']['name'])){
					$this->request->data['Material']['nombre'] = $this->request->data['Material']['link'];
				} else {
					$this->request->data['Material']['nombre'] = $this->request->data['Material']['url']['name'];
					$replaceFile = 1;
				}
				
				if(strcmp($this->request->data['Material']['programas'],'')==0) {
                    $programas = new Programas();
                    $archivo = explode('.',$this->request->data['Material']['nombre']);
                    $extension = strtolower($archivo[1]);
                    $programa = $programas->find('all', array('conditions' => array('extension' => $extension )) );
                    if(isset($programa[0]['Programas'])) {
                        $this->request->data['Material']['programas'] = $programa[0]['Programas']['programas'];
                    }
                }
				
	            $this->Material->id = $id;
				if ($this->Material->save($this->request->data)) {
					if($replaceFile == 1) {//si se comfirma el reemplazo y se guardó el archivo nuevo, se elimina el viejo
						$this->deleteFile($id, $archivoViejo);
					}
					
					$this->Session->setFlash(__('El archivo ha sido actualizado.'));
					return $this->redirect(array('controller' => 'Materiales', 'action' => 'view', $id));
				} else {
					$this->Session->setFlash(__('El archivo no se ha podido guardar. Por favor, intente de nuevo.'));
				}
			} else {
				$options = array('conditions' => array('Material.' . $this->Material->primaryKey => $id));
				$this->request->data = $this->Material->find('first', $options);
			}
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
			$this->Material->id = $id;
			if (!$this->Material->exists()) {
				throw new NotFoundException(__('Archivo inválido'));
			}
			$this->request->allowMethod('post', 'delete');
			
			$archivo = $this->Material->findById($id);
			if ($this->Material->delete()) {
				$this->deleteFile($id, $archivo);
				$this->Session->setFlash(__('El archivo ha sido eliminado.'));
			} else {
				$this->Session->setFlash(__('El archivo no se ha podido eliminar. Por favor, intente de nuevo.'));
			}
			return $this->redirect(array('controller' => 'Materiales', 'action' => 'index', $_SESSION['id_curso']));
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	
	public function download($id) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
		    $archivo = $this->Material->findById($id);
			
			$dir = new Folder(WWW_ROOT.'files' . DS . 'materiales' . DS . $archivo['Material']['usuario_id']);
			$files = $dir->find($archivo['Material']['nombre']);
			$file = new File($dir->pwd() . DS . $files[0]);
			
			$fileInfo = $file->info();
			
		    $this->response->file(
			    $fileInfo['dirname'] . DS . $fileInfo['basename'],
			    array('download' => true, 'name' => $fileInfo['basename'])
			);
		    // Return response object to prevent controller from trying to render
		    // a view
		    return $this->response;
			
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	
	public function deleteFile($id, $archivo) {
		//buscar archivo en directorio para eliminarlo
		$dir = new Folder(WWW_ROOT.'files' . DS . 'materiales' . DS . $archivo['Material']['usuario_id']);
		$files = $dir->find($archivo['Material']['nombre']);
		$file = new File($dir->pwd() . DS . $files[0]);
		$file->delete();
	}
}
