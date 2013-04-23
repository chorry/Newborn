<?php
print 'Hello from slave2 @'.$_SERVER['HTTP_HOST']."<br>";
print "Check how cache is working: ".rand()."<- this value should change only after 5 seconds (default value) after first request<br>";
print "And here is phpinfo for you:<br>";
phpinfo();
