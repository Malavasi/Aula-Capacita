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
           
            if ($this->Programas->delete($id)) {
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

     public function add() {
    	
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
            if ($this->request->is('post')) {
                $this->Programas->create();
                if ($this->Programas->save($this->request->data)) {
                    $this->Session->setFlash(__('Nueva extension creado.'));
                    return $this->redirect(array('action' => 'index'));
                }
                $this->Session->setFlash(__('La extensión no se ha podido crear. Por favor, intente de nuevo.'));
            }
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));                
        }
    }


}
?>