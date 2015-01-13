<?php
App::uses('AppController', 'Controller');
App::uses('CakeEmail', 'Network/Email');
App::uses('Correo', 'Lib');
/**
 * Usuarios Controller
 *
 * @property Usuario $Usuario
 * @property PaginatorComponent $Paginator
 */
 session_start();
class UsuariosController extends AppController {

	public $uses = array('Usuario', 'Curso', 'Matricula');
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
	public function index() {
         if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
		    $this->Usuario->recursive = 0;
            $this->set('usuarios', $this->Paginator->paginate());
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
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
		    if (!$this->Usuario->exists($id)) {
			    throw new NotFoundException(__('Usuario Inválido'));
		    }
		    $options = array('conditions' => array('Usuario.' . $this->Usuario->primaryKey => $id));
			$usuario = $this->Usuario->find('first', $options);
		    $this->set('usuario', $usuario);
			
			if ($usuario['Usuario']['tipo'] == 2) {
				$options = array('conditions' => array('Curso.usuario_id' => $id));
				$this->set('curso', $this->Curso->find('first', $options));
				
			} elseif ($usuario['Usuario']['tipo'] == 3 and isset($usuario['Matricula'][0]['curso_id'])) {
				$options = array('conditions' => array('Curso.' . $this->Curso->primaryKey => $usuario['Matricula'][0]['curso_id']));
				$this->set('curso', $this->Curso->find('first', $options));
			}
			
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {		
		$temp;
        $datosCursos = $this->Curso->find('all');
        $this->set('cursos', $datosCursos);
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 )
        {
		    if ($this->request->is('post')) {
			
			    if ($this->request->data['Usuario']['nick'] == "") {
				    $this->request->data['Usuario']['nick'] = $this->request->data['Usuario']['email'];
			    }
			
			    if ($this->request->data['Usuario']['contrasena'] == "") {
				    $this->request->data['Usuario']['contrasena'] = $this->crearContrasena(8);	
			    }
			    $contrasenaTmp = $this->request->data['Usuario']['contrasena'];
			    //para el md5 de la contrasena de tamano 32
			    $this->request->data['Usuario']['contrasena'] = md5($this->request->data['Usuario']['contrasena']);
			    $this->request->data['Usuario']['fecha'] = date("Y-m-d H:i:s");
			
			    //creacion del usuario para ser almacenado
			    $this->Usuario->create();
			    if ($this->Usuario->save($this->request->data)) {
                    $correo = new Correo();
                    $correo->enviar($this->request->data['Usuario']['email'],'Usuario creado','UsuarioCreado',array('Usuario' =>$this->request->data['Usuario']['nombre'].' '.$this->request->data['Usuario']['apellidos'] , 'nick' => $this->request->data['Usuario']['nick'], 'contrasena'=>$contrasenaTmp),TRUE);
                    $this->Session->setFlash(__('El usuario ha sido creado.'));
				    return $this->redirect(array('action' => 'add'));
			    } else {
				    $this->Session->setFlash(__('El usuario no se ha podido crear. Por favor, intente de nuevo.'));
			    }
		    }
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	

    public function adds() {		
		$temp;
        $noCreados = "";
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 )
        {
		    $correo = new Correo();
            if (!empty($this->request->data) && is_uploaded_file($this->request->data['Usuarios']['File']['tmp_name'])) {
                 $fileData = fopen($this->request->data['Usuarios']['File']['tmp_name'], "r");
                 $header = fgetcsv($fileData);
                 while (($row = fgetcsv($fileData)) !== FALSE) {
                    $usuario['Usuario']['nick'] = $row[2];
                    $usuario['Usuario']['tipo'] = '3';
                    $usuario['Usuario']['email'] = $row[2];
                    $usuario['Usuario']['nombre'] = $row[0];
                    $usuario['Usuario']['apellidos'] = $row[1];
			        $usuario['Usuario']['contrasena'] = $this->crearContrasena(8);
                    $contrasenaTmp = $usuario['Usuario']['contrasena'];
                    $usuario['Usuario']['contrasena'] = md5($usuario['Usuario']['contrasena']);
			        $usuario['Usuario']['fecha'] = date("Y-m-d H:i:s");

			    //creacion del usuario para ser almacenado
			        $this->Usuario->create();
                    if ($this->Usuario->save($usuario)) {
                        //correo
                        $correo->enviar($usuario['Usuario']['email'],'Usuario creado','UsuarioCreado',array('Usuario' =>$usuario['Usuario']['nombre'].' '.$usuario['Usuario']['apellidos'] , 'nick' => $usuario['Usuario']['nick'], 'contrasena'=>$contrasenaTmp),TRUE);
 			    } else {
                    $noCreados .='El usuario '.$usuario['Usuario']['nick'] . ' no se ha podido crear. Podría estar repetido.<br>';
			    }
                if(!empty($this->request->data['Usuarios']['curso']))
                {
                    $idUsuario = $this->Usuario->find('all',array('conditions' => array('nick'=>$usuario['Usuario']['nick'])));
                    $matricula['Matriculas']['usuario_id']= $idUsuario[0]['Usuario']['id'];
                    $matricula['Matriculas']['curso_id']= $this->request->data['Usuarios']['curso'];
                    //pr($matricula);
                    $this->Matricula->save($matricula);
                }
                 }
                 if(strcmp("",$noCreados)==0)
                 {
                    $this->Session->setFlash(__('Todos los usuarios han sido creados.')); 
                 }                 else
                 {
                    $this->Session->setFlash(__($noCreados));
                 }
                 $this->redirect(array('action' => 'add'));
            }
            $this->redirect(array('controller' =>'usuarios','action' => 'add'));
        }
        else
        {
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
		$temp;
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 ) { //si es usuario administrador
        	$this->set('usuario', $this->Usuario->findById($_SESSION['id_usuario']));
			
		    if (!$this->Usuario->exists($id)) {
			    throw new NotFoundException(__('Usuario Inválido'));
		    }
		    if ($this->request->is(array('post', 'put'))) {
			    if ($this->request->data['Usuario']['contrasena'] == $this->request->data['Usuario']['confirmarContrasena']) {
				    if ($this->request->data['Usuario']['nick'] == "") {
					    					    /*$nick = $this->crearNick($this->request->data['Usuario']['nombre'],
											     $this->request->data['Usuario']['apellidos']);
					    $this->request->data['Usuario']['nick'] = $nick;*/
					    $this->request->data['Usuario']['nick'] = $this->request->data['Usuario']['email'];

				    }
				
				    if ($this->request->data['Usuario']['contrasena'] == "") {
					    $this->request->data['Usuario']['contrasena'] = $this->crearContrasena($this->request->data['Usuario']['nombre'],
																						       $this->request->data['Usuario']['apellidos']);	
				    }
				
				    //para el md5 de la contrasena de tamano 32
				    $this->request->data['Usuario']['contrasena'] = md5($this->request->data['Usuario']['contrasena']);
				    $this->request->data['Usuario']['fecha'] = date("Y-m-d H:i:s");
				
				    if ($this->Usuario->save($this->request->data)) {
					    $this->Session->setFlash(__('El usuario ha sido actualizado'));
					    return $this->redirect(array('controller' => 'Usuarios', 'action' => 'edit', $id));
				    } else {
					    $this->Session->setFlash(__('El usuario no se ha podido actualizar. Por favor, intente de nuevo.'));
				    }
			    } else {
			    	if($this->request->data['Usuario']['confirmarContrasena'] == "") {
			    		if ($this->Usuario->save($this->request->data)) {
						    $this->Session->setFlash(__('El usuario ha sido actualizado'));
						    return $this->redirect(array('controller' => 'Usuarios', 'action' => 'edit', $id));
					    } else {
						    $this->Session->setFlash(__('El usuario no se ha podido actualizar. Por favor, intente de nuevo.'));
					    }
			    	} else {
				    	$this->Session->setFlash(__('Las contraseñas no coinciden.'));
					}
			    }
		    } else {
			    $options = array('conditions' => array('Usuario.' . $this->Usuario->primaryKey => $id));
			    $this->request->data = $this->Usuario->find('first', $options);
		    }
        } elseif(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] >= 2 and $id == $_SESSION['id_usuario'])  {
        	$this->set('usuario', $this->Usuario->findById($_SESSION['id_usuario']));
			
        	if (!$this->Usuario->exists($id)) {
			    throw new NotFoundException(__('Usuario Inválido'));
		    }
		    if ($this->request->is(array('post', 'put'))) {
			    if ($this->request->data['Usuario']['contrasena'] == $this->request->data['Usuario']['confirmarContrasena']) {
				    //si las contraseñas coinciden se realiza el cambio de contraseña
				    $this->request->data['Usuario']['contrasena'] = md5($this->request->data['Usuario']['contrasena']);
				    $this->request->data['Usuario']['fecha'] = date("Y-m-d H:i:s");
				
				    if ($this->Usuario->save($this->request->data)) {//se guardan los datos nuevos
					    $this->Session->setFlash(__('El usuario ha sido actualizado'));
					    return $this->redirect(array('controller' => 'Usuarios', 'action' => 'edit', $id));
				    } else {
					    $this->Session->setFlash(__('El usuario no se ha podido actualizar. Por favor, intente de nuevo.'));
				    }
			    } else {//si las contraseñas no coinciden, hay dos casos
				    if($this->request->data['Usuario']['confirmarContrasena'] == "") {//se asume que no desea cambar la contraseña
			    		if ($this->Usuario->save($this->request->data)) {//y se guardan los datos
						    $this->Session->setFlash(__('El usuario ha sido actualizado'));
						    return $this->redirect(array('controller' => 'Usuarios', 'action' => 'edit', $id));
					    } else {
						    $this->Session->setFlash(__('El usuario no se ha podido actualizar. Por favor, intente de nuevo.'));
					    }
			    	} else {// la otra opción es que sí se quiere cambiar la contraseña, pero no coinciden
				    	$this->Session->setFlash(__('Las contraseñas no coinciden.'));
					}
			    }
		    } else {
			    $options = array('conditions' => array('Usuario.' . $this->Usuario->primaryKey => $id));
			    $this->request->data = $this->Usuario->find('first', $options);
		    }
        }else {
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
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 )
        {
		    $this->Usuario->id = $id;
		    if (!$this->Usuario->exists()) {
			    throw new NotFoundException(__('Invalid usuario'));
		    }
		    $this->request->allowMethod('post', 'delete');
		    if ($this->Usuario->delete()) {
			    $this->Session->setFlash(__('El usuario ha sido eliminado.'));
		    } else {
			    $this->Session->setFlash(__('El usuario no se ha podido eliminar. Por favor, intente de nuevo.'));
		    }
		    return $this->redirect(array('action' => 'index'));
        }
        else
        {
             $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	
	//para crear el nombre de usuario con el nombre y apellidos.
	public function crearNick($nombre, $apellidos) {
		$aNombre;
		$aApellidos;
		$nick;
		
		if(strpos($nombre, ' ') != FALSE){
			$aNombre = explode(' ', $nombre);
			$nick = strtolower($aNombre[0]);
		} else {
			$nick = strtolower($nombre);
		}
		
		if(strpos($apellidos, ' ') != FALSE){
			$aApellido = explode(' ', $apellidos);
			
			$nick .= '.' . strtolower($aApellido[0]);
		} else {
			$nick .= '.' . strtolower($apellidos);
		}
		
		
		return $nick;
	}

	//para crear la contrasena del usuario con nombre y apellidos.
	public function crearContrasena($length = 8) {
		$password = null;
	    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*_-=+;:,.?";
	    
	    for ($i = 0; $i < $length; $i++) {
			$password .= $chars[mt_rand(0, strlen($chars) -1)];
		}
		
	    return $password;
	}
	
	public function usuariosDelCurso($idCurso) {
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
			$idMatriculados = $this->Matricula->find('all', array ('conditions' => array('Matricula.curso_id' => $idCurso), 'fields' => array('Matricula.usuario_id')));
			$ids = array();
			foreach ($idMatriculados as $id) {
				array_push($ids, $id['Matricula']['usuario_id']);
			}				
			
			$conditions = array("Usuario.id" => $ids, 'Usuario.tipo' => 3);
			
			$this->set('usuarios', $this->Paginator->paginate('Usuario', $conditions));
			
			$infoCurso = $this->Curso->findById( $idCurso);
			$this->set('infoCurso', $infoCurso);
			$this->set('instructor', $this->Usuario->find('first', array('conditions' => array('Usuario.id' => $infoCurso['Curso']['usuario_id']))));
		}
        else
        {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	
	public function blacklist($blogforo_id=null, $usuario_id=null) {
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 ) { //si es usuario administrador
			$usuario = $this->Usuario->findById($usuario_id);
        	$this->set('usuario', $this->Usuario->findById($usuario_id));
			
		    if (!$this->Usuario->exists($usuario_id)) {
			    throw new NotFoundException(__('Usuario Inválido'));
		    }
			
			if($usuario['Usuario']['blacklisted']) {
		    	$usuario['Usuario']['blacklisted'] = FALSE;
			} else {
				$usuario['Usuario']['blacklisted'] = TRUE;
			}
			
		    if ($this->Usuario->save($usuario)) {
		    	
				if($usuario['Usuario']['blacklisted']) {
					$this->Session->setFlash(__('El usuario se agregó a la lista negra'));
					$correo = new Correo();
                    $correo->enviar($usuario['Usuario']['email'],'Lista Negra','blacklisted',array('Usuario' =>$usuario['Usuario']['nombre'].' '.$usuario['Usuario']['apellidos']),FALSE);
                    $this->Session->setFlash(__('El usuario ha sido creado.'));
				} else {
					$this->Session->setFlash(__('El usuario ha sido de removido de la lista negra'));
				}
				
			    //return $this->redirect(array('controller' => 'Usuarios', 'action' => 'view', $usuario_id));
				return $this->redirect(array('controller' => 'Blogforos', 'action' => 'view', $blogforo_id));
		    } else {
			    $this->Session->setFlash(__('El usuario no se pudo agregar a la lista negra. Por favor, intente de nuevo.'));
		    }
		    
        }
	}

}
