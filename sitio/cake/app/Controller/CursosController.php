<?php
session_start();
        
class CursosController extends AppController {
    public $helpers = array('Html', 'Form');
	
	public $uses = array('Curso', 'Usuario', 'Matricula');
	
	public $components = array('Paginator');
	public $paginate = array('Curso');


    public function index() {
        if(isset($_SESSION['tipo_usuario'])) {
        	if( $_SESSION['tipo_usuario']==1 ) {
	            $this->set('cursos', $this->Paginator->paginate());
	        } elseif($_SESSION['tipo_usuario'] == 2) {
	        	$this->set('cursos', $this->Paginator->paginate('Curso',  array('Curso.usuario_id' => $_SESSION['id_usuario'])));
	        }
		}
        pr($_SESSION);
    }

    public function add() {
    	
		$this->set('instructores', $this->Usuario->find('all', array('conditions' => array('Usuario.tipo' => 2))));
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
            if ($this->request->is('post')) {
                $this->Curso->create();
                if ($this->Curso->save($this->request->data)) {
                    $this->Session->setFlash(__('Nuevo curso creado.'));
                    return $this->redirect(array('action' => 'index'));
                }
                $this->Session->setFlash(__('No se pudo crear el curso'));
            }
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));                
        }
    }

    public function edit($id = null) {
    	$this->set('instructores', $this->Usuario->find('all', array('conditions' => array('Usuario.tipo' => 2))));
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
            if (!$id) {
                throw new NotFoundException(__('Invalid post'));
            }

            $curso = $this->Curso->findById($id);
            if (!$curso) {
                throw new NotFoundException(__('Invalid post'));
            }

            if ($this->request->is(array('post', 'put'))) {
                $this->Curso->id = $id;
                if ($this->Curso->save($this->request->data)) {
                    $this->Session->setFlash(__('El curso ha sido actualizado.'));
                    return $this->redirect(array('action' => 'index'));
                }
                $this->Session->setFlash(__('No se pudo actualizar el curso'));
            }

            if (!$this->request->data) {
                $this->request->data = $curso;
            }

 
        }
        else
        {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));     
        }
    }


    public function delete($id) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
           if ($this->request->is('get')) {
                throw new MethodNotAllowedException();
            }

            if ($this->Curso->delete($id)) {
                $this->Session->setFlash(
                    __('El curso ha sido eliminado.', h($id))
                );
                return $this->redirect(array('action' => 'index'));
            }

        }
        else
        {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));     
        }
    }
}
?>

