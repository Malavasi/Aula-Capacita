<div class="myFiles form">
<?php echo $this->Form->create('MyFile', array('action' => 'add', 'type' => 'file')); ?>
	<fieldset>
		<legend><?php echo __('Subir Archivo'); ?></legend>
		
		<?php
			echo $this->Form->input('curso_id', array('disabled' => 'disabled'));
			echo $this->Form->input('usuario_id', array('disabled' => 'disabled'));
			echo $this->Form->input('nombre curso', array('label' => __('Curso', true), 'disabled' => 'disabled', 'default' => 'poner nombre del curso aqui'));
			echo $this->Form->input('nick', array('label' => __('Usuario', true), 'disabled' => 'disabled', 'default' => 'poner nick del usuario aqui'));
			echo $this->Form->file('File');
		?>
	</fieldset>
	<?php echo $this->Form->end(__('Subir')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Consultar Archivos'), array('action' => 'index')); ?></li>
	</ul>
</div>
