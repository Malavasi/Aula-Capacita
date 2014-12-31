<div class="usuarios view">
	
<h2><?php echo __('Usuario'); ?></h2>
	<dl>
		<dt><?php echo __('Identificación'); ?></dt>
		<dd><?php echo h($usuario['Usuario']['identificacion']); ?>&nbsp;</dd>
		
		<?php if (!empty($usuario['Usuario']['urlfoto'])): ?>
			<div>
				<label>Foto</label>
				<?php
					echo $this->Html->image($usuario['Usuario']['urlfoto'], array('class' => 'center'));
				?>
			</div>
		<?php endif; ?>
		
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
		<?php if (!empty($curso['Curso'])): ?>
			<h3><?php echo __('Curso Matriculado'); ?></h3>
			<dl>
				<dt><?php echo __('Nombre'); ?></dt>
				<dd><?php echo$this->Html->link(__($curso['Curso']['nombre']), array('controller' => 'aulas', 'index' => 'view', $curso['Curso']['id'])); ?>&nbsp;</dd>
				
				<dt><?php echo __('Fecha Inicio'); ?></dt>
				<dd><?php echo $curso['Curso']['fechainicio']; ?>&nbsp;</dd>
				
				<dt><?php echo __('Fecha Finalización'); ?></dt>
				<dd><?php echo $curso['Curso']['fechafin']; ?>&nbsp;</dd>
			</dl>
		<?php endif; ?>
	</div>
	
</div>
<?php echo $this->element('acciones'); ?>