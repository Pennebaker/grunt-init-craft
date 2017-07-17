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
            'baseUrl'  => 'http://{%= domain_name %}.{%= domain_tld %}/',
            'enableBugHerd' => false,
            'BugHerdAPIKey' => '',
        )
    ),

    'stage.' => array(
        'environmentVariables' => array(
            'baseUrl'  => 'http://stage.{%= domain_name %}.{%= domain_tld %}/',
            'enableBugHerd' => true,
        )
    ),

    'dev.' => array(
        'cache' => false,
        'enableTemplateCaching' => false,

        'environmentVariables' => array(
            'baseUrl'  => 'http://dev.{%= domain_name %}.{%= domain_tld %}/',
            'enableBugHerd' => true,
        )
    ),

    '.dev' => array(
        'devMode' => true,
        'cache' => false,
        'enableTemplateCaching' => false,

        'environmentVariables' => array(
            'baseUrl'  => 'http://{%= domain_name %}.dev/',
            'enableBugHerd' => true,
        )
    ),
);
