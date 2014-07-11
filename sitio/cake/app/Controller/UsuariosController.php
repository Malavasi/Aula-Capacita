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
		$temp;
		
		if ($this->request->is('post')) {
			
			if ($this->request->data['Usuario']['nick'] == "") {
				$nick = $this->crearNick($this->request->data['Usuario']['nombre'],
										 $this->request->data['Usuario']['apellidos']);
				$this->request->data['Usuario']['nick'] = $nick;
			}
			
			if ($this->request->data['Usuario']['contrasena'] == "") {
				$this->request->data['Usuario']['contrasena'] = $this->crearContrasena($this->request->data['Usuario']['nombre'],
																					   $this->request->data['Usuario']['apellidos']);	
			}
			
			//para el md5 de la contrasena de tamano 32
			$this->request->data['Usuario']['contrasena'] = md5($this->request->data['Usuario']['contrasena']);
			$this->request->data['Usuario']['fecha'] = date("Y-m-d H:i:s");
			
			//creacion del usuario para ser almacenado
			$this->Usuario->create();
			if ($this->Usuario->save($this->request->data)) {
				$this->Session->setFlash(__('El usuario ha sido creado.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('El usuario no se ha podido crear. Por favor, intente de nuevo.'));
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
		$temp;
		
		if (!$this->Usuario->exists($id)) {
			throw new NotFoundException(__('Usuario Inválido'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->request->data['Usuario']['contrasena'] == $this->request->data['Usuario']['confirmarContrasena']) {
				if ($this->request->data['Usuario']['nick'] == "") {
					$nick = $this->crearNick($this->request->data['Usuario']['nombre'],
											 $this->request->data['Usuario']['apellidos']);
					$this->request->data['Usuario']['nick'] = $nick;
				}
				
				if ($this->request->data['Usuario']['contrasena'] == "") {
					$this->request->data['Usuario']['contrasena'] = $this->crearContrasena($this->request->data['Usuario']['nombre'],
																						   $this->request->data['Usuario']['apellidos']);	
				}
				
				//para el md5 de la contrasena de tamano 32
				$this->request->data['Usuario']['contrasena'] = md5($this->request->data['Usuario']['contrasena']);
				$this->request->data['Usuario']['fecha'] = date("Y-m-d H:i:s");
				
				if ($this->Usuario->save($this->request->data)) {
					$this->Session->setFlash(__('El usuario ha sido actualizado'));
					return $this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash(__('El usuario no se ha podido guardar. Por favor, intente de nuevo.'));
				}
			} else {
				$this->Session->setFlash(__('Las contraseñas no coinciden.'));
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
	
	public function AjaxAddUser() {
		$this->layout = 'ajax';
		
		if($this->request->is('post'))	{
			$this->request->data['Usuario']['fecha'] = date("Y-m-d H:i:s");
				
			$this->Blogforo->Comentario->create();
			
			if($this->Blogforo->Comentario->save($this->request->data))	{
				//echo ($this->request->data['Comentario']['comentario']);
			}
		}
	}
	
	//para crear el nombre de usuario con el nombre y apellidos.
	public function crearNick($nombre, $apellidos) {
		$aNombre;
		$aApellidos;
		$nick;
		
		if(strpos($nombre, ' ') != FALSE){
			$aNombre = explode(' ', $nombre);
			$nick = strtolower($aNombre[0]);
		} else {
			$nick = strtolower($nombre);
		}
		
		if(strpos($apellidos, ' ') != FALSE){
			$aApellido = explode(' ', $apellidos);
			
			$nick .= '.' . strtolower($aApellido[0]);
		} else {
			$nick .= '.' . strtolower($apellidos);
		}
		
		
		return $nick;
	}

	//para crear la contrasena del usuario con nombre y apellidos.
	public function crearContrasena($nombre, $apellidos) {
		$aNombre;
		$aApellidos;
		$contrasena;
		
		if(strpos($nombre, ' ') != FALSE){
			$aNombre = explode(' ', $nombre);
			$nick = strtoupper($aNombre[0]);
		} else {
			$nick = strtoupper($nombre);
		}
		
		if(strpos($apellidos, ' ') != FALSE){
			$aApellido = explode(' ', $apellidos);
			
			$nick .= '.' . strtoupper($aApellido[0]);
		} else {
			$nick .= '.' . strtoupper($apellidos);
		}
		
		
		return $nick;
	}
}
