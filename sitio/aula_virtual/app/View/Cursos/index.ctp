<div class="Cursos index">
<h1>Cursos actuales</h1>
<table cellpadding="0" cellspacing="0" class="table table-striped">
				<thead>
					<tr>
						<th><?php echo $this->Paginator->sort('nombre', 'Nombre'); ?></th>
						<th><?php echo $this->Paginator->sort('fechainicio', 'Inicio'); ?></th>
						<th><?php echo $this->Paginator->sort('fechafin', 'Final'); ?></th>
						<?php if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) { ?>
							<th class="actions">Acciones</th>
						<?php } ?>
					</tr>
				</thead>
				<tbody>
				<?php foreach ($cursos as $curso): ?>
					<tr>
						<td><?php echo $this->Html->link('<span class="glyphicon glyphicon-edit">'. $curso['Curso']['nombre'] .'</span>', array('controller' =>'aulas','action' => 'index', $curso['Curso']['id']), array('escape' => false)); ?> </td>
						<td><?php echo $curso['Curso']['fechainicio']; ?>&nbsp;</td>
						<td><?php echo $curso['Curso']['fechafin']; ?>&nbsp;</td>
						
                        <td class="actions">
							<?php
                                 
                            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
                                echo $this->Html->link('<span class="glyphicon glyphicon-edit">Matricular</span>', array('controller'=>'Matriculas','action' => 'index', $curso['Curso']['id']), array('escape' => false));
                                echo $this->Html->link('<span class="glyphicon glyphicon-edit">Editar</span>', array('action' => 'edit', $curso['Curso']['id']), array('escape' => false));
                                echo $this->Form->postLink('<span class="glyphicon glyphicon-remove">Eliminar</span>', array('action' => 'delete', $curso['Curso']['id']), array('escape' => false), __('¿Realmente desea borrar el curso %s?', $curso['Curso']['nombre'])); 
                             }
                             ?>
						</td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
			
			<?php echo $this->element('paginacion'); ?>
</div>

<?php echo $this->element('acciones'); ?>