<?php
        echo $this->Form->create('Sesiones', array('action' => 'login'));
        echo $this->Form->input('nick');
        echo 'Contraseña';
        echo $this->Form->password('contraseña');
        echo $this->Form->end('Login');  
?>