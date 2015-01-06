<div class="materiales form">
	<fieldset>
		<legend><?php echo __('Subir Archivo'); ?></legend>
		<h3><?php echo $infoCurso['Curso']['nombre'] ?></h3>
		<h4><?php echo 'Usuario: ', $_SESSION['nombre_usuario']; ?> </h4>
		<?php echo $this->Form->create('Material', array('type' => 'file')); ?>
		<?php
			echo $this->Form->input('link', array('label' => __('Link: ', true)));
			echo $this->Form->input('url', array('type' => 'file', 'label' => 'Archivo: '));
			echo $this->Form->input('programas', array('label' => __('Abrir con: ', true)));
			echo $this->Form->input('descripcion', array('label' => __('Descripción: ', true)));
		?>
		<br>
		<?php echo $this->Form->end(__('Subir')); ?>
	</fieldset>

</div>

<?php 
	$this->set('archivos', 1);
	echo $this->element('acciones');
?>
