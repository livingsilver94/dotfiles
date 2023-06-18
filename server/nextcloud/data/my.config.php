<?php
$CONFIG = array (
  'trusted_domains' =>
  array (
    0 => 'localhost',
    1 => '{{caddy.domain}}',
  ),
  'datadirectory' => '/media/storage',
  'memcache.local' => '\OC\Memcache\APCu',
  'memcache.distributed' => '\OC\Memcache\Redis',
  'memcache.locking' => '\OC\Memcache\Redis',
  'redis' => [
    'host' => '/run/redis/redis-server.sock',
    'port' => 0,
  ],
);