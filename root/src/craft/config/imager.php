<?php

/**
 * Imager Configuration
 *
 * All of your imager configuration settings go in here.
 * You can see a list of the default settings in craft/plugins/imager/config.php
 */

return array(
    '*' => array(
        'removeMetadata' => true,
    ),
    '.dev' => array(
        'cacheEnabled' => false,
        'imagerSystemPath' => $_SERVER['HOME'] . '/.valet/Sites/{%= domain_name %}/public/imager', // This is needed since valet doesn't report set the $_SERVER['DOCUMENT_ROOT'] properly
    )
);
