<?php foreach ($blogforo['Comentario'] as $comentario): ?>
	<table>
		<tr><td><strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			<?php echo $this->Html->link($comentario['usuario_id'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); ?>
			&nbsp; - &nbsp;
			<?php echo $this->Html->link(__('Editar'), array('controller' => 'blogforos', 'action' => 'edit', $comentario['id'])); ?>
			&nbsp; - &nbsp;
			<?php echo h($comentario['fecha']); ?>
		</td></tr>
		<tr><td><?php echo h($comentario['comentario']); ?>&nbsp;</td></tr>
	</table>
	<br>
	
<?php endforeach; ?>