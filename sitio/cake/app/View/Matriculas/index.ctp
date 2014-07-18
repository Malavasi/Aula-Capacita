<div class="Matriculas index">
<h2><?php echo __('Matricular'); ?></h2>
<h2><?php echo $_SESSION['id_curso']; ?></h2>

	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<th>Identificacion</th>
		<th>Nombre</th>
		<th>Apellidos</th>
		<th>Usuario</th>
		<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($usuarios as $usuario): ?>
	<tr>
		<td><?php echo $usuario['Usuarios']['identificacion']; ?>&nbsp;</td>
		<td><?php echo $usuario['Usuarios']['nombre']; ?>&nbsp;</td>
		<td><?php echo $usuario['Usuarios']['apellidos']; ?>&nbsp;</td>
		<td><?php echo $usuario['Usuarios']['nick']; ?>&nbsp;</td>
		
		<td class="actions">
			<?php 
            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
            {
                echo $this->Html->link(__('Matricular'), array('controller'=> 'matriculas','action' => 'add', $usuario['Usuarios']['id'])); 
			}
            ?>
		</td>
	</tr>
<?php endforeach; ?>
	</tbody>
	</table>
	</div>
<?php echo $this->element('acciones'); ?>