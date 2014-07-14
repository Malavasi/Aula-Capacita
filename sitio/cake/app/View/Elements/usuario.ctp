<?php
    if(isset($_SESSION['nombre_usuario']))
    {
        echo 'Logueado como: '.$_SESSION['nombre_usuario'];
        echo $this->Form->create('Sesiones', array('action' => 'logout'));
        echo $this->Form->end('Logout');
    }
   
?>