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
		
		<dt><?php echo __('Curso'); ?></dt>
		<dd><?php echo h($myFile['Curso']['nombre']); ?>&nbsp;</dd>
		
	</dl>
	
	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('Descargar'), array('action' => 'download', $myFile['MyFile']['id'])); ?> </li> 
		</ul>
	</div>
	
</div>
<?php 
$this->set('verArchivo', 1);
echo $this->element('acciones'); 
?>