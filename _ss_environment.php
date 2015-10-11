<?php

/* This file gives SilverStripe information about the environment that it's 
running in */
define('SS_ENVIRONMENT_TYPE', 'dev');
 
/* This defines a default database user */
define('SS_DATABASE_SERVER', '127.0.0.1');
define('SS_DATABASE_USERNAME', 'root');
define('SS_DATABASE_PASSWORD', '');

define('SS_DATABASE_NAME', 'silverstripe');

 /* The username of the default admin - this is a non-database user with 
 administrative privileges.*/
define('SS_DEFAULT_ADMIN_USERNAME', 'admin');

 /* The password of the default admin. */
define('SS_DEFAULT_ADMIN_PASSWORD', 'password');

global $_FILE_TO_URL_MAPPING;
$_FILE_TO_URL_MAPPING['/var/www'] = 'http://localhost';

// This causes errors to be written to the BASE_PATH/silverstripe.log file.
// Path must be relative to BASE_PATH
define('SS_ERROR_LOG', 'silverstripe.log');