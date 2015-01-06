<?php
App::uses('AppModel', 'Model');
App::uses('Folder', 'Utility');
App::uses('File', 'Utility');
/**
 * Usuario Model
 *
 * @property Blogforo $Blogforo
 * @property Comentario $Comentario
 * @property Curso $Curso
 * @property Matricula $Matricula
 * @property Material $Material
 */ 
class Material extends AppModel {
	public $useTable = 'materiales';
	public $validate = array(
		'url' => array(
			// http://book.cakephp.org/2.0/en/models/data-validation.html#Validation::uploadError
			'uploadError' => array(
				'rule' => 'uploadError',
				'message' => 'Error al subir el archivo',
				'required' => FALSE,
				'allowEmpty' => TRUE,
			),/*
			// http://book.cakephp.org/2.0/en/models/data-validation.html#Validation::mimeType
			'mimeType' => array(
				'rule' => array('mimeType', array('image/gif','image/png','image/jpg','image/jpeg')),
				'message' => 'Archivo inválido, únicamente imágenes',
				'required' => FALSE,
				'allowEmpty' => TRUE,
			),*/
			// custom callback to deal with the file upload
			'processUpload' => array(
				'rule' => 'processUpload',
				'message' => 'Error procesando el archivo.',
				'required' => FALSE,
				'allowEmpty' => TRUE,
				'last' => TRUE,
			),
			//para asegurar que el archivo no existe
			'isUnique' => array(
        		'rule' => 'isUnique',
        		'allowEmpty' => true,
				'message' => 'Ya existe un archivo con ese nombre.'),
		)/*,
		 se comentó porque aún no se realizan validaciones para estos campos
		'programas' => array(
        	'email' => array(
        		'rule' => 'email',
        		'notEmpty' => true,
				'message' => 'Direccción de correo inválida.')
		),
		'descripcion' => array(
        	'isUnique' => array(
        		'rule' => 'isUnique',
        		'allowEmpty' => true,
				'message' => 'El nombre de usario ya existe.'),
		)*/
    );


	/**
	 * Upload Directory relative to WWW_ROOT
	 * @param string
	 */
	public $uploadDir = 'materiales';
	/**
	 * Before Validation Callback
	 * @param array $options
	 * @return boolean
	 */
	public function beforeValidate($options = array()) {
		// ignore empty file - causes issues with form validation when file is empty and optional
		if (!empty($this->data[$this->alias]['url']['error']) && $this->data[$this->alias]['url']['error']==4 && $this->data[$this->alias]['url']['size']==0) {
			unset($this->data[$this->alias]['url']);
		} else {
			//crear directorio para subir archivos. El nombre del directorio va a ser el id del usuario que lo subió			
			$dir = new Folder(WWW_ROOT . 'files' . DS . $this->uploadDir . DS . $_SESSION['id_usuario'], true, 0755);
			
			// Revisar si el archivo ya existe.
			$cont = 1;
			$existe = $dir->findRecursive($this->data[$this->alias]['url']['name']);
			$name = $this->data[$this->alias]['url']['name'];
			
			while (!empty($existe)){
				$existe = $dir->findRecursive($this->data[$this->alias]['url']['name']);
				
				// si ya existe, se le cambia el nombre y la url.
				if(!empty($existe)) {
					$this->data[$this->alias]['nombre'] = $cont . '_' . $name;
					$this->data[$this->alias]['url']['name'] = $cont . '_' . $name;
				}
				$cont++;
			}
		}
		return parent::beforeValidate($options);
	}
	/**
	 * Before Save Callback
	 * @param array $options
	 * @return boolean
	 */
	public function beforeSave($options = array()) {
		// a file has been uploaded so grab the filepath
		if (!empty($this->data[$this->alias]['filepath'])) {
			$this->data[$this->alias]['url'] = $this->data[$this->alias]['filepath'];
		}
		
		return parent::beforeSave($options);
	}
	/**
	 * Process the Upload
	 * @param array $check
	 * @return boolean
	 */
	public function processUpload($check=array()) {
		// deal with uploaded file
		if (!empty($check['url']['tmp_name'])) {
			// check file is uploaded
			if (!is_uploaded_file($check['url']['tmp_name'])) {
				return FALSE;
			}
			//crear directorio para subir archivos. El nombre del directorio va a ser el id del usuario que lo subió			
			$dir = new Folder(WWW_ROOT . 'files' . DS . $this->uploadDir . DS . $_SESSION['id_usuario'], true, 0755);
			
			// build full filename
			$filename = WWW_ROOT . 'files' . DS . $this->uploadDir . DS . $_SESSION['id_usuario'] . DS . Inflector::slug(pathinfo($check['url']['name'], PATHINFO_FILENAME)).'.'.pathinfo($check['url']['name'], PATHINFO_EXTENSION);
			// @todo check for duplicate filename
			// try moving file
			if (!move_uploaded_file($check['url']['tmp_name'], $filename)) {
				return FALSE;
			// file successfully uploaded
			} else {
				// save the file path relative from WWW_ROOT e.g. uploads/example_filename.jpg
				$this->data[$this->alias]['filepath'] = str_replace(DS, "/", str_replace(WWW_ROOT, "", $filename) );
			}
		}
		return TRUE;
	}

	//The Associations below have been created with all possible keys, those that are not needed can be removed

	public $displayField = 'nombre';

	public $belongsTo = array(
		'Curso' => array(
			'className' => 'Curso',
			'foreignKey' => 'curso_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Usuario' => array(
			'className' => 'Usuario',
			'foreignKey' => 'usuario_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
