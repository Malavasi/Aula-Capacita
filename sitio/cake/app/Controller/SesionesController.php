<?php
App::uses('Usuarios', 'Model');
session_start();
        
class SesionesController extends AppController {
    public $helpers = array('Html', 'Form');

    public function login() {
        if ($this->request->is('post')) {
            $usuario = new Usuarios();
            $datos = $usuario->find('all', array('conditions' => array('nick' => $this->request->data['Sesiones']['nick'],'contrasena' => $this->request->data['Sesiones']['contraseña']) ) );
            $_SESSION['id_usuario']=$datos[0]['Usuarios']['id'];
            $_SESSION['tipo_usuario']=$datos[0]['Usuarios']['tipo'];
            $_SESSION['nombre_usuario']=$datos[0]['Usuarios']['nombre'].' '.$datos[0]['Usuarios']['apellidos'];
        }
        $this->redirect(array('controller' =>'Cursos','action' => 'index')); 
    }
    public function logout(){
        unset($_SESSION['id_usuario']);
        unset($_SESSION['tipo_usuario']);
        unset($_SESSION['nombre_usuario']);
        $this->redirect(array('controller' =>'inicio','action' => 'index')); 
    }

}
?>