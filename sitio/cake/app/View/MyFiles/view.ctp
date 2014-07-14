<div class="myFiles view">
<h2><?php echo __('Archivo'); ?></h2>
	<dl>		
		<dt><?php echo __('Nombre'); ?></dt>
		<dd><?php echo $this->Html->link($myFile['MyFile']['name'], array('action' => 'download', $myFile['MyFile']['id'])); ?>&nbsp;</dd>
				
		<dt><?php echo __('Tamaño'); ?></dt>
		<dd><?php echo h($myFile['MyFile']['size']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Incluído'); ?></dt>
		<dd><?php echo h($myFile['MyFile']['created']); ?>&nbsp;</dd>
		
		<dt><?php echo __('Subido por'); ?></dt>
		<dd><?php echo h($myFile['Usuario']['nick']); ?>&nbsp;</dd>
		
	</dl>
	
	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('Descargar'), array('action' => 'download', $myFile['MyFile']['id'])); ?> </li> 
		</ul>
	</div>
	
</div>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Editar Archivo'), array('action' => 'edit', $myFile['MyFile']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Eliminar Archivo'), array('action' => 'delete', $myFile['MyFile']['id']), array(), __('¿Desea eliminar el archivo %s?', $myFile['MyFile']['name'])); ?> </li>
		<li><?php echo $this->Html->link(__('Consultar Archivos'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('Subir Archivo'), array('action' => 'add')); ?> </li>
	</ul>
</div>
