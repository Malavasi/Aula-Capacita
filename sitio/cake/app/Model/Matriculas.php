<?php
class Matriculas extends AppModel {
    public $useTable = 'matricula';

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
