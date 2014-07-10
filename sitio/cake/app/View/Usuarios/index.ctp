<div class="usuarios index">
	<h2><?php echo __('Usuarios'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
			<th><?php echo $this->Paginator->sort('Identificación'); ?></th>
			<th><?php echo $this->Paginator->sort('Nombre'); ?></th>
			<th><?php echo $this->Paginator->sort('Apellidos'); ?></th>
			<th><?php echo $this->Paginator->sort('Tipo'); ?></th>
			<th><?php echo $this->Paginator->sort('Usuario'); ?></th>
			<th><?php echo $this->Paginator->sort('Fecha'); ?></th>
			<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($usuarios as $usuario): ?>
	<tr>
		<td><?php echo h($usuario['Usuario']['identificacion']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['nombre']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['apellidos']); ?>&nbsp;</td>
		
		<td>	<?php 
					$tipoUsuario;
					switch($usuario['Usuario']['tipo']){
						case 1:
							$tipoUsuario = 'Administrador';
							break;
						case 2:
							$tipoUsuario = 'Instructor';
							break;
						case 3:
							$tipoUsuario = 'Estudiante';
							break;
					}
					
					echo h($tipoUsuario);
					
				?>&nbsp;
		</td>
		
		<td><?php echo h($usuario['Usuario']['nick']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['fecha']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('Ver'), array('action' => 'view', $usuario['Usuario']['id'])); ?>
			<?php echo $this->Html->link(__('Editar'), array('action' => 'edit', $usuario['Usuario']['id'])); ?>
			<?php echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $usuario['Usuario']['id']), array(), __('Are you sure you want to delete # %s?', $usuario['Usuario']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</tbody>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Página {:page} de {:pages}, mostrando {:current} usuarios de {:count}')
	));
	?>	</p>
	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('Anterior'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('Siguiente') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
</div>
<?php echo $this->element('acciones'); ?>
