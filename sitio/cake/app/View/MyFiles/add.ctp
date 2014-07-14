<div class="myFiles form">
<fieldset>
	<legend><?php echo __('Subir Archivo'); ?></legend>
<h3><?php echo 'Usuario: '.$_SESSION['nombre_usuario']; ?> </h3>
<?php echo $this->Form->create('MyFile', array('action' => 'add', 'type' => 'file')); ?>
	<?php
			echo $this->Form->input('curso_id', array('disabled' => 'disabled'));
			echo $this->Form->input('nombre curso', array('label' => __('Curso', true), 'disabled' => 'disabled', 'default' => 'poner nombre del curso aqui'));
			echo $this->Form->file('File');
		
	?>
	
<?php echo $this->Form->end(__('Subir')); ?>
</fieldset>
</div>
<?php echo $this->element('acciones'); ?>