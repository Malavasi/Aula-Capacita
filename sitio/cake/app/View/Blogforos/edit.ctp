<div class="blogforos form">
	
<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php echo __('Editar Foro'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->hidden('curso_id', array('disabled' => 'disabled'));
		echo $this->Form->hidden('usuario_id', array('disabled' => 'disabled'));
		echo $this->Form->input('nombre curso', array('disabled' => 'disabled', 'default' => $blogforo['Curso']['nombre']));
		echo $this->Form->input('nick', array('disabled' => 'disabled', 'default' => $blogforo['Usuario']['nick']));
		echo $this->Form->input('asunto');
		
	?>
	</fieldset>
<?php echo $this->Form->end(__('Guardar')); ?>
</div>
<?php echo $this->element('acciones'); ?>