<div class="usuarios form">
<?php echo $this->Form->create('Usuario'); ?>
	<fieldset>
		<legend><?php echo __('Editar Usuario'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('identificacion', array('label' => __('Identificación', true)));
		echo $this->Form->input('nombre', array('label' => __('Nombre', true)));
		echo $this->Form->input('apellidos', array('label' => __('Apellidos', true)));
		echo $this->Form->input('email', array('label' => __('Correo Electrónico', true)));
		
		$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
		
		echo $this->Form->input(
		    'tipo',
		    array(
		        'options' => $selectOptions,
		        'type' => 'select',
		        'empty' => '-- Seleccione el tipo --',
		        'label' => 'Tipo'
		    )
		);
		
		echo $this->Form->input('nick', array('label' => __('Usuario', true)));
		
		echo $this->Form->input(
		    'contrasena',
		    array(
		        'type' => 'password',
		        'label' => 'Contraseña'
		    )
		);
		
		echo $this->Form->input(
		    'confirmarContrasena',
		    array(
		        'type' => 'password',
		        'label' => 'Confirmar Contraseña'
		    )
		);
	?>
	</fieldset>
<?php echo $this->Form->end(__('Guardar')); ?>
</div>
<?php echo $this->element('acciones'); ?>