<?php
App::uses('AppModel', 'Model');
/**
* Usuario Model
*
* @property Curso $Curso
* @property Matricula $Matricula
* @property Comentario $Comentario
*/
class Usuarios extends AppModel {
	//var $actsAs = array ('Searchable');

//The Associations below have been created with all possible keys, those that are not needed can be removed
	public $validate = array(
        'identificacion' => array(
        	'alphaNumeric' => array(
        		'rule' => 'alphaNumeric',
        		'allowEmpty' => true,
				'message' => 'Únicamente letras y números (sin espacios).')),
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