<?php 
	$cont = 0;
	foreach ($blogforo['Comentario'] as $comentario):
?>
	<table>
		<tr><td><strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			<?php 
				if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
					echo $this->Html->link($blogforo['Comentario'][$cont]['nick'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); 
				} else {
					echo $blogforo['Comentario'][$cont]['nick'];
				}
			?>
			&nbsp; - &nbsp;
			<?php echo $this->Html->link(__('Editar'), array('controller' => 'blogforos', 'action' => 'edit', $comentario['id'])); ?>
			&nbsp; - &nbsp;
			<?php echo h($comentario['fecha']); ?>
		</td></tr>
		<tr><td><?php echo h($comentario['comentario']); ?>&nbsp;</td></tr>
	</table>
	<br>
	
<?php
	$cont++; 
	endforeach;
?>