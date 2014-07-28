<div id="logout-box">
<?php
    if(isset($_SESSION['nombre_usuario']))
    {
        echo 'Usuario: '.$_SESSION['nombre_usuario'];
        echo $this->Form->create('Sesiones', array('action' => 'logout'));
        echo $this->Form->end('Salir');
    }
   
?>
</div>
<br>
<br>
<br>
<br>