<?php
session_start();
class AulasController extends AppController {
    public $helpers = array('Html', 'Form');

    public function index($id) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 )
        {
            $_SESSION['id_curso'] = $id;
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }

    }

}
?>