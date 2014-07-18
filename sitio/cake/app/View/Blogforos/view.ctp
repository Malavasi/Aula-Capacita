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
			
		<?php 
			$cont = 0;
			foreach ($blogforo['Comentario'] as $comentario):
		?>
			<table>
				<tr><td><strong> RE: &nbsp; <?php echo h($blogforo['Blogforo']['asunto']); ?></strong>
					<br>
					<?php echo $this->Html->link($blogforo['Comentario'][$cont]['nick'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); ?>
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
<?php echo $this->element('acciones'); ?>
<?php echo $this->Js->writeBuffer(); ?>