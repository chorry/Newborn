EXTS=`php -r 'foreach (PDO::getAvailableDrivers() as $driver) { echo $driver . PHP_EOL; }'`
echo $EXTS
