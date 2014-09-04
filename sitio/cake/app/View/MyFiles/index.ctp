<div class="myFiles index">
	<h2><?php echo __('Archivos'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
			<th><?php echo $this->Paginator->sort('name','Nombre'); ?></th>
			<th><?php echo $this->Paginator->sort('size', 'Tamaño'); ?></th>
			<th><?php echo $this->Paginator->sort('created', 'Incluído'); ?></th>
			<th class="actions"><?php if ($_SESSION['tipo_usuario'] == 1) { echo __('Acciones'); } ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($myFiles as $myFile): ?>
		
			<tr>
				<td><?php echo $this->Html->link($myFile['MyFile']['name'], array('action' => 'view', $myFile['MyFile']['id'])); ?>&nbsp;</td>
				<td><?php echo h($myFile['MyFile']['size']), ' B'; ?>&nbsp;</td>
				<td><?php echo h($myFile['MyFile']['created']); ?>&nbsp;</td>
				
				<?php if (isset($_SESSION) and $_SESSION['tipo_usuario'] <= 3) { ?>
					<td class="actions">
						<?php 
							if (isset($_SESSION['id_usuario']) and $_SESSION['id_usuario'] == $myFile['MyFile']['usuario_id']) {
								echo $this->Html->link(__('Editar'), array('action' => 'edit', $myFile['MyFile']['id']));
								echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $myFile['MyFile']['id']), array(), __('¿Desea eliminar el archivo %s?', $myFile['MyFile']['name']));
							}
						?>
					</td>
				<?php } ?>
					
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

<?php 
	$this->set('archivos', 1);
	echo $this->element('acciones');
?>
