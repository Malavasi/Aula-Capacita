<div class="TiposArchivos index">
    <h1><?php echo __('Programas'); ?></h1>
	<?php echo $this->Form->postLink(__('Agregar Nuevo'), array('action' => 'add')); ?>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th><?php echo $this->Paginator->sort('extension', 'Extension'); ?></th>
		<th><?php echo $this->Paginator->sort('programas', 'Programas'); ?></th>
		<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($programas as $programa): ?>
	<tr>
		<td><?php echo $this->Html->link(__($programa['Programas']['extension']), array('action' => 'view', $programa['Programas']['id'])); ?></td>
		<td><?php echo h($programa['Programas']['programas']); ?>&nbsp;</td>
		<td class="actions">
			<?php 
            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
            {
                //echo $this->Html->link(__('Editar'), array('action' => 'edit', $programa['Programas']['id'])); 
			    echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $programa['Programas']['id']), array(), __('Va a eliminar el usuario %s, ¿Desea continuar?', $programa['Programas']['extension']));
				 
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
		echo $this->Paginator->prev('< ' . __('Anterior'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('Siguiente') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
    
</div>
<?php echo $this->element('acciones'); ?>
