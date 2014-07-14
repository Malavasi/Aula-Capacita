<?php
    session_start();
    App::uses('Usuarios', 'Model');
    App::uses('Matriculas', 'Model');
class MatriculasController extends AppController {
    public $helpers = array('Html', 'Form');
    
    public function index($id =NULL) {
        if($id != NULL)
        {
        $_SESSION['id_curso'] = $id;
        $usuario = new Usuarios();
        $this->set('usuarios', $usuario->find('all',array('conditions' => array('tipo' => 3))));
        }
    }

    public function add($id =NULL)
    {

        $datos = array('Matriculas'=>array('usuario_id'=>$id,'curso_id'=>$_SESSION['id_curso']));
        $matriculas = new Matriculas();
        if ($matriculas->save($datos)) {
				    $this->Session->setFlash(__('El usuario ha sido matriculado.'));
				    return $this->redirect(array('action' => 'index/'.$_SESSION['id_curso']));
			    } else {
				    $this->Session->setFlash(__('El usuario no se ha podido agregar correctamente'));
			    }
    }

}
?>

