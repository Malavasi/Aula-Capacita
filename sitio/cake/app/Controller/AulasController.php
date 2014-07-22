<?php
session_start();
class AulasController extends AppController {
    public $helpers = array('Html', 'Form');

	public $uses = array('Curso');

    public function index($id) {
    	$this->set('curso', $this->Curso->find('first', array('conditions' => array('Curso.id' => $id))));
		
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