<?php
    session_start();
App::uses('AppController', 'Controller');
App::uses('Usuarios', 'Model');
/**
 * Blogforos Controller
 *
 * @property Blogforo $Blogforo
 * @property PaginatorComponent $Paginator
 */
class BlogforosController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');
	
	public $helpers = array('Js' => array('Jquery'));
	var $paginate;
/**
 * index method
 *
 * @return void
 */
	public function index($id=NULL) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 )
        {
            if($id==NULL)
            {
		        $this->Blogforo->recursive = 0;
		        $this->set('blogforos', $this->Paginator->paginate());
            }
            else
            {
                $this->set('blogforos', $this->Paginator->paginate(array ('curso_id'=>$id)));
            }
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 )
        {
		if (!$this->Blogforo->exists($id)) {
			throw new NotFoundException(__('Foro inválido'));
		}
        $_SESSION['id_curso'] = $id;
		$options = array('conditions' => array('Blogforo.' . $this->Blogforo->primaryKey => $id));
        $usuario = new Usuarios();
        $blogforo = $this->Blogforo->find('first', $options);
        $conta = 0;
        foreach ($blogforo['Comentario'] as $comentario):
            $tmp = $usuario->findById($comentario['usuario_id']);
            $blogforo['Comentario'][$conta]['nick'] = $tmp['Usuarios']['nick'];
            ++$conta;
        endforeach;
        $this->set('blogforo', $blogforo);
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
         if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 )
        {
		$this->set('blogforos', $this->Paginator->paginate());
		if ($this->request->is('post')) {
			$this->request->data['Blogforo']['fechapublicacion'] = date("Y-m-d H:i:s");
			$this->request->data['Blogforo']['curso_id'] = $_SESSION['id_curso'];
            $this->request->data['Blogforo']['usuario_id'] = $_SESSION['id_usuario'];
			var_dump($this->request->data);
			
			$this->Blogforo->create();
			if ($this->Blogforo->save($this->request->data)) {
				$this->Session->setFlash(__('El foro ha sido creado.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('El foro no se ha podido crear. Por favor, intente de nuevo.'));
			}
		}
		$cursos = $this->Blogforo->Curso->find('list');
		$usuarios = $this->Blogforo->Usuario->find('list');
		$this->set(compact('cursos', 'usuarios'));
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 )
        {
		if (!$this->Blogforo->exists($id)) {
			throw new NotFoundException(__('Invalid blogforo'));
		}
		$_SESSION['id_curso'] = $id;
		$options = array('conditions' => array('Blogforo.' . $this->Blogforo->primaryKey => $id));
		$this->set('blogforo', $this->Blogforo->find('first', $options));
		
		if ($this->request->is(array('post', 'put'))) {
			
			$this->request->data['Blogforo']['fechapublicacion'] = date("Y-m-d H:i:s");
			
			if ($this->Blogforo->save($this->request->data)) {
				$this->Session->setFlash(__('El foro ha sido actualizado.'));
				
				return $this->redirect(array('action' => 'view', $this->request->data['Blogforo']['id']));
			} else {
				$this->Session->setFlash(__('El foro no se ha podido actualizar. Por favor, intente de nuevo.'));
			}
		} else {
			$options = array('conditions' => array('Blogforo.' . $this->Blogforo->primaryKey => $id));
			$this->request->data = $this->Blogforo->find('first', $options);
		}
		$cursos = $this->Blogforo->Curso->find('list');
		$usuarios = $this->Blogforo->Usuario->find('list');
		$this->set(compact('cursos', 'usuarios'));
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=1 )
        {
            $this->Blogforo->id = $id;
		if (!$this->Blogforo->exists()) {
			throw new NotFoundException(__('Foro inválido'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Blogforo->delete()) {
			$this->Session->setFlash(__('El foro ha sido eliminado.'));
		} else {
			$this->Session->setFlash(__('El foro no se ha podido eliminar. Por favor, intente de nuevo.'));
		}
		return $this->redirect(array('action' => 'index'));
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}
	
	public function AjaxShowCommentForm($id = null)	{
		$this->layout = 'ajax';
		$this->set('blogforoID', $id);
	}
	
	public function AjaxCancel(){
		$this->layout = 'ajax';
		return 0;
	}
	
	public function AjaxAddComment($id = null)	{
		$this->layout = 'ajax';
		
		if($this->request->is('post') && isset($_SESSION['id_usuario']))	{
			$this->request->data['Comentario']['usuario_id'] = $_SESSION['id_usuario'];
			$this->request->data['Comentario']['fecha'] = date("Y-m-d H:i:s");
				
			$this->Blogforo->Comentario->create();
			
			if($this->Blogforo->Comentario->save($this->request->data))	{
				$this->view($this->request->data['Comentario']['blogforo_id']);
			}
		}
	}
    	public function editComment($id = null)	{
		 if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 )
        {
		if (!$this->Blogforo->Comentario->exists($id)) {
			throw new NotFoundException(__('Foro inválido'));
		}
		
		$options = array('conditions' => array('Comentario.' . $this->Blogforo->Comentario->primaryKey => $id));
		$this->set('comentario', $this->Blogforo->Comentario->find('first', $options));
		
		if ($this->request->is(array('post', 'put'))) {
			
			$this->request->data['Comentario']['fechapublicacion'] = date("Y-m-d H:i:s");
			
			if ($this->Blogforo->Comentario->save($this->request->data)) {
				$this->Session->setFlash(__('El comentario ha sido actualizado.'));
				
				var_dump($this->request->data);
				
				return $this->redirect(array('action' => 'view', $this->request->data['Comentario']['blogforo_id']));
			} else {
				$this->Session->setFlash(__('El comentario no se ha podido actualizar. Por favor, intente de nuevo.'));
			}
		} else {
			$options = array('conditions' => array('Comentario.' . $this->Blogforo->Comentario->primaryKey => $id));
			$this->request->data = $this->Blogforo->Comentario->find('first', $options);
		}
		$cursos = $this->Blogforo->Curso->find('list');
		$usuarios = $this->Blogforo->Usuario->find('list');
		$this->set(compact('cursos', 'usuarios'));
        }
        else
        {
                $this->redirect(array('controller' =>'inicio','action' => 'index'));    
        }
	}

}
