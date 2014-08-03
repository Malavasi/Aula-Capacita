<div class="myFiles form">
<fieldset>
	<legend><?php echo __('Subir Archivo'); ?></legend>
	<h3><?php echo $infoCurso['Curso']['nombre'] ?></h3>
	<h4><?php echo 'Usuario: ', $_SESSION['nombre_usuario']; ?> </h4>
	<?php echo $this->Form->create('MyFile', array('action' => 'add', 'type' => 'file')); ?>
	<?php
		echo $this->Form->file('File');
	?>
</fieldset>
<?php echo $this->Form->end(__('Subir')); ?>
</div>

<?php 
	$this->set('archivos', 1);
	echo $this->element('acciones');
?>
