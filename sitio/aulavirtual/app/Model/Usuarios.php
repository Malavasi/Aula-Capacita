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


//The Associations below have been created with all possible keys, those that are not needed can be removed

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