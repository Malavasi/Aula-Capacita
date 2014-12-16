<div class="usuarios index">
	<h2><?php echo __('Usuarios'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th><?php echo $this->Paginator->sort('nick', 'Usuario'); ?></th>
		<!--th><?php echo $this->Paginator->sort('identificacion', 'Identificación'); ?></th-->
		<th><?php echo $this->Paginator->sort('nombre', 'Nombre'); ?></th>
		<th><?php echo $this->Paginator->sort('apellidos', 'Apellidos'); ?></th>
		<th><?php echo $this->Paginator->sort('tipo', 'Tipo'); ?></th>
		<th><?php echo $this->Paginator->sort('fecha', 'Fecha'); ?></th>
		<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($resultados as $usuario): ?>
	<tr>
		<td><?php echo $this->Html->link(__($usuario['Usuario']['nick']), array('action' => 'view', $usuario['Usuario']['id'])); ?></td>
		<!--td><?php echo h($usuario['Usuario']['identificacion']); ?>&nbsp;</td-->
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
		
		<td><?php echo h($usuario['Usuario']['fecha']); ?>&nbsp;</td>
		<td class="actions">
			<?php 
            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
            {
                echo $this->Html->link(__('Editar'), array('action' => 'edit', $usuario['Usuario']['id'])); 
			    
				if($_SESSION['id_usuario'] != $usuario['Usuario']['id']) {
			    	echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $usuario['Usuario']['id']), array(), __('Va a eliminar el usuario %s, ¿Desea continuar?', $usuario['Usuario']['nick']));
				} 
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
<?php echo $this->element('acciones'); ?>
