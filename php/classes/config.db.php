<?php
/**/

if($_SERVER['SERVER_NAME'] == "localhost"){
	define( 'DB_HOST', 'localhost' ); // set database host
 	define( 'DB_USER', 'root' ); // set database user
 	define( 'DB_PASS', '12' ); // set database password
 	define( 'DB_NAME', 'ekrisenseva' ); // set database name
 	define( 'DISPLAY_DEBUG', true ); //display db errors?
}
else{
	define( 'DB_HOST', 'sql209.byethost.com' ); // set database host
 	define( 'DB_USER', 'b22_21794935' ); // set database user
 	define( 'DB_PASS', 'qwerty123456' ); // set database password
 	define( 'DB_NAME', 'b22_21794935_eKrisenSeva' ); // set database name
 	define( 'DISPLAY_DEBUG', true ); //display db errors?
}

?>