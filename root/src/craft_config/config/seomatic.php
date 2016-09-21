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
    'stage.' => array(
        "renderGoogleAnalyticsScript" => false, // The analytics script is already disabled in devMode we should disable it on the stage site as well.
    )
);
