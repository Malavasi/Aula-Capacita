<?php
App::uses('Usuarios', 'Model');
App::uses('Matriculas', 'Model');
App::uses('Cursos', 'Model');
session_start();
        
class SesionesController extends AppController {
    public $helpers = array('Html', 'Form');

    public function login() {
        if ($this->request->is('post')) {
            $usuario = new Usuarios();
            $datos = $usuario->find('all', array('conditions' => array('nick' => $this->request->data['Sesiones']['nick'],'contrasena' => md5($this->request->data['Sesiones']['contrasena'])) ) );
            
            if(isset($datos[0])) {
                $_SESSION['id_usuario']=$datos[0]['Usuarios']['id'];
                $_SESSION['tipo_usuario']=$datos[0]['Usuarios']['tipo'];
                $_SESSION['nombre_usuario']=$datos[0]['Usuarios']['nombre'].' '.$datos[0]['Usuarios']['apellidos'];
            } else {
                $this->redirect(array('controller' =>'inicio','action' => 'index')); 
            }
            
            if($_SESSION['tipo_usuario'] == 3) {
                $matricula = new Matriculas();
                $datos_curso = $matricula->find('all', array('conditions' => array('usuario_id' => $_SESSION['id_usuario']) ) );
                $_SESSION['id_curso'] = $datos_curso[0]['Matriculas']['curso_id']; 
                $curso = new Cursos();
                $datos_curso = $curso->find('all', array('conditions' => array('id' => $_SESSION['id_curso']) ) );
                $_SESSION['nick_curso'] = $datos_curso[0]['Cursos']['nombre']; 
                $this->redirect(array('controller' =>'Aulas','action' => 'index/'.$_SESSION['id_curso'])); 
            }
            
        }
        $this->redirect(array('controller' =>'Cursos','action' => 'index')); 
    }
    public function logout(){
        unset($_SESSION['id_usuario']);
        unset($_SESSION['tipo_usuario']);
        unset($_SESSION['nombre_usuario']);
        unset($_SESSION['id_curso']);

        $this->redirect(array('controller' =>'inicio','action' => 'index')); 
    }

}
?>