<?php
$CONFIG = array (
    'default_phone_region' => 'IT',
    'maintenance_window_start' => 1,
    'overwrite.cli.url' => "https://nextcloud." . getenv("MY_DOMAIN"),
    'overwriteprotocol' => 'https',
    'trusted_domains' => array(
        0 => 'localhost',
        1 => 'nextcloud.' . getenv("MY_DOMAIN"),
    ),
    'trusted_proxies' => array(
        0 => '127.0.0.1',
        1 => gethostbyname('caddy'),
    ),
);
