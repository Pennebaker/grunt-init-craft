<?php

/**
 * SEOmatic Configuration
 *
 * Completely optional configuration settings for SEOmatic if you want to customize some
 * of its more esoteric behavior, or just want specific control over things.
 *
 * Don't edit this file, instead copy it to 'craft/config' as 'seomatic.php' and make
 * your changes there.
 */

return array(
    '*' => array(
        "globalMetaOverride" => array(
            'robots'                    => 'all',
        )
    ),
    'stage.' => array(
        "renderGoogleAnalyticsScript" => false,
        "globalMetaOverride" => array(
            'robots'                    => 'none',
        )
    ),
    'dev.' => array(
        "renderGoogleAnalyticsScript" => false,
        "globalMetaOverride" => array(
            'robots'                    => 'none',
        )
    ),
    '.dev' => array(
        "renderGoogleAnalyticsScript" => false,
        "globalMetaOverride" => array(
            'robots'                    => 'none',
        )
    )
);
