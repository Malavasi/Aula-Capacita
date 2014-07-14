<div class="myFiles form">
<?php echo $this->Form->create('MyFile'); ?>
	<fieldset>
		<legend><?php echo __('Editar Archivo'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('curso_id', array('disabled' => 'disabled'));
		echo $this->Form->input('usuario_id', array('disabled' => 'disabled'));
		echo $this->Form->input('nombre curso', array('label' => __('Curso', true), 'disabled' => 'disabled', 'default' => 'poner nombre del curso aqui'));
		echo $this->Form->input('nick', array('label' => __('Usuario', true), 'disabled' => 'disabled', 'default' => 'poner nick del usuario aqui'));
		echo $this->Form->input('name', array('label' => __('Nombre', true), 'disabled' => 'disabled'));
		echo $this->Form->input('size', array('label' => __('Tamaño', true), 'disabled' => 'disabled'));
		echo $this->Form->file('File');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Subir')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $this->Form->value('MyFile.id')), array(), __('¿Desea eliminar el archivo %s?', $this->Form->value('MyFile.name'))); ?></li>
		<li><?php echo $this->Html->link(__('Consultar Archivos'), array('action' => 'index')); ?></li>
	</ul>
</div>
