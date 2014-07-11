<div class="usuarios form">
<?php echo $this->Form->create('Usuario'); ?>
	<fieldset>
		<legend><?php echo __('Editar Usuario'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('identificacion');
		echo $this->Form->input('nombre');
		echo $this->Form->input('apellidos');
		
		$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
		
		echo "<p>";
			echo "Tipo<br>" . $this->Form->select('tipo', $selectOptions);
		echo "</p>";
		
		echo $this->Form->input('nick', array('disabled' => 'disabled'));
		
		echo "<p>";
			echo "Contraseña<br>" . $this->Form->password('contrasena');
		echo "</p>";
		
		echo "<p>";
			echo "Confirmar Contraseña<br>" . $this->Form->password('confirmarContrasena');
		echo "</p>";
	?>
	</fieldset>
<?php echo $this->Form->end(__('Guardar')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Crear Usuario'), array('controller' => 'usuarios', 'action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('Consultar Usuarios'), array('controller' => 'usuarios', 'action' => 'index')); ?></li>
		<!--
		<li><?php echo $this->Html->link(__('Crear Curso'), array('controller' => 'cursos', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('Consultar Cursos'), array('controller' => 'cursos', 'action' => 'index')); ?> </li>
		-->
	</ul>
</div>