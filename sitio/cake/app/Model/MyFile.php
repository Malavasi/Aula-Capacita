<?php
App::uses('AppModel', 'Model');
/**
 * MyFile Model
 *
 */
class MyFile extends AppModel {
	
	var $name = 'MyFile';
	
	/*public $validate = array(
        'programas' => array(
        	'message' => 'Indique con cuál programa se abre.'
		)
	);*/
/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';

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
