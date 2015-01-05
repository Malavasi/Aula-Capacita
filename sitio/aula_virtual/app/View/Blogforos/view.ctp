<?php echo $this->Html->script('jquery', FALSE); ?>

<div class="blogforos view">
<h2><?php echo __('Foro de Discusión'); ?></h2>
	<table>
		<tr>
			<td width="50px">
			<?php
				if (!empty($blogforo['Usuario']['urlfoto'])) {
					echo $this->Html->image($blogforo['Usuario']['urlfoto'], array('class' => 'left', 'width' => '50px'));
				} 
			?>
			</td>
			<td>
			<strong><?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			<?php
				if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
					echo 'de ', $this->Html->link($blogforo['Usuario']['nombre'].' '.$blogforo['Usuario']['apellidos'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id']));
					echo ' - ';
					echo $this->Html->link('Bloquear', array('controller' => 'Usuarios', 'action' => 'blacklist', $blogforo['Blogforo']['id'], $blogforo['Blogforo']['usuario_id']));
				} else {
					echo 'de ', $blogforo['Usuario']['nombre'],' ',$blogforo['Usuario']['apellidos'];
				}
			?>
			&nbsp; - &nbsp;
			<?php
				if ($_SESSION['id_usuario'] == $blogforo['Blogforo']['usuario_id']) {
					echo $this->Html->link(__('Editar'), array('controller' => 'Blogforos', 'action' => 'edit', $blogforo['Blogforo']['id'])); 
					echo '&nbsp; - &nbsp';
				}
			?>
			<?php echo h($blogforo['Blogforo']['fechapublicacion']); ?>&nbsp;
		</td></tr>
		<tr><td></td><td><?php echo h($blogforo['Blogforo']['cuerpo']); ?>&nbsp;</td></tr>
	</table>

	<br>
	
	<div id="comments" style="margin-left: 50px">
			
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
							echo $this->Html->link('Bloquear', array('controller' => 'Usuarios', 'action' => 'blacklist', $blogforo['Blogforo']['id'], $comentario['usuario_id']));
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
		
	</div>

	<?php 
		echo '<div id="comm">';
			$this->Form->create("Comentario");
			echo '<br>';
			echo $this->Js->submit("Comentar",
									array( 'url' => array('action' => 'AjaxShowCommentForm',
										   $blogforo['Blogforo']['id']),
										   'update' => '#formAddComment',
										   'success' => $this->Js->get('#comm')->effect('fadeOut')));
			echo $this->Form->end();
		echo '</div>';
	?>
	
	<div id="formAddComment"></div>
	
</div>
<?php 
	$this->set('blog', 1);
	echo $this->element('acciones');
?>
<?php echo $this->Js->writeBuffer(); ?>