<div class="blogforos form">
	
	<?php var_dump($blogforo); ?>
	
<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php echo __('Editar Foro'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->hidden('curso_id', array('disabled' => 'disabled'));
		echo $this->Form->hidden('usuario_id', array('disabled' => 'disabled'));
		echo $this->Form->input('nombre curso', array('disabled' => 'disabled', 'default' => $blogforo['Curso']['nombre']));
		echo $this->Form->input('nick', array('disabled' => 'disabled', 'default' => $blogforo['Usuario']['nick']));
		echo $this->Form->input('asunto');
		
	?>
	</fieldset>
<?php echo $this->Form->end(__('Guardar')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Crear Usuario'), array('controller' => 'usuarios', 'action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('Consultar Usuarios'), array('controller' => 'usuarios', 'action' => 'index')); ?></li>
		<!--
		<li><?php echo $this->Html->link(__('Crear Curso'), array('controller' => 'cursos', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('Consultar Cursos'), array('controller' => 'cursos', 'action' => 'index')); ?> </li>
		-->
	</ul>
</div>
