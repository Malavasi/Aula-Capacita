<?php echo $this->Html->script('jquery', FALSE); ?>

<div class="blogforos view">
<h2><?php echo __('Foro de Discusión'); ?></h2>
	<dl>
		<dt><?php echo __('Usuario'); ?></dt>
		<dd><?php echo $this->Html->link($blogforo['Usuario']['nick'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); ?>&nbsp;</dd>
		
		<dt><?php echo __('Fechapublicacion'); ?></dt>
		<dd><?php echo h($blogforo['Blogforo']['fechapublicacion']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Asunto'); ?></dt>
		<dd><?php echo h($blogforo['Blogforo']['asunto']); ?>&nbsp;</dd>
	</dl>
	
	<br>
	
	<div class="related">
		<h3><?php echo __('Comentarios'); ?></h3>
		
		<?php if (!empty($blogforo['Comentario'])): ?>
			<table cellpadding = "0" cellspacing = "0">
				<tr>
				<th><?php echo __('Usuario'); ?></th>
				<th><?php echo __('Fecha'); ?></th>
				<th><?php echo __('Comentario'); ?></th>
				<th class="actions"><?php echo __(' '); ?></th>
			</tr>
			
			<?php foreach ($blogforo['Comentario'] as $comentario): ?>
				<tr>
					<td><?php echo $comentario['usuario_id']; ?></td>
					<td><?php echo $comentario['fecha']; ?></td>
					<td><?php echo $comentario['comentario']; ?></td>
					<td class="actions">
						<?php echo $this->Html->link(__('Edit'), array('controller' => 'comentarios', 'action' => 'edit', $comentario['id'])); ?>
					</td>
				</tr>
			<?php endforeach; ?>
			</table>
		<?php endif; ?>
	</div>

	<?php 
		echo $this->Form->create("Comentario");
		echo $this->Js->submit("Comentar",
								array( 'url' => array('action' => 'AjaxShowCommentForm',
									   $blogforo['Blogforo']['id']),
									   'update' => '#formAddComment'));
		echo $this->Form->end();
	?>
	
	<div id="sending" style="display: none; color: green;">Enviando comentario...</div>
	
	<div id="formAddComment"></div>
	
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

<?php echo $this->Js->writeBuffer(); ?>