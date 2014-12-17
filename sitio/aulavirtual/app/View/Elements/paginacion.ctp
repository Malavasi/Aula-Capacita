<p>
	<?php
		echo $this->Paginator->counter(array(
			'format' => __('Página {:page} de {:pages}')
		));
	?>	
</p>
<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('Anterior '), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ' - '));
		echo $this->Paginator->next(__(' Siguiente') . ' >', array(), null, array('class' => 'next disabled'));
	?>
</div>