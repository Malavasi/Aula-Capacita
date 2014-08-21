<div class="blogforos form">
	
<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php echo __('Editar Foro'); ?></legend>
		
		<dl>
			<dt><?php echo __('Curso'); ?></dt>
			<dd><?php echo $blogforo['Curso']['nombre']; ?>&nbsp;</dd>
			
			<dt><?php echo __('Usuario'); ?></dt>
			<dd><?php echo $blogforo['Usuario']['nick']; ?>&nbsp;</dd>
		</dl>
		<br>
		
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('asunto');
		echo $this->Form->input('cuerpo');
	?>
	<?php echo $this->Form->end(__('Guardar')); ?>
	</fieldset>
</div>
<?php echo $this->element('acciones'); ?>