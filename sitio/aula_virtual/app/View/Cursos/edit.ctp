<div class="curso form">
	
	<fieldset>
		<legend><?php echo __('Editar Curso'); ?></legend>
		<?php
			echo $this->Form->create('Curso');
			echo $this->Form->input('id');
			echo $this->Form->input('nombre');
			
			$ins = array();
			foreach ($instructores as $i) {
				$ins[$i['Usuario']['id']] = $i['Usuario']['nombre'] . ' ' . $i['Usuario']['apellidos'];
			}
			
			echo $this->Form->input(
			    'usuario_id',
			    array(
			        'options' => $ins,
			        'type' => 'select',
			        'empty' => '-- Seleccione el instructor --',
			        'label' => 'Instructor'
			    )
			);
			
			echo $this->Form->input('fechainicio', array('label' => __('Inicio', true)));
			echo $this->Form->input('fechafin', array('label' => __('Fin', true)));
			echo '<br>';
		?>
		<?php echo $this->Form->end('Guardar'); ?>
	</fieldset>
</div>
<?php echo $this->element('acciones'); ?>