<div class="usuarios form">
<?php echo $this->Form->create('Usuario', array('type'=>'file')); ?>
	<fieldset>
		<legend><?php echo __('Crear Usuario'); ?></legend>
	<?php
		echo $this->Form->input('identificacion', array('label' => __('Identificación: ', true)));
		echo $this->Form->input('nombre', array('label' => __('Nombre: ', true)));
		echo $this->Form->input('apellidos', array('label' => __('Apellidos: ', true)));
		echo $this->Form->input('email', array('label' => __('Correo Electrónico: ', true)));
		
		$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
		
		echo $this->Form->input(
		    'tipo',
		    array(
		        'options' => $selectOptions,
		        'type' => 'select',
		        'empty' => '-- Seleccione el tipo --',
		        'label' => 'Tipo: '
		    )
		);
		
		echo $this->Form->input('nick', array('label' => __('Usuario: ', true), 'default' => ''));
		
		echo $this->Form->input(
		    'contrasena',
		    array(
		        'type' => 'password',
		        'label' => 'Contraseña: '
		    )
		);
		
		echo $this->Form->input('urlfoto', array('type' => 'file', 'label' => 'Foto: '));
	?>
		<br>
		<?php echo $this->Form->end(__('Crear')); ?>
	</fieldset>
	<fieldset>
		<legend><?php echo __('Crear Usuarios'); ?></legend>
        <?php echo $this->Form->create('Usuarios', array('action' => 'adds', 'type' => 'file')); ?>
		<?php
			echo $this->Form->file('File');
            foreach($cursos as $cur)
            {
                $curso[$cur['Curso']['id']] =$cur['Curso']['nombre'];
            }
		    echo $this->Form->input(
		    'curso',
		    array(
		        'options' => $curso,
		        'type' => 'select',
		        'empty' => 'Ninguno',
		        'label' => 'Cursos: '
		    )
		);
		?>
		<br>
		<?php echo $this->Form->end(__('Subir')); ?>
	</fieldset>
</div>
<?php echo $this->element('acciones'); ?>
