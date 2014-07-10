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
			throw new NotFoundException(__('Invalid blogforo'));
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
		if ($this->request->is('post')) {
			$this->Blogforo->create();
			if ($this->Blogforo->save($this->request->data)) {
				$this->Session->setFlash(__('The blogforo has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The blogforo could not be saved. Please, try again.'));
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
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Blogforo->save($this->request->data)) {
				$this->Session->setFlash(__('The blogforo has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The blogforo could not be saved. Please, try again.'));
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
			throw new NotFoundException(__('Invalid blogforo'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Blogforo->delete()) {
			$this->Session->setFlash(__('The blogforo has been deleted.'));
		} else {
			$this->Session->setFlash(__('The blogforo could not be deleted. Please, try again.'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
	public function AjaxShowCommentForm($id)	{
		$this->layout = 'ajax';
		$this->set('blogforoID', $id);
	}
	
	public function AjaxAddComment()	{
		$this->layout = 'ajax';
		
		if($this->request->is('post'))	{
			$this->Blogforo->Comentario->create();
			
			//agregar la fecha!!!
			
			if($this->Blogforo->Comentario->save($this->request->data))	{
				echo ($this->request->data['Comentario']['comentario']);
			}
		}
	}
}
