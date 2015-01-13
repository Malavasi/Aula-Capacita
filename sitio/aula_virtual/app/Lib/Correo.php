<?php
App::uses('CakeEmail', 'Network/Email');
class Correo{
    public function enviar($destino,$motivo,$plantilla,$variables,$incluirManual) {
       $Email = new CakeEmail('default');
       $Email->from(array('soporte@capacita.co' => 'Soporte Capacita'));
       $Email->to($destino);
       $Email->subject($motivo);
       $Email->template($plantilla);
       $Email->viewVars($variables);
       $Email->emailFormat('html');
	   if($incluirManual)
       {
        $Email->attachments(array('manual_usuario.pdf' => WWW_ROOT.'files/Manual.pdf'));
	   }
       $Email->send();
                    
    }
}
?>