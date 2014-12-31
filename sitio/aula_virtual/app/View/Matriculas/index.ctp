<div class="Matriculas index">
<h2><?php echo __('Matricular'); ?></h2>
<h2><?php echo $infoCurso['Curso']['nombre'] ?></h2>

	<table cellpadding="0" cellspacing="0">
	<thead>
	<tr>
		<!--th><?php echo $this->Paginator->sort('identificacion', 'Identificación'); ?></th-->
		<th><?php echo $this->Paginator->sort('nombre', 'Nombre'); ?></th>
		<th><?php echo $this->Paginator->sort('apellidos', 'Apellidos'); ?></th>
		<!--th><?php echo $this->Paginator->sort('nick', 'Usuario'); ?></th-->
		<th class="actions"><?php echo __('Acciones'); ?></th>
	</tr>
	</thead>
	<?php  
	    echo $this->form->create("Matricula", array('action' => 'search')); 
	    echo $this->form->input("query", array('label' => 'Buscar Usuario: ')); 
	    echo $this->form->end("Buscar"); 
	?> 
	<tbody>
	<?php foreach ($usuarios as $usuario): ?>
	<tr>
		<!--td><?php echo $usuario['Usuario']['identificacion']; ?>&nbsp;</td-->
		<td><?php echo $usuario['Usuario']['nombre']; ?>&nbsp;</td>
		<td><?php echo $usuario['Usuario']['apellidos']; ?>&nbsp;</td>
		<!--td><?php echo $usuario['Usuario']['nick']; ?>&nbsp;</td-->
		
		<td class="actions">
			<?php 
            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
            {
                echo $this->Html->link(__('Matricular'), array('controller'=> 'matriculas','action' => 'add', $usuario['Usuario']['id'])); 
			}
            ?>
		</td>
	</tr>
<?php endforeach;?>
	</tbody>
	</table>
	
		<?php echo $this->element('paginacion'); ?>
	</div>
<?php echo $this->element('acciones'); ?>