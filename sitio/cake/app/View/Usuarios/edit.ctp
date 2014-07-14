<div class="usuarios form">
<?php echo $this->Form->create('Usuario'); ?>
	<fieldset>
		<legend><?php echo __('Editar Usuario'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('identificacion', array('label' => __('Identificación', true)));
		echo $this->Form->input('nombre', array('label' => __('Nombre', true)));
		echo $this->Form->input('apellidos', array('label' => __('Apellidos', true)));
		
		$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
		
		echo "<p>";
			echo "Tipo<br>" . $this->Form->select('tipo', $selectOptions);
		echo "</p>";
		
		echo $this->Form->input('nick', array('disabled' => 'disabled', 'label' => __('Usuario', true)));
		
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
<?php echo $this->element('acciones'); ?>