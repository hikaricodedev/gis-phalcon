<?php

use Phalcon\Autoload\Loader;

$loader = new Loader();

/**
 * Register Namespaces
 */
$loader->setNamespaces([
    'Gis\Models' => APP_PATH . '/common/models/',
    'Gis'        => APP_PATH . '/common/library/',
]);

/**
 * Register module classes
 */
$loader->setClasses([
    'Gis\Modules\Frontend\Module' => APP_PATH . '/modules/frontend/Module.php',
    'Gis\Modules\Cli\Module'      => APP_PATH . '/modules/cli/Module.php'
]);

$loader->register();
