# Magento 2 CookBook Sample Data Docker

This Magento 2 Docker repo is used in the upcoming Magento 2 CookBook by Packtpub Publishing medio 2016
https://mage2cookbook.com/
written by: Ray Bogman & Vladimir Kerkhoff

## Kudos and Respect

In order to produce this Docker repo for Magento 2 I was inspirred by John Willis (Velocity Conf Amsterdam 2015), Alan Kent and Karen Baker.

And not to forget O'Reilly's Andrew Tork Baker for his great Docker video tutorial http://shop.oreilly.com/product/0636920035732.do

# Manual Changes

The repo is build on the stable Magento 2 data set incl.
- build Docker container and pushed to Docker hub https://hub.docker.com/u/raybogman/
- url rewrites enabled
- cleanup database - to start with a clean db
- bin/magento indexer:reindex
- bin/magento cache:clean
- bin/magento cache:flush
- bin/magento setup:static-content:deploy

There is also a Magento 2 clean Docker container https://github.com/mage2cookbook/mage2cookbook-docker-apache

- bin/magento sampledata:deploy
- php /var/www/magento2/composer.phar update

# Execution

1. Install Docker (I'm using a DigitalOcean droplet)

2. `docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin mysql:5.6`

3. Change the PUBLIC_HOST with your IP or domain name in the command below. It will automatically add the IP of domain to your Magento 2 configuration. 

4. `docker run --rm --name magento2 -it -p 80:80 --link mysql:mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=admin -e PUBLIC_HOST=yourdomain.com raybogman/mage2cookbook-sample-docker $*`

5. Go have a break, this will take some time

6. Open your browser en goto the addressed domain name or IP.

As you may see the Apache2 process is working in the FOREGROUND. You can kill it by using CTRL+C on the terminal.

Tip: Open a second terminal window and run `docker exec -it magento2 bash` this allows you to enter the Magento 2 container. All files are located in `/var/www/magento2/htdocs`. To enter the MySQL database use `docker exec -it mysql bash`

Magento username = admin,
Magento password = password123,
Backend URL	 = /admin

# Useful Docker commands

  docker ps

  docker images

  docker exec -it <image_id> bash

  docker stop

  docker rm -f $(docker ps -a -q)

  docker rmi -f $(docker images -q)


# Notes

Not intended in anyway for Production use.


#TODOs



