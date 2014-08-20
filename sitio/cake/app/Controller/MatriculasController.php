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
		       
				$idMatriculados = $this->Matricula->find('all', array ('fields' => array('Matricula.usuario_id')));
				$ids = array();
				foreach ($idMatriculados as $id) {
					array_push($ids, $id['Matricula']['usuario_id']);
				}				
				
				$conditions = array("NOT" => array( "Usuario.id" => $ids), array('Usuario.tipo' => 3));
				
				$this->set('usuarios', $this->Paginator->paginate('Usuario', $conditions));
				$this->set('infoCurso', $this->Curso->findById( $_SESSION['id_curso']));
	        }
        } else {
			$this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
    }

    public function add($id =NULL)
    {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 ) {
        	$datos = array('Matriculas'=>array('usuario_id'=>$id,'curso_id'=>$_SESSION['id_curso']));
        	$matriculas = new Matriculas();
        	
        	if ($matriculas->save($datos)) {
			    $this->Session->setFlash(__('El usuario ha sido matriculado.'));
			    return $this->redirect(array('action' => 'index/'.$_SESSION['id_curso']));
		    } else {
			    $this->Session->setFlash(__('El usuario no se ha podido agregar correctamente'));
		    }

        }
        else {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
    }
	
	public function delete($idCurso = null, $idUsuario = null){
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 1) {
			$matricula = $this->Matricula->find('first', array ('conditions' => array('Matricula.curso_id' => $idCurso, 'Matricula.usuario_id', $idUsuario), 'fileds' => array('Matricula.id')));
		    
			echo $this->Matricula->id = $matricula['Matricula']['id'];
			
			$this->Matricula->id = $matricula['Matricula']['id'];
		    
		    if (!$this->Matricula->exists()) {
			    throw new NotFoundException(__('Usuario inválido'));
		    }
		    $this->request->allowMethod('post', 'delete');
		    if ($this->Matricula->delete()) {
			    $this->Session->setFlash(__('El usuario ha sido desmatriculado.'));
		    } else {
			    $this->Session->setFlash(__('El usuario no se ha podido desmatricular. Por favor, intente de nuevo.'));
		    }
		    //return $this->redirect(array('controller' => 'Usuarios', 'action' => 'index'));
		} else {
             //$this->redirect(array('controller' =>'Usuarios', 'action' => 'index'));    
        }
	}
	
	public function deleteMatricula() {
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 ) {
		    
			
        } else {
             $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

}
?>

