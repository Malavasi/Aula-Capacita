<div class="myFiles form">
<fieldset>
	<legend><?php echo __('Editar Archivo'); ?></legend>
<h3><?php echo 'Usuario: '.$_SESSION['nombre_usuario']; ?> </h3>
<?php echo $this->Form->create('MyFile'); ?>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('curso_id', array('disabled' => 'disabled'));
		echo $this->Form->input('nombre curso', array('label' => __('Curso', true), 'disabled' => 'disabled', 'default' => 'poner nombre del curso aqui'));
		echo $this->Form->input('name', array('label' => __('Nombre', true), 'disabled' => 'disabled'));
		echo $this->Form->input('size', array('label' => __('Tamaño', true), 'disabled' => 'disabled'));
		echo $this->Form->file('File');
	?>
	
<?php echo $this->Form->end(__('Subir')); ?>
</fieldset>
</div>
<?php 
$this->set('editaArchivo', 1);
echo $this->element('acciones'); 
?>