<?php
session_start();
        
class CursosController extends AppController {
    public $helpers = array('Html', 'Form');

    public function index() {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
                $this->set('cursos', $this->Curso->find('all'));
        }
        else
        {
                //$this->redirect(array('controller' =>'inicio','action' => 'index'));    
                $this->set('cursos', $this->Curso->find('all'));
        }
    }

    public function add() {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
            if ($this->request->is('post')) {
                $this->Curso->create();
                $this->request->data['Curso']['usuario_id'] = $_SESSION['id_usuario'];
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

