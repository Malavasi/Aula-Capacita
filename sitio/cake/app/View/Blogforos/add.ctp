<div class="blogforos form">

	<?php echo $this->Form->create('Blogforo'); ?>
	<fieldset>
		<legend><?php echo __('Crear Tema de Discusión'); ?></legend>
		
		<?php
			echo $this->Form->input('curso_id', array('disabled' => 'disabled'));
			echo $this->Form->input('usuario_id', array('disabled' => 'disabled'));
			echo $this->Form->input('nombre curso', array('label' => __('Curso', true),'disabled' => 'disabled', 'default' => 'nombre del curso aqui'));
			echo $this->Form->input('nick', array('label' => __('Usuario', true),'disabled' => 'disabled', 'default' => 'nombre del usuario aqui'));
			echo $this->Form->input('asunto');
			echo $this->Form->input('cuerpo');
		?>
	</fieldset>
		<?php echo $this->Form->end(__('Publicar')); ?>

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
</di