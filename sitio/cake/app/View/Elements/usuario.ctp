<div id="logout-box">
<?php
    if(isset($_SESSION['nombre_usuario']))
    {
        echo '<h3>Usuario: '.$_SESSION['nombre_usuario'].'</h3>';
        echo $this->Form->create('Sesiones', array('action' => 'logout'));
        echo $this->Form->end('Salir');
    }
   
?>
</div>
<br>
<br>
<br>
<br>