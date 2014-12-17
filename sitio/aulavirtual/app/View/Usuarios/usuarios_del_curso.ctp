<div class="usuarios index">
	<h2><?php echo __('Instructor'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th><?php echo $this->Paginator->sort('nombre', 'Nombre'); ?></th>
		<th class="actions"><?php echo __(''); ?></th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><?php echo $this->Html->link(__($instructor['Usuario']['nombre'].' '. $instructor['Usuario']['apellidos']), array('action' => 'view', $instructor['Usuario']['id'])); ?>&nbsp;</td>
		
		<td class="actions">
			<?php 
	            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 ) {
	                echo $this->Html->link(__('Cambiar Instructor'), array('controller' => 'Cursos', 'action' => 'edit', $infoCurso['Curso']['id'])); 
	            }
            ?>
		</td>
	</tr>
	</tbody>
	</table>
	
	<br>
	
	<h2><?php echo __('Estudiantes'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th><?php echo $this->Paginator->sort('nombre', 'Nombre'); ?></th>
		<th class="actions"><?php echo __(''); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($usuarios as $usuario): ?>
	<tr>
		<td><?php echo $this->Html->link(__($usuario['Usuario']['nombre'].' '. $usuario['Usuario']['apellidos']), array('action' => 'view', $usuario['Usuario']['id'])); ?>&nbsp;</td>
		
		<td class="actions">
			<?php 
	            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 ) {
	                echo $this->Html->link(__('Desmatricular'), array('controller' => 'Matriculas', 'action' => 'delete', $usuario['Matricula'][0]['id']), array(), __('Va a desmatricular el usuario %s, ¿Desea continuar?', $usuario['Usuario']['nombre']));		    
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
