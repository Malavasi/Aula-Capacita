<h1>Agregar Curso</h1>
<?php
echo $this->Form->create('Curso');
echo $this->Form->input('nombre');
echo $this->Form->input('fechainicio');
echo $this->Form->input('fechafin');
echo $this->Form->end('Guardar Curso');
?>