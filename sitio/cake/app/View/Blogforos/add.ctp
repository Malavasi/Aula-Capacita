<div class="blogforos form">

	<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php  echo __('Crear Tema de Discusión'); ?></legend>
		
		<?php
			echo $this->Form->input('asunto');
			echo $this->Form->input('cuerpo');
		?>
	</fieldset>
		<?php echo $this->Form->end(__('Publicar')); ?>

</div>
<?php echo $this->element('acciones'); ?>