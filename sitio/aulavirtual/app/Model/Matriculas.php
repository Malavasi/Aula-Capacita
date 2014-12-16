<?php
 App::uses('AppModel', 'Model');

class Matriculas extends AppModel {
    public $useTable = 'matriculas';
	
    public $validate = array(
        'usuario_id' => array(
            'rule' => 'notEmpty'
        ),
        'curso_id' => array(
            'rule' => 'notEmpty'
        )
    );
}
?>
