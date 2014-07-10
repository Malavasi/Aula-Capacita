<div class="blogforos form">
<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php echo __('Edit Blogforo'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('curso_id');
		echo $this->Form->input('usuario_id');
		echo $this->Form->input('fechapublicacion');
		echo $this->Form->input('asunto');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Crear Usuario'), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('Consultar Usuarios'), array('action' => 'index')); ?></li>
		<!--
		<li><?php echo $this->Html->link(__('Crear Curso'), array('controller' => 'cursos', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('Consultar Cursos'), array('controller' => 'cursos', 'action' => 'index')); ?> </li>
		-->
	</ul>
</div>
