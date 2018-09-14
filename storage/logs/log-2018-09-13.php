<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2018-09-13 19:06:01 --> Email could not been sent. Mailer Error (Line 179): Could not instantiate mail function.
ERROR - 2018-09-13 19:06:01 --> #0 C:\xampp\htdocs\appoint\application\controllers\Appointments.php(575): EA\Engine\Notifications\Email->sendAppointmentDetails(Array, Array, Array, Array, Array, Object(EA\Engine\Types\Text), Object(EA\Engine\Types\Text), Object(EA\Engine\Types\Url), Object(EA\Engine\Types\Email), Object(EA\Engine\Types\Text))
#1 [internal function]: Appointments->ajax_register_appointment()
#2 C:\xampp\htdocs\appoint\system\core\CodeIgniter.php(532): call_user_func_array(Array, Array)
#3 C:\xampp\htdocs\appoint\index.php(353): require_once('C:\\xampp\\htdocs...')
#4 {main}
