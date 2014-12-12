<h3 align="right" style="margin-right: 40px;">
	<?php
		if(isset($_SESSION['nombre_usuario'])) {
			echo $this->Html->link(__($_SESSION['nombre_usuario']), array('controller' => 'Usuarios','action' => 'edit', $_SESSION['id_usuario']));
			echo '&nbsp; - &nbsp;';
		    echo $this->Html->link(__('Salir'), array('controller' => 'Sesiones','action' => 'logout'));
		}
    ?>
</h3>