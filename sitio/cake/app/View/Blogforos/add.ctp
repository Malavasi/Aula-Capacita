<div class="blogforos form">

	<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php echo __('Crear Tema de Discusión'); ?></legend>
		
		<?php
			echo $this->Form->input('curso_id', array('disabled' => 'disabled'));
			echo $this->Form->input('usuario_id', array('disabled' => 'disabled'));
			echo $this->Form->input('nombre curso', array('label' => __('Curso', true),'disabled' => 'disabled', 'default' => 'nombre del curso aqui'));
			echo $this->Form->input('nick', array('label' => __('Usuario', true),'disabled' => 'disabled', 'default' => 'nombre del usuario aqui'));
			echo $this->Form->input('asunto');
			echo $this->Form->input('cuerpo');
		?>
	</fieldset>
		<?php echo $this->Form->end(__('Publicar')); ?>

</div>
<?php echo $this->element('acciones'); ?>