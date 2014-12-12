<?php
App::uses('AppModel', 'Model');
/**
 * Comentario Model
 *
 * @property Blogforo $Blogforo
 * @property Usuario $Usuario
 */
class Comentario extends AppModel {


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Blogforo' => array(
			'className' => 'Blogforo',
			'foreignKey' => 'blogforo_id',
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
?>
