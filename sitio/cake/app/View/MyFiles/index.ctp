<div class="myFiles index">
	<h2><?php echo __('Archivos'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
			<th><?php echo $this->Paginator->sort('name','Nombre'); ?></th>
			<th><?php echo $this->Paginator->sort('size', 'Tamaño'); ?></th>
			<th><?php echo $this->Paginator->sort('created', 'Incluído'); ?></th>
			<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($myFiles as $myFile): ?>
	<tr>
		<td><?php echo $this->Html->link($myFile['MyFile']['name'], array('action' => 'download', $myFile['MyFile']['id'])); ?>&nbsp;</td>
		<td><?php echo h($myFile['MyFile']['size']), ' B'; ?>&nbsp;</td>
		<td><?php echo h($myFile['MyFile']['created']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('Ver'), array('action' => 'view', $myFile['MyFile']['id'])); ?>
			<?php echo $this->Html->link(__('Editar'), array('action' => 'edit', $myFile['MyFile']['id'])); ?>
			<?php echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $myFile['MyFile']['id']), array(), __('¿Desea eliminar el archivo %s?', $myFile['MyFile']['name'])); ?>
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
		<li><?php echo $this->Html->link(__('Subir Archivo'), array('action' => 'add')); ?></li>
	</ul>
</div>
