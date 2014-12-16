<div class="blogforos index">
	<h2><?php echo __('Comentarios y Preguntas'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th><?php echo $this->Paginator->sort('asunto', 'Asunto'); ?></th>
		<th><?php echo $this->Paginator->sort('nombre', 'Publicado por') ?></th>
		<th><?php echo $this->Paginator->sort('fechapublicacion', 'Publicación'); ?></th>
		<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	
		<?php foreach ($blogforos as $blogforo): ?>
			<tr>
				<td><?php echo $this->Html->link($blogforo['Blogforo']['asunto'], array('controller' => 'BlogForos', 'action' => 'view', $blogforo['Blogforo']['id'])); ?>&nbsp;</td>
				<td><?php
					if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
						echo $this->Html->link($blogforo['Usuario']['nombre'].' '. $blogforo['Usuario']['apellidos'], array('controller' => 'usuarios', 'action' => 'view', $blogforo['Usuario']['id'])); 
					} else {
						echo $blogforo['Usuario']['nombre'], ' ', $blogforo['Usuario']['apellidos'];
					}
				?></td>
				<td><?php echo h($blogforo['Blogforo']['fechapublicacion']); ?>&nbsp;</td>
				<td class="actions">
					<?php
						echo $this->Html->link(__('Ver'), array('action' => 'view', $blogforo['Blogforo']['id']));
						
						if (isset($_SESSION['id_usuario']) and $_SESSION['id_usuario'] == $blogforo['Blogforo']['usuario_id']) {
							echo $this->Html->link(__('Editar'), array('action' => 'edit', $blogforo['Blogforo']['id']));
						}
					?>
					<?php 
						if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 1 ) {
                            echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $blogforo['Blogforo']['id']), array(), __('Va a eliminar el foro del curso %s, ¿Desea continuar?', $blogforo['Blogforo']['curso_id'])); 
                    	}
                    ?>
				</td>
			</tr>
		<?php endforeach; ?>
	</tbody>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Página {:page} de {:pages}')
	));
	?>	</p>
	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('Anterior '), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ' - '));
		echo $this->Paginator->next(__(' Siguiente') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
</div>

<?php $this->set('blog', 1);
echo $this->element('acciones'); ?>