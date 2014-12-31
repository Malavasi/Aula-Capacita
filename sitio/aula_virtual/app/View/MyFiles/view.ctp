<div class="myFiles view">
	
<h2><?php echo __('Archivo'); ?></h2>
	<dl>		
		<dt><?php echo __('Nombre'); ?></dt>
		<dd><?php echo $this->Html->link($myFile['MyFile']['name'], array('action' => 'download', $myFile['MyFile']['id'])); ?>&nbsp;</dd>
				
		<dt><?php echo __('Tamaño'); ?></dt>
		<dd><?php echo h($myFile['MyFile']['size']), ' B'; ?>&nbsp;</dd>
		
		<dt><?php echo __('Incluído'); ?></dt>
		<dd><?php echo h($myFile['MyFile']['created']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Subido por'); ?></dt>
		<dd><?php echo $myFile['Usuario']['nombre'], ' ', $myFile['Usuario']['apellidos']; ?>&nbsp;</dd>
		
		<dt><?php echo __('Programas Recomendados'); ?></dt>
		<dd><?php echo $myFile['MyFile']['programas']; ?>&nbsp;</dd>
		
		<dt><?php echo __('Descripción'); ?></dt>
		<dd><?php echo h($myFile['MyFile']['descripcion']); ?>&nbsp;</dd>
		
	</dl>
	
	<div class="actions">
		<ul>
			<li>
				<?php 
					if (isset($_SESSION['id_usuario']) and $_SESSION['id_usuario'] == $myFile['MyFile']['usuario_id'] or $_SESSION['tipo_usuario'] == 1) {
						echo $this->Html->link(__('Editar'), array('action' => 'edit', $myFile['MyFile']['id']));
						echo $this->Form->postLink(__('Eliminar'), array('action' => 'delete', $myFile['MyFile']['id']), array(), __('¿Desea eliminar el archivo %s?', $myFile['MyFile']['name']));
					}
				?>
			</li>
			<li><?php echo $this->Html->link(__('Descargar'), array('action' => 'download', $myFile['MyFile']['id'])); ?> </li> 

		</ul>
	</div>
	
</div>

<?php 
	$this->set('archivos', 1);
	$this->set('verArchivo', 1);
	echo $this->element('acciones');
?>
