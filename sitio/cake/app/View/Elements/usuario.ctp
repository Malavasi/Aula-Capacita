<?php
    if(isset($_SESSION['id_usuario']))
    {
        echo 'Logueado como: '.$_SESSION['nombre_usuario'];
        echo $this->Form->create('Sesiones', array('action' => 'logout'));
        echo $this->Form->end('Logout');
    }
    else
    {
        echo $this->Form->create('Sesiones', array('action' => 'login'));
        echo $this->Form->input('nick');
        echo 'Contraseña';
        echo $this->Form->password('contraseña');
        echo $this->Form->end('Login');
    }
?>