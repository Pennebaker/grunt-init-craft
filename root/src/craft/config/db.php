<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

return array(
    '*' => array(
			// The database server name or IP address. Usually this is 'localhost' or '127.0.0.1'.
			'server' => '127.0.0.1',
			// The database username to connect with.
			'user' => '{%= server_user %}',
			// The database password to connect with.
			'password' => 'DB_PASSWORD',
			// The name of the database to select.
			'database' => '{%= domain_name %}_cmsdb_prod',
			// The prefix to use when naming tables. This can be no more than 5 characters.
			'tablePrefix' => 'craft',
    ),
    'stage.' => array(
			// The database server name or IP address. Usually this is 'localhost' or '127.0.0.1'.
			'server' => '127.0.0.1',
			// The database username to connect with.
			'user' => '{%= server_user %}',
			// The database password to connect with.
			'password' => 'DB_PASSWORD',
			// The name of the database to select.
			'database' => '{%= domain_name %}_cmsdb_stage',
			// The prefix to use when naming tables. This can be no more than 5 characters.
			'tablePrefix' => 'craft',
    ),
    'dev.' => array(
			// The database server name or IP address. Usually this is 'localhost' or '127.0.0.1'.
			'server' => '127.0.0.1',
			// The database username to connect with.
			'user' => '{%= server_user %}',
			// The database password to connect with.
			'password' => 'DB_PASSWORD',
			// The name of the database to select.
			'database' => '{%= domain_name %}_cmsdb_dev',
			// The prefix to use when naming tables. This can be no more than 5 characters.
			'tablePrefix' => 'craft',
    ),
    '.dev' => array(
			// The database server name or IP address. Usually this is 'localhost' or '127.0.0.1'.
			'server' => '127.0.0.1',
			// The database username to connect with.
			'user' => 'root',
			// The database password to connect with.
			'password' => '',
			// The name of the database to select.
			'database' => '{%= domain_name %}_cmsdb_dev',
			// The prefix to use when naming tables. This can be no more than 5 characters.
			'tablePrefix' => 'craft',
    ),
);
