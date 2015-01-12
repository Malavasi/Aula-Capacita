<?php 
	$cont = 0;
	foreach ($blogforo['Comentario'] as $comentario):
?>
	<table>
		<tr><td width="50px">
			<?php
				if ($blogforo['Comentario'][$cont]['tipo_usuario'] <= 2 and !empty($comentario['urlfoto'])) {
					echo $this->Html->image($comentario['urlfoto'], array('class' => 'left', 'width' => '50px'));
				}
			?>
			</td>
			<td>
			<strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			
			<?php
				if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 and $blogforo['Comentario'][$cont]['usuario_id'] != $_SESSION['id_usuario']) {
					echo 'de ', $this->Html->link($comentario['nombre'].' '.$comentario['apellidos'], array('controller' => 'usuarios', 'action' => 'view', $comentario['usuario_id']));
					echo ' - ';
					
					if($comentario['blacklisted']){
						$block_unblock = 'Desbloquear';
					} else {
						$block_unblock = 'Bloquear';
					}
					
					echo $this->Html->link($block_unblock, array('controller' => 'Usuarios', 'action' => 'blacklist', $blogforo['Blogforo']['id'], $comentario['usuario_id']));
				} else {
					echo 'de ', $comentario['nombre'], ' ', $comentario['apellidos'];
				}
			?>
			&nbsp; - &nbsp;
			<?php
				if ($_SESSION['id_usuario'] == $comentario['usuario_id']) {
					echo $this->Html->link(__('Editar'), array('controller' => 'Blogforos', 'action' => 'editComment', $comentario['id'])); 
					echo '&nbsp; - &nbsp';
				}
			?>
			<?php echo h($comentario['fecha']); ?>
		</td></tr>
		<tr><td></td><td>
				<?php
					if($comentario['blacklisted']) {
						echo "<strong style=\"color: red\">", 'Los comentarios de este usuario han sido bloqueados.', "</strong> <br>";
					} else {
						echo h($comentario['comentario']);
					}
				?>&nbsp;
			</td>
		</tr>
	</table>
	<br>
	
<?php
	$cont++; 
	endforeach;
?>