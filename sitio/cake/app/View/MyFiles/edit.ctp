<div class="myFiles form">
<fieldset>
	
	<legend><?php echo __('Editar Archivo'); ?></legend>
	
	<h3><?php echo $infoArchivo[0]['Curso']['nombre'] ?></h3>
	<h4><?php echo 'Usuario: ', $infoArchivo[0]['Usuario']['nombre'], ' ' ,$infoArchivo[0]['Usuario']['apellidos']; ?> </h4>
	
	<dl>		
		<dt><?php echo __('Nombre'); ?></dt>
		<dd><?php echo $infoArchivo[0]['MyFile']['name']; ?>&nbsp;</dd>
		
		<dt><?php echo __('Tamaño'); ?></dt>
		<dd><?php echo $infoArchivo[0]['MyFile']['size'], ' B'; ?>&nbsp;</dd>
	</dl>
	
<?php echo $this->Form->create('MyFile',array('action' => 'edit', 'type' => 'file')); ?>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->file('File');
		echo $this->Form->input('programas', array('label' => __('Abrir con', true)));
		echo $this->Form->input('descripcion', array('label' => __('Descripción', true)));
	?>
	<br>
	<?php echo $this->Form->end(__('Subir')); ?>
</fieldset>
</div>

<?php 
	$this->set('archivos', 1);
	$this->set('editarArchivo', 1);
	echo $this->element('acciones');
?>
