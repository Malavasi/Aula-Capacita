<?php
session_start();
class AulasController extends AppController {
    public $helpers = array('Html', 'Form');

	public $uses = array('Curso');

    public function index($id) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 3 ) {
            if($_SESSION['tipo_usuario']>1 and $_SESSION['id_curso'] != $id) {
                $this->redirect(array('controller' =>'aulas','action' => 'index/'.$_SESSION['id_curso'])); 
            }
            $_SESSION['id_curso'] = $id;
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
        $this->set('curso', $this->Curso->find('first', array('conditions' => array('Curso.id' => $_SESSION['id_curso']))));
		
    }

}
?>