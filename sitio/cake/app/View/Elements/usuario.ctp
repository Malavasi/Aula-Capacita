<?php
    if(isset($_SESSION['nombre_usuario']))
    {
        echo '<div id="logout-box">';
        echo '<h3>'.$_SESSION['nombre_usuario'].'</h3>';
        echo $this->Form->create('Sesiones', array('action' => 'logout'));
        echo $this->Form->end('Salir');
        echo '</div>';
    }
   
?>
<br>
<br>
<br>
<br>