<div class="Cursos index">
<h1>Cursos actuales</h1>
<table cellpadding="0" cellspacing="0" class="table table-striped">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Fecha inicio</th>
						<th>Fecha final</th>
						<th class="actions">Acciones</th>
					</tr>
				</thead>
				<tbody>
				<?php foreach ($cursos as $curso): ?>
					<tr>
						<td><?php echo $curso['Curso']['nombre']; ?>&nbsp;</td>
						<td><?php echo $curso['Curso']['fechainicio']; ?>&nbsp;</td>
						<td><?php echo $curso['Curso']['fechafin']; ?>&nbsp;</td>
						
                        <td class="actions">
							<?php
                            echo $this->Html->link('<span class="glyphicon glyphicon-edit">ver</span>', array('controller' =>'aulas','action' => 'index', $curso['Curso']['id']), array('escape' => false));
                                 
                            if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
                            {
                                echo $this->Html->link('<span class="glyphicon glyphicon-edit">Matricular</span>', array('controller'=>'Matriculas','action' => 'index', $curso['Curso']['id']), array('escape' => false));
                                echo $this->Html->link('<span class="glyphicon glyphicon-edit">editar</span>', array('action' => 'edit', $curso['Curso']['id']), array('escape' => false));
                                echo $this->Form->postLink('<span class="glyphicon glyphicon-remove">borrar</span>', array('action' => 'delete', $curso['Curso']['id']), array('escape' => false), __('¿Realmente desea borrar el curso %s?', $curso['Curso']['nombre'])); 
                             }
                             ?>
						</td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
</div>

<?php echo $this->element('acciones'); ?>