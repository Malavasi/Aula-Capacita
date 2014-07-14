<?php
session_start();
class AulasController extends AppController {
    public $helpers = array('Html', 'Form');

    public function index($id) {
        $_SESSION['id_curso'] = $id;

    }

}
?>