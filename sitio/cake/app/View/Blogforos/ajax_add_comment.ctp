<?php 
	$cont = 0;
	foreach ($blogforo['Comentario'] as $comentario):
?>
	<table>
		<tr><td><strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			<?php 
				if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
					echo 'de ', $this->Html->link($blogforo['Comentario'][$cont]['nombre'].' '.$blogforo['Comentario'][$cont]['apellidos'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); 
				} else {
					echo 'de ', $blogforo['Comentario'][$cont]['nombre'], ' ', $blogforo['Comentario'][$cont]['apellidos'];
				}
			?>
			&nbsp; - &nbsp;
			<?php
				if ($_SESSION['id_usuario'] == $blogforo['Comentario'][$cont]['usuario_id']) {
					echo $this->Html->link(__('Editar'), array('controller' => 'BlogForos', 'action' => 'editComment', $blogforo['Comentario'][$cont]['id'])); 
					echo '&nbsp; - &nbsp';
				}
			?>
			<?php echo h($comentario['fecha']); ?>
		</td></tr>
		<tr><td><?php echo h($comentario['comentario']); ?>&nbsp;</td></tr>
	</table>
	<br>
	
<?php
	$cont++; 
	endforeach;
?>