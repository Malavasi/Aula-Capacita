<div class="blogforos index">
	<h2><?php echo __('Blogforos'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th><?php echo $this->Paginator->sort('asunto', 'Asunto'); ?></th>
		<th><?php echo $this->Paginator->sort('usuario_id') ?></th>
		<th><?php echo $this->Paginator->sort('fechapublicacion', 'Publicación'); ?></th>
		<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	
		<?php foreach ($blogforos as $blogforo): ?>
			<tr>
				<td><?php echo h($blogforo['Blogforo']['asunto']); ?>&nbsp;</td>
				<td><?php echo $this->Html->link($blogforo['Usuario']['nick'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); ?></td>
				<td><?php echo h($blogforo['Blogforo']['fechapublicacion']); ?>&nbsp;</td>
				<td class="actions">
					<?php echo $this->Html->link(__('Ver'), array('action' => 'view', $blogforo['Blogforo']['id'])); ?>
					<?php echo $this->Html->link(__('Editar'), array('action' => 'edit', $blogforo['Blogforo']['id'])); ?>
					<?php echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $blogforo['Blogforo']['id']), array(), __('Va a eliminar el foro del curso %s, ¿Desea continuar?', $blogforo['Blogforo']['curso_id'])); ?>
				</td>
			</tr>
		<?php endforeach; ?>
	</tbody>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Página {:page} de {:pages}')
	));
	?>	</p>
	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('Anterior'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('Siguiente') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
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