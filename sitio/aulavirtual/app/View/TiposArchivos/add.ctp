<div class="tiposArchivos form">
<?php echo $this->Form->create('Programas'); ?>
	<fieldset>
		<legend><?php echo __('Crear Extension'); ?></legend>
	<?php
		echo $this->Form->input('extension', array('label' => __('Extensión ', true),'type'=>'text'));
		echo $this->Form->input('programas', array('label' => __('Programas ', true)));
		
	?>
		<br>
		<?php echo $this->Form->end(__('Crear')); ?>
	</fieldset>
	
</div>
<?php echo $this->element('acciones'); ?>
