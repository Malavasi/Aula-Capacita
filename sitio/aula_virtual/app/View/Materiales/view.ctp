<div class="materiales view">
	
<h2><?php echo __('Archivo'); ?></h2>
	<dl>
		<?php if (!empty($material['Material']['url'])): ?>
			<dt><?php echo __('Nombre'); ?></dt>
			<dd><?php echo $this->Html->link($material['Material']['nombre'], array('action' => 'download', $material['Material']['id'])); ?>&nbsp;</dd>
		<?php elseif(!empty($material['Material']['link'])): ?>
			<dt><?php echo __('Link'); ?></dt>
			<dd><?php echo '<a href="'. $material['Material']['link'] . '">'. $material['Material']['link'] . '</a>'; ?>&nbsp;</dd>
		<?php endif ?>
		
		<dt><?php echo __('Tamaño'); ?></dt>
		<dd><?php echo h($material['Material']['tamano']), ' B'; ?>&nbsp;</dd>
		
		<dt><?php echo __('Incluído'); ?></dt>
		<dd><?php echo h($material['Material']['fecha']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Subido por'); ?></dt>
		<dd><?php echo $material['Usuario']['nombre'], ' ', $material['Usuario']['apellidos']; ?>&nbsp;</dd>
		
		<dt><?php echo __('Programas Recomendados'); ?></dt>
		<dd><?php echo $material['Material']['programas']; ?>&nbsp;</dd>
		
		<dt><?php echo __('Descripción'); ?></dt>
		<dd><?php echo h($material['Material']['descripcion']); ?>&nbsp;</dd>
		
	</dl>
	
	<div class="actions">
		<ul>
			<li>
				<?php 
					if (isset($_SESSION['id_usuario']) and $_SESSION['id_usuario'] == $material['Material']['usuario_id'] or $_SESSION['tipo_usuario'] == 1) {
						echo $this->Html->link(__('Editar'), array('action' => 'edit', $material['Material']['id']));
						echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $material['Material']['id']), array(), __('¿Desea eliminar el archivo %s?', $material['Material']['nombre']));
					}
				?>
			</li>
			<li><?php echo $this->Html->link(__('Descargar'), array('action' => 'download', $material['Material']['id'])); ?> </li> 

		</ul>
	</div>
	
</div>

<?php 
	$this->set('archivos', 1);
	$this->set('verArchivo', 1);
	echo $this->element('acciones');
?>
