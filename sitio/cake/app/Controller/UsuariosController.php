<?php
session_start();
App::uses('AppController', 'Controller');
/**
 * Usuarios Controller
 *
 * @property Usuario $Usuario
 * @property PaginatorComponent $Paginator
 */
class UsuariosController extends AppController {

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
		$this->Usuario->recursive = 0;
		$this->set('usuarios', $this->Paginator->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->Usuario->exists($id)) {
			throw new NotFoundException(__('Usuario Inválido'));
		}
		$options = array('conditions' => array('Usuario.' . $this->Usuario->primaryKey => $id));
		$this->set('usuario', $this->Usuario->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Usuario->create();
			if ($this->Usuario->save($this->request->data)) {
				$this->Session->setFlash(__('El usuario ha sido guardado.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('El usuario no se ha podido guardar. Por favor, intente de nuevo.'));
			}
		}
	}
	
	public function addContinue() {
		if ($this->request->is('post')) {
			$this->Usuario->create();
			if ($this->Usuario->save($this->request->data)) {
				$this->Session->setFlash(__('El usuario ha sido guardado.'));
				return $this->redirect(array('action' => 'add'));
			} else {
				$this->Session->setFlash(__('El usuario no se ha podido guardar. Por favor, intente de nuevo.'));
			}
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
		if (!$this->Usuario->exists($id)) {
			throw new NotFoundException(__('Usuario Inválido'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Usuario->save($this->request->data)) {
				$this->Session->setFlash(__('El usuario ha sido actualizado'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('El usuario no se ha podido guardar. Por favor, intente de nuevo.'));
			}
		} else {
			$options = array('conditions' => array('Usuario.' . $this->Usuario->primaryKey => $id));
			$this->request->data = $this->Usuario->find('first', $options);
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
		$this->Usuario->id = $id;
		if (!$this->Usuario->exists()) {
			throw new NotFoundException(__('Invalid usuario'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Usuario->delete()) {
			$this->Session->setFlash(__('El usuario ha sido eliminado.'));
		} else {
			$this->Session->setFlash(__('El usuario no se ha podido eliminar. Por favor, intente de nuevo.'));
		}
		return $this->redirect(array('action' => 'index'));
	}
}
