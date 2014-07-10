<h1>Edit Post</h1>
<?php
echo $this->Form->create('Curso');
echo $this->Form->input('nombre');
echo $this->Form->input('fechainicio');
echo $this->Form->input('fechafin');
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->end('Actualizar curso');
?>