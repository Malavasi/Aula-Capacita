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

<p style="color: green;">Comentario agregado!</p>