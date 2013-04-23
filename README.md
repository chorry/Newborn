Newborn
=======

Bunch of scripts to setup software at new dev. machine up and running. Well, kinda :/



Autohosts
---------
* Custom hosts goes to /var/www/%foldername% + you have to make custom vhosts config for apache and a2ensite %configname%
  Hosts are available as %yourhostname%.dev
* Auto hosts goes to /var/www/autohosts/%foldername%/



Example setup
-------------
Host:
* served by apache:
** http://example.dev:8000/
** http://www-masters.example.dev

* served by nginx
** http://example.dev/    (direct proxy to apache master)
** http://example.dev:81/ (slave1 proxy to master)
** http://example.dev:82/ (slave2 cache to slave1)


