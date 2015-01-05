<?php if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 2){ ?>
	<div class="usuarios form">
	<?php echo $this->Form->create('Usuario', array('type'=>'file')); ?>
		<fieldset>
			<legend><?php echo __('Editar Usuario'); ?></legend>
		<?php
			if($usuario['Usuario']['blacklisted']) {
				echo "<strong style=\"color: red\">", 'El usuario está en la lista negra', "</strong> <br>";
				if($_SESSION['tipo_usuario'] == 1) {
					echo $this->Html->link(__('Quitar de la lista negra'), array('controller' => 'Usuarios', 'action' => 'blacklist', $usuario['Usuario']['id']));
				}
			}
		?>
			
		<?php
			echo $this->Form->input('id');
			if (!empty($usuario['Usuario']['urlfoto'])) {
				echo $this->Html->image($usuario['Usuario']['urlfoto'], array('class' => 'center', 'width' => '100px'));
			}
			echo $this->Form->input('identificacion', array('label' => __('Identificación: ', true)));
			echo $this->Form->input('nombre', array('label' => __('Nombre: ', true)));
			echo $this->Form->input('apellidos', array('label' => __('Apellidos: ', true)));
			echo $this->Form->input('email', array('label' => __('Correo Electrónico: ', true)));
			
			$selectOptions = array('1'=>'Administrador', '2'=>'Instructor', '3'=>'Estudiante');
			
			if ($_SESSION['tipo_usuario'] == 1) {
				echo $this->Form->input(
				    'tipo',
				    array(
				        'options' => $selectOptions,
				        'type' => 'select',
				        'empty' => '-- Seleccione el tipo --',
				        'label' => 'Tipo: '
				    )
				);
			} else {
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
			}
			
			echo $this->Form->input('nick', array('label' => __('Usuario: ', true)));
			
			echo $this->Form->input(
			    'contrasena',
			    array(
			        'type' => 'password',
			        'label' => 'Nueva Contraseña: ',
			        'default' => ''
			    )
			);
			
			echo $this->Form->input(
			    'confirmarContrasena',
			    array(
			        'type' => 'password',
			        'label' => 'Confirmar Contraseña: ',
			        'default' => ''
			    )
			);
            echo $this->Form->input(
			    'notificaciones',
                array('label'=>'Notificaciones')
			);
			
			echo $this->Form->input('urlfoto', array('type' => 'file', 'label' => 'Foto: '));
		?>
		<?php echo $this->Form->end(__('Guardar')); ?>
		</fieldset>
	</div>
	<?php echo $this->element('acciones'); ?>
<?php } else { ?>
	<div class="usuarios form">
	<?php echo $this->Form->create('Usuario'); ?>
		<fieldset>
			<legend><?php echo __('Editar Usuario'); ?></legend>
			
			<?php
				if($usuario['Usuario']['blacklisted']) {
					echo "<strong style=\"color: red\">", 'El usuario está en la lista negra', "</strong> <br>";
					if($_SESSION['tipo_usuario'] == 1) {
						echo $this->Html->link(__('Quitar de la lista negra'), array('controller' => 'Usuarios', 'action' => 'blacklist', $usuario['Usuario']['id']));
					}
				}
			?>
			
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
			        'label' => 'Nueva Contraseña'
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
			<br>
			<?php echo $this->Form->end(__('Guardar')); ?>
		</fieldset>
	
	</div>
	<?php echo $this->element('acciones'); ?>
<?php } ?>	
