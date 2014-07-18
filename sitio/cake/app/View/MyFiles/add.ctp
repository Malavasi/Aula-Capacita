<div class="myFiles form">
<fieldset>
	<legend><?php echo __('Subir Archivo'); ?></legend>
	<h3><?php echo $infoArchivo[0]['Curso']['nombre'] ?></h3>
	<h4><?php echo 'Usuario: ', $infoArchivo[0]['Usuario']['nombre'], ' ' ,$infoArchivo[0]['Usuario']['apellidos']; ?> </h4>
	<?php echo $this->Form->create('MyFile', array('action' => 'add', 'type' => 'file')); ?>
	<?php
		echo $this->Form->file('File');
	?>
	
<?php echo $this->Form->end(__('Subir')); ?>
</fieldset>
</div>
<?php echo $this->element('acciones'); ?>