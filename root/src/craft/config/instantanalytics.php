<?php
/**
 * Instant Analytics Configuration
 *
 * Completely optional configuration settings for Instant Analytics if you want to customize some
 * of its more esoteric behavior, or just want specific control over things.
 *
 * Don't edit this file, instead copy it to 'craft/config' as 'instantanalytics.php' and make
 * your changes there.
 */
return array(
    '*' => array(
        "adminExclude" => true,
        "sendAnalyticsInDevMode" => false
    ),
    'stage.' => array(
        "sendAnalyticsData" => false
    ),
    'dev.' => array(
        "sendAnalyticsData" => false
    ),
    '.dev' => array(
        "sendAnalyticsData" => false
    )
);
