<div class="usuarios view">
<h2><?php echo __('Usuario'); ?></h2>
	<dl>
		<dt><?php echo __('Identificación'); ?></dt>
		<dd><?php echo h($usuario['Usuario']['identificacion']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Nombre'); ?></dt>
		<dd><?php echo h($usuario['Usuario']['nombre']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Apellidos'); ?></dt>
		<dd><?php echo h($usuario['Usuario']['apellidos']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Tipo'); ?></dt>
		<dd>	<?php 
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
		</dd>
		
		<dt><?php echo __('Usuario'); ?></dt>
		<dd><?php echo h($usuario['Usuario']['nick']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Creación'); ?></dt>
		<dd><?php echo h($usuario['Usuario']['fecha']); ?>&nbsp;</dd>
	</dl>
	
	<br>
	
	<div class="related">
		<h3><?php echo __('Curso Matriculado'); ?></h3>
	<?php if (!empty($usuario['Curso'])): ?>
		<dl>
			<dt><?php echo __('Nombre'); ?></dt>
			<dd><?php echo $usuario['Curso']['nombre']; ?>&nbsp;</dd>
			
			<dt><?php echo __('Fecha Inicio'); ?></dt>
			<dd><?php echo $usuario['Curso']['fechainicio']; ?>&nbsp;</dd>
			
			<dt><?php echo __('Fecha Finalización'); ?></dt>
			<dd><?php echo $usuario['Curso']['fechafin']; ?>&nbsp;</dd>
		</dl>
	<?php endif; ?>
		<div class="actions">
			<ul>
				<li><?php echo $this->Html->link(__('Ver Curso'), array('controller' => 'cursos', 'action' => 'view', $usuario['Curso']['id'])); ?></li>
			</ul>
		</div>
	</div>
	
</div>
<?php echo $this->element('acciones'); ?>