<?php
session_start();
class InicioController extends AppController {
    public $helpers = array('Html', 'Form');

    public function index() {
        if(isset($_SESSION['id_usuario'])) {
            if($_SESSION['tipo_usuario'] == 3) {
                $this->redirect(array('controller' =>'Aulas','action' => 'index/'.$_SESSION['id_curso'])); 
            }
            else {
                $this->redirect(array('controller' =>'Cursos','action' => 'index')); 
            }
        }
    }

}
?>