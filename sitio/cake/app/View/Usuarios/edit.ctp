<?php if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1){ ?>
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
            echo $this->Form->input(
			    'notificaciones',
                array('label'=>'Notificaciones')
			);
		?>
		</fieldset>
	<?php echo $this->Form->end(__('Guardar')); ?>
	</div>
	<?php echo $this->element('acciones'); ?>
<?php } else { ?>
	<div class="usuarios form">
	<?php echo $this->Form->create('Usuario'); ?>
		<fieldset>
			<legend><?php echo __('Editar Usuario'); ?></legend>
		<?php
			echo $this->Form->input('id');
			echo $this->Form->label('Identificación: '); echo ' ', $usuario['Usuario']['identificacion'], '<br>';
			echo $this->Form->label('Nombre: '); echo ' ', $usuario['Usuario']['nombre'],' ', $usuario['Usuario']['apellidos'], '<br>';
			echo $this->Form->label('Correo Electrónico: '); echo ' ', $usuario['Usuario']['email'], '<br>';
			
			$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
			
			echo $this->Form->label('Tipo: ');
			
			$tipoUsuario;
			switch($usuario['Usuario']['tipo']){
				case 1:
					$tipoUsuario = 'Administrador';
					break;
				case 2:
					$tipoUsuario = 'Instructor';
					break;
				case 3:
					$tipoUsuario = 'Estudiante';
					break;
			}
			
			echo ' ', h($tipoUsuario), '<br>';
						
			echo $this->Form->label('Usuario: '); echo ' ', $usuario['Usuario']['nick'], '<br>';
			
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
			<br>
			<?php echo $this->Form->end(__('Guardar')); ?>
		</fieldset>
	
	</div>
	<?php echo $this->element('acciones'); ?>
<?php } ?>	
