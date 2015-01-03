<div class="materiales index">
	<h2><?php echo __('Archivos'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
			<th><?php echo $this->Paginator->sort('nombre','Nombre'); ?></th>
			<th><?php echo $this->Paginator->sort('tamano', 'Tamaño'); ?></th>
			<th><?php echo $this->Paginator->sort('fecha', 'Incluído'); ?></th>
			<th class="actions"><?php if ($_SESSION['tipo_usuario'] == 1) { echo __('Acciones'); } ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($materiales as $material): ?>
		
			<tr>
				<td><?php echo $this->Html->link($material['Material']['nombre'], array('action' => 'view', $material['Material']['id'])); ?>&nbsp;</td>
				<td><?php echo h($material['Material']['tamano']), ' B'; ?>&nbsp;</td>
				<td><?php echo h($material['Material']['fecha']); ?>&nbsp;</td>
				
				<?php if (isset($_SESSION) and $_SESSION['tipo_usuario'] <= 3) { ?>
					<td class="actions">
						<?php 
							if (isset($_SESSION['id_usuario']) and $_SESSION['id_usuario'] == $material['Material']['usuario_id'] or $_SESSION['tipo_usuario'] == 1) {
								echo $this->Html->link(__('Editar'), array('action' => 'edit', $material['Material']['id']));
								echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $material['Material']['id']), array(), __('¿Desea eliminar el archivo %s?', $material['Material']['nombre']));
							}
						?>
					</td>
				<?php } ?>
					
			</tr>
		
	<?php endforeach; ?>
	</tbody>
	</table>
	
	<?php echo $this->element('paginacion'); ?>
	
</div>

<?php 
	$this->set('archivos', 1);
	echo $this->element('acciones');
?>
