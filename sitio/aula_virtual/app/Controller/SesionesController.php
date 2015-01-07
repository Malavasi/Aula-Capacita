<?php
App::uses('Usuario', 'Model');
App::uses('Matriculas', 'Model');
App::uses('Cursos', 'Model');
App::uses('Bitacora', 'Model');
session_start();
        
class SesionesController extends AppController {
    public $helpers = array('Html', 'Form');

    public function login() {
        if ($this->request->is('post')) {
            $usuario = new Usuario();
            $datos = $usuario->find('all', array('conditions' => array('nick' => $this->request->data['Sesiones']['nick'],'contrasena' => md5($this->request->data['Sesiones']['contrasena'])) ) );
            
            if(isset($datos[0])) {
                $bitacora = new Bitacora();
                $informacionBitacora = $bitacora->find('all',array('conditions' => array ('id_usuario' => $datos[0]['Usuario']['id'])));
                $bita['Bitacora']['ultimo_acceso'] = date("Y-m-d H:i:s"); 
                if(isset($informacionBitacora[0]))
                {
                    $informacionBitacora[0]['Bitacora']['ultimo_acceso'] = date("Y-m-d H:i:s"); 
                    $informacionBitacora[0]['Bitacora']['cantidad_accesos']= $informacionBitacora[0]['Bitacora']['cantidad_accesos']+1;
                    $bitacora->save($informacionBitacora[0]);
                }
                else
                {
                    $bita['Bitacora']['id_usuario']= $datos[0]['Usuario']['id'];
                    $bita['Bitacora']['cantidad_accesos']= '1';
                    $bitacora->save($bita);
                }
                $_SESSION['id_usuario']=$datos[0]['Usuario']['id'];
                $_SESSION['tipo_usuario']=$datos[0]['Usuario']['tipo'];
                $_SESSION['nombre_usuario']=$datos[0]['Usuario']['nombre'].' '.$datos[0]['Usuario']['apellidos'];
				$_SESSION['blacklisted']=$datos[0]['Usuario']['blacklisted'];
            } else {
            	$this->Session->setFlash(__('Usuario o contraseña incorrecta.'));
                $this->redirect(array('controller' =>'inicio','action' => 'index')); 
            }
			
            if($_SESSION['tipo_usuario'] == 0) {
                
            } elseif($_SESSION['tipo_usuario'] >= 2) {
            	$curso = new Cursos();
				$datos_curso = $curso->find('first', array('conditions' => array('usuario_id' => $_SESSION['id_usuario']) ) );					 
				
				$this->redirect(array('controller' =>'Cursos','action' => 'index'));
				
				if(count($datos_curso['Cursos']['id']) <= 1 ) {
					$_SESSION['id_curso'] = $datos_curso['Cursos']['id'];
					$this->redirect(array('controller' =>'Aulas','action' => 'index', $datos_curso['Cursos']['id']));
				} else {
					$this->redirect(array('controller' =>'Cursos','action' => 'index'));
				}
            }
        }
        $this->redirect(array('controller' =>'Cursos','action' => 'index')); 
    }

    public function logout(){
        unset($_SESSION['id_usuario']);
        unset($_SESSION['tipo_usuario']);
        unset($_SESSION['nombre_usuario']);
        unset($_SESSION['id_curso']);
		unset($_SESSION['blacklisted']);

        $this->redirect(array('controller' =>'inicio','action' => 'index')); 
    }

}
?>