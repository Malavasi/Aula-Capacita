<?php
class Cursos extends AppModel {
    public $validate = array(
        'nombre' => array(
            'rule' => 'notEmpty'
        ),
        'fechainicio' => array(
            'rule' => 'notEmpty'
        )
    );
}
?>