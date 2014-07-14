<?php
    session_start();
App::uses('AppController', 'Controller');
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
	
/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Blogforo->recursive = 0;
		$this->set('blogforos', $this->Paginator->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->Blogforo->exists($id)) {
			throw new NotFoundException(__('Foro inválido'));
		}
		$options = array('conditions' => array('Blogforo.' . $this->Blogforo->primaryKey => $id));
		$this->set('blogforo', $this->Blogforo->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('blogforos', $this->Paginator->paginate());
		if ($this->request->is('post')) {
			
			$this->request->data['Blogforo']['fechapublicacion'] = date("Y-m-d H:i:s");
			
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

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		if (!$this->Blogforo->exists($id)) {
			throw new NotFoundException(__('Invalid blogforo'));
		}
		
		$options = array('conditions' => array('Blogforo.' . $this->Blogforo->primaryKey => $id));
		$this->set('blogforo', $this->Blogforo->find('first', $options));
		
		if ($this->request->is(array('post', 'put'))) {
			
			$this->request->data['Blogforo']['fechapublicacion'] = date("Y-m-d H:i:s");
			
			if ($this->Blogforo->save($this->request->data)) {
				$this->Session->setFlash(__('El foro ha sido actualizado.'));
				
				//$this->view($this->request->data['Comentario']['blogforo_id']);
				
				return $this->redirect(array('action' => 'index'));
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

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
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
		
		if($this->request->is('post'))	{
			$this->request->data['Comentario']['fecha'] = date("Y-m-d H:i:s");
				
			$this->Blogforo->Comentario->create();
			
			if($this->Blogforo->Comentario->save($this->request->data))	{
				$this->view($this->request->data['Comentario']['blogforo_id']);
			}
		}
	}
}
