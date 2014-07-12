<?php echo $this->Html->script('jquery', FALSE); ?>

<div class="blogforos view">
<h2><?php echo __('Foro de Discusión'); ?></h2>
	<table>
		<tr><td><strong><?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
			<br>
			<?php echo 'de ', $this->Html->link($blogforo['Usuario']['nick'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); ?>
			&nbsp; - &nbsp;
			<?php echo h($blogforo['Blogforo']['fechapublicacion']); ?>&nbsp;
		</td></tr>
		<tr><td><?php echo h($blogforo['Blogforo']['cuerpo']); ?>&nbsp;</td></tr>
	</table>

	<br>
	
	<div id="comments" style="margin-left: 50px">
			
		<?php foreach ($blogforo['Comentario'] as $comentario): ?>
			<table>
				<tr><td><strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
					<br>
					<?php //poner el nick del autor del comentario 
						echo $this->Html->link($comentario['usuario_id'], array('controller' => 'usuarios', 'action' => 'view', $comentario['usuario_id']));
					?>
					&nbsp; - &nbsp;
					<?php echo $this->Html->link(__('Editar'), array('controller' => 'blogforos', 'action' => 'edit', $comentario['id'])); ?>
					&nbsp; - &nbsp;
					<?php echo h($comentario['fecha']); ?>
				</td></tr>
				<tr><td><?php echo h($comentario['comentario']); ?>&nbsp;</td></tr>
			</table>
			<br>
			
		<?php endforeach; ?>
		
	</div>

	<?php 
		echo $this->Form->create("Comentario");
		echo $this->Js->submit("Comentar",
								array( 'url' => array('action' => 'AjaxShowCommentForm',
									   $blogforo['Blogforo']['id']/*, $blogforo['Usuario']['id'], $blogforo['Usuario']['nick']*/),//enviar el id del usuario que comenta
									   'update' => '#formAddComment'));
		echo $this->Form->end();
	?>
	
	<div id="sending" style="display: none; color: green;">Enviando comentario...</div>
	
	<div id="formAddComment"></div>
	
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Crear Usuario'), array('controller' => 'usuarios', 'action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('Consultar Usuarios'), array('controller' => 'usuarios', 'action' => 'index')); ?></li>
		<!--
		<li><?php echo $this->Html->link(__('Crear Curso'), array('controller' => 'cursos', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('Consultar Cursos'), array('controller' => 'cursos', 'action' => 'index')); ?> </li>
		-->
	</ul>
</div>
<?php echo $this->Js->writeBuffer(); ?>