<?php 
	$cont = 0;
	foreach ($blogforo['Comentario'] as $comentario):
?>
	<table>
		<tr><td><strong><?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			<?php
				if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
					echo 'de ', $this->Html->link($blogforo['Comentario']['nombre'].' '.$blogforo['Comentario']['apellidos'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); 
				} else {
					echo 'de ', $blogforo['Usuario']['nombre'],' ',$blogforo['Usuario']['apellidos'];
				}
			?>
			&nbsp; - &nbsp;
			<?php
				if ($_SESSION['id_usuario'] == $blogforo['Blogforo']['usuario_id']) {
					echo $this->Html->link(__('Editar'), array('controller' => 'blogforos', 'action' => 'edit', $blogforo['Blogforo']['id'])); 
					echo '&nbsp; - &nbsp';
				}
			?>
			<?php echo h($blogforo['Blogforo']['fechapublicacion']); ?>&nbsp;
		</td></tr>
		<tr><td><?php echo h($blogforo['Blogforo']['cuerpo']); ?>&nbsp;</td></tr>
	</table>
	<br>
	
<?php
	$cont++; 
	endforeach;
?>