<?php
session_start();
App::uses('Matriculas', 'Model');

class MatriculasController extends AppController {
    public $helpers = array('Html', 'Form');
	public $uses = array('Curso', 'Usuario', 'Matricula');
	public $components = array('Paginator');
	public $paginate = array('Usuario');
    
    public function index($id =NULL) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 ) {
        	if($id != NULL) {
		        $_SESSION['id_curso'] = $id;
		        
				$this->set('usuarios', $this->Paginator->paginate('Usuario',  array('Usuario.tipo' => 3)));
				
				$this->set('infoCurso', $this->Curso->findById( $_SESSION['id_curso']));
	        }
        } else {
			$this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
    }

    public function add($id =NULL)
    {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 )
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
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
    }

}
?>

