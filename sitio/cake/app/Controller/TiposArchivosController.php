<?php
App::uses('AppController', 'Controller');
 session_start();
class TiposArchivosController extends AppController {

	public $uses = array('Programas');
/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');

/**
 * index method
 *
 * @return void
 */
	public function index() {
                    
         if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
            $this->Programas->recursive = 0;
            $this->set('programas', $this->Paginator->paginate());
        } else {
            $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }

	}

    public function delete($id) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
           
            if ($this->Curso->delete($id)) {
                $this->Session->setFlash(
                    __('La extension ha sido eliminada.', h($id))
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