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
				'message' => 'Únicamente letras y números (sin espacios).')),
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
			)
    );

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
		'MyFile' => array(
			'className' => 'MyFile',
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

}
