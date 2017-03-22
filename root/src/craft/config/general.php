<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(
    '*' => array(
        'omitScriptNameInUrls' => true,
        'enableCsrfProtection' => true,
        'maxUploadFileSize' => '120000000',

        'environmentVariables' => array(
            'baseUrl'  => 'http://example.com/',
            'enableBugHerd' => false,
        )
    ),

    'stage.' => array(
        'environmentVariables' => array(
            'baseUrl'  => 'http://stage.example.com/',
            'enableBugHerd' => true,
        )
    ),

    'dev.' => array(
        'cache' => false,
        'enableTemplateCaching' => false,

        'environmentVariables' => array(
            'baseUrl'  => 'http://dev.example.com/',
            'enableBugHerd' => true,
        )
    ),

    '.dev' => array(
        'devMode' => true,
        'cache' => false,
        'enableTemplateCaching' => false,

        'environmentVariables' => array(
            'baseUrl'  => 'http://example.dev/',
            'enableBugHerd' => true,
        )
    ),
);
