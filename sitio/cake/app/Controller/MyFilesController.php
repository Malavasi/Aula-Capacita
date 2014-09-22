<?php
App::uses('AppController', 'Controller');
App::uses('Usuario', 'Model');
App::uses('Matriculas', 'Model');
App::uses('Programas', 'Model');
App::uses('CakeEmail', 'Network/Email');
/**
 * MyFiles Controller
 *
 * @property MyFile $MyFile
 * @property PaginatorComponent $Paginator
 */
 session_start();
class MyFilesController extends AppController {

	public $uses = array('MyFile', 'Curso');
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
                $this->MyFile->recursive = 0;
		        $this->set('myFiles', $this->Paginator->paginate());    
            } else {
                $this->MyFile->recursive = 0;
                $this->set('myFiles', $this->Paginator->paginate(array ('curso_id'=>$id)));    
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
			if (!$this->MyFile->exists($id)) {
				throw new NotFoundException(__('Archivo inválido'));
			}
			$options = array('conditions' => array('MyFile.' . $this->MyFile->primaryKey => $id));
			$this->set('myFile', $this->MyFile->find('first', $options));
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
			$this->MyFile->recursive = 0;
            $this->set('infoCurso', $this->Curso->findById($_SESSION['id_curso']));
		} else {
			echo 'No se ha podido obtener la información del archivo.';
		}
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
	        if (!empty($this->request->data) && 
	            is_uploaded_file($this->request->data['MyFile']['File']['tmp_name'])) {
	            
	            $fileData = fread(fopen($this->request->data['MyFile']['File']['tmp_name'], "r"), 
	                                     $this->request->data['MyFile']['File']['size']);
	            
	            $this->request->data['MyFile']['name'] = $this->request->data['MyFile']['File']['name'];
	            $this->request->data['MyFile']['type'] = $this->request->data['MyFile']['File']['type'];
	            $this->request->data['MyFile']['size'] = $this->request->data['MyFile']['File']['size'];
				$this->request->data['MyFile']['created'] = date("Y-m-d H:i:s");
	            $this->request->data['MyFile']['data'] = $fileData;
				$this->request->data['MyFile']['curso_id']	= $_SESSION['id_curso'];
	            $this->request->data['MyFile']['usuario_id']	= $_SESSION['id_usuario'];
                if(strcmp($this->request->data['MyFile']['programas'],'')==0)
                {
                    $programas = new Programas();
                    $archivo = explode($this->request->data['MyFile']['name'],'.');
                    $extension = strtolower($archivo[1]);
                    $programa = $programas->find('all', array('conditions' => array('extension' => $extension )) );
                    if(isset($programa['Programas'][0]))
                    {
                        $this->request->data['MyFile']['programas'] = $programa['Programas'][0]['programas'];
                    }
                }
	            if($this->MyFile->save($this->request->data)) {
                    //correo
                    $usuarios = new Matriculas();
                    $matriculas = $usuarios->find('all', array('conditions' => array('curso_id' => $_SESSION['id_curso'] )) );
                    $usuarios = new Usuario();     
                    foreach($matriculas as $matricula)
                    {
                        $estudiantes =  $usuarios->find('all', array('conditions' => array('id' =>$matricula['Matriculas']['usuario_id'] )) );
                        if(isset($estudiantes[0]) &&  $estudiantes[0]['Usuario']['notificaciones']==1)
                        {
                            $Email = new CakeEmail('default');
                            $Email->from(array('soporte@capacita.co' => 'Aula Capacita'));
                            $Email->to($estudiantes[0]['Usuario']['email']);
                            $Email->subject('Nuevo archivo');
                            $Email->template('archivo');
                            $Email->viewVars(array('Usuario' =>$estudiantes[0]['Usuario']['nombre'].' '.$estudiantes[0]['Usuario']['apellidos'], 'archivo'=>$this->request->data['MyFile']['File']['name'],'curso'=>''));
                            $Email->emailFormat('html');
                            $Email->send();
                        }
                    }
                    
	            	$this->Session->setFlash(__('El archivo ha sido guardado.'));
					return $this->redirect(array('controller' => 'MyFiles', 'action' => 'index', $_SESSION['id_curso']));
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
			$this->MyFile->recursive = 0;
            $this->set('infoArchivo', $this->Paginator->paginate(array ('curso_id'=>$_SESSION['id_curso'])));   
		}
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3) {
			if (!$this->MyFile->exists($id)) {
				throw new NotFoundException(__('Archivo inválido'));
			}
	
			$this->set('requestInfo', $this->request->data);		
	        	
				
			if ($this->request->is(array('post', 'put')) && 
	            is_uploaded_file($this->request->data['MyFile']['File']['tmp_name'])) {
			    $fileData = fread(fopen($this->request->data['MyFile']['File']['tmp_name'], "r"), 
	                                     $this->request->data['MyFile']['File']['size']);
	            $this->request->data['MyFile']['name'] = $this->request->data['MyFile']['File']['name'];
	            $this->request->data['MyFile']['type'] = $this->request->data['MyFile']['File']['type'];
	            $this->request->data['MyFile']['size'] = $this->request->data['MyFile']['File']['size'];
				$this->request->data['MyFile']['created'] = date("Y-m-d H:i:s");
	            $this->request->data['MyFile']['data'] = $fileData;
	            $this->MyFile->id = $id; 
				if ($this->MyFile->save($this->request->data)) {
					$this->Session->setFlash(__('El archivo ha sido guardado.'));
					return $this->redirect(array('controller' => 'MyFiles', 'action' => 'index', $_SESSION['id_curso']));
				} else {
					$this->Session->setFlash(__('El archivo no se ha podido guardar. Por favor, intente de nuevo.'));
				}
			} else {
				$options = array('conditions' => array('MyFile.' . $this->MyFile->primaryKey => $id));
				$this->request->data = $this->MyFile->find('first', $options);
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
			$this->MyFile->id = $id;
			if (!$this->MyFile->exists()) {
				throw new NotFoundException(__('Archivo inválido'));
			}
			$this->request->allowMethod('post', 'delete');
			if ($this->MyFile->delete()) {
				$this->Session->setFlash(__('El archivo ha sido eliminado.'));
			} else {
				$this->Session->setFlash(__('El archivo no se ha podido eliminar. Por favor, intente de nuevo.'));
			}
			return $this->redirect(array('controller' => 'MyFiles', 'action' => 'index', $_SESSION['id_curso']));
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	
	function download($id) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 ) {
		    Configure::write('debug', 0);
		    $file = $this->MyFile->findById($id);
				
		    header('Content-type: ' . $file['MyFile']['type']);
		    header('Content-length: ' . $file['MyFile']['size']);
			header('Content-Disposition: attachment; filename="'.$file['MyFile']['name'].'"');
		    echo $file['MyFile']['data'];
					
		    exit();
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
}
