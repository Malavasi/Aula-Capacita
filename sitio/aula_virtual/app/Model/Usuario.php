<?php
App::uses('AppModel', 'Model');
/**
 * Usuario Model
 *
 * @property Blogforo $Blogforo
 * @property Comentario $Comentario
 * @property Curso $Curso
 * @property Matricula $Matricula
 * @property MyFile $MyFile
 */
class Usuario extends AppModel {

	public $validate = array(
        'identificacion' => array(
        	'alphaNumeric' => array(
        		'rule' => 'alphaNumeric',
        		'allowEmpty' => true,
				'message' => 'Únicamente letras y números (sin espacios).')
		),
		'tipo' => array(
	        'rule' => array('multiple', array(
	            'in'  => array('1', '2', '3'),
	            'min' => 1,
	            'max' => 1
	        )),
	        'message' => 'Debe seleccionar un tipo de usuario.'
	    ),
		'email' => array(
        	'email' => array(
        		'rule' => 'email',
        		'notEmpty' => true,
				'message' => 'Direccción de correo inválida.')),
		'nick' => array(
        	'isUnique' => array(
        		'rule' => 'isUnique',
        		'allowEmpty' => true,
				'message' => 'El nombre de usario ya existe.'),
			),
		'urlfoto' => array(
			// http://book.cakephp.org/2.0/en/models/data-validation.html#Validation::uploadError
			'uploadError' => array(
				'rule' => 'uploadError',
				'message' => 'Error al subir el archivo',
				'required' => FALSE,
				'allowEmpty' => TRUE,
			),
			/*/ http://book.cakephp.org/2.0/en/models/data-validation.html#Validation::mimeType
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
			)
		)
    );


	/**
	 * Upload Directory relative to WWW_ROOT
	 * @param string
	 */
	public $uploadDir = 'fotos_instructores';
	/**
	 * Before Validation Callback
	 * @param array $options
	 * @return boolean
	 */
	public function beforeValidate($options = array()) {
		// ignore empty file - causes issues with form validation when file is empty and optional
		if (!empty($this->data[$this->alias]['urlfoto']['error']) && $this->data[$this->alias]['urlfoto']['error']==4 && $this->data[$this->alias]['urlfoto']['size']==0) {
			unset($this->data[$this->alias]['urlfoto']);
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
			$this->data[$this->alias]['urlfoto'] = $this->data[$this->alias]['filepath'];
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
		if (!empty($check['urlfoto']['tmp_name'])) {
			// check file is uploaded
			if (!is_uploaded_file($check['urlfoto']['tmp_name'])) {
				return FALSE;
			}
			// build full filename
			$filename = WWW_ROOT . 'img' . DS . $this->uploadDir . DS . Inflector::slug(pathinfo($check['urlfoto']['name'], PATHINFO_FILENAME)).'.'.pathinfo($check['urlfoto']['name'], PATHINFO_EXTENSION);
			// @todo check for duplicate filename
			// try moving file
			if (!move_uploaded_file($check['urlfoto']['tmp_name'], $filename)) {
				return FALSE;
			// file successfully uploaded
			} else {
				// save the file path relative from WWW_ROOT e.g. uploads/example_filename.jpg
				$path = str_replace('/img', '', $filename);//quito el '/img' para poder usar la función de cake que muestra ima´genes
				$this->data[$this->alias]['filepath'] = str_replace(DS, "/", str_replace(WWW_ROOT, "", $path) );
			}
		}
		return TRUE;
	}

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'Blogforo' => array(
			'className' => 'Blogforo',
			'foreignKey' => 'usuario_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'Comentario' => array(
			'className' => 'Comentario',
			'foreignKey' => 'usuario_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'Curso' => array(
			'className' => 'Curso',
			'foreignKey' => 'usuario_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'Matricula' => array(
			'className' => 'Matricula',
			'foreignKey' => 'usuario_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'Material' => array(
			'className' => 'Material',
			'foreignKey' => 'usuario_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);
    /**
    * hasOne associations
    *
    * @var array
    */
	public $hasOne = array(
		'Curso' => array(
		'className' => 'Curso',
		'foreignKey' => 'usuario_id',
		'conditions' => '',
		'fields' => '',
		'order' => ''
		)
	);
}
