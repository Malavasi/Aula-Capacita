<?php 
	$cont = 0;
	foreach ($blogforo['Comentario'] as $comentario):
?>
	<table>
		<tr><td width="50px">
			<?php
				if ($blogforo['Comentario'][$cont]['tipo_usuario'] <= 2 and !empty($blogforo['Usuario']['urlfoto'])) {
					echo $this->Html->image($blogforo['Comentario'][$cont]['urlfoto'], array('class' => 'left', 'width' => '50px'));
				}
			?>
			</td>
			<td>
			<strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			
			<?php
				if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 and $blogforo['Comentario'][$cont]['usuario_id'] != $_SESSION['id_usuario']) {
					echo 'de ', $this->Html->link($blogforo['Comentario'][$cont]['nombre'].' '.$blogforo['Comentario'][$cont]['apellidos'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id']));
					echo ' - ';
					echo $this->Html->link('Bloquear', array('controller' => 'Usuarios', 'action' => 'blacklist', $blogforo['Usuario']['id']));  
				} else {
					echo 'de ', $blogforo['Comentario'][$cont]['nombre'], ' ', $blogforo['Comentario'][$cont]['apellidos'];
				}
			?>
			&nbsp; - &nbsp;
			<?php
				if ($_SESSION['id_usuario'] == $blogforo['Comentario'][$cont]['usuario_id']) {
					echo $this->Html->link(__('Editar'), array('controller' => 'Blogforos', 'action' => 'editComment', $blogforo['Comentario'][$cont]['id'])); 
					echo '&nbsp; - &nbsp';
				}
			?>
			<?php echo h($comentario['fecha']); ?>
		</td></tr>
		<tr><td></td><td><?php echo h($comentario['comentario']); ?>&nbsp;</td></tr>
	</table>
	<br>
	
<?php
	$cont++; 
	endforeach;
?>