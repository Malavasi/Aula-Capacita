<div class="usuarios form">
<?php echo $this->Form->create('Usuario'); ?>
	<fieldset>
		<legend><?php echo __('Crear Usuario'); ?></legend>
	<?php
		echo $this->Form->input('identificacion', array('label' => __('Identificación', true)));
		echo $this->Form->input('nombre', array('label' => __('Nombre', true)));
		echo $this->Form->input('apellidos', array('label' => __('Apellidos', true)));
		
		$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
		
		echo "<p>";
			echo "Tipo<br>" . $this->Form->select('tipo', $selectOptions);
		echo "</p>";
		
		echo $this->Form->input('nick', array('label' => __('Usuario', true)));
		
		echo "<p>";
			echo "Contraseña<br>" . $this->Form->password('contrasena');
		echo "</p>";
		
	?>
	</fieldset>
	
	<?php echo $this->Form->end(__('Crear')); ?>
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

<?php echo $this->Js->writeBuffer(); ?>