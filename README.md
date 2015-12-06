# Magento 2 CookBook Docker - Sample Data

 
## Kudos and Respect

In order to produce this docker repo for Magento 2 I borrowed heavily from both Alan Kent and Mark Shust.

# Manual Changes


# Pre-Requisites

1. Install Docker (I'm on OSX)
2. Install Docker Compose
3. Open Docker via Applications->Docker->Terminal
4. Add docker ip address alias to /etc/hosts e.g. 192.168.99.100 docker.localhost.com

# Execution

1. git clone this
2. In base directory do `docker-compose build`
3. Go have a cup of tea
4. When finished do `docker-compose up`
5. Connect to magento in browser via your docker ip address (you see this when you first load docker terminal window) 


# Useful Docker commands

  docker ps

  docker images

  docker exec -it <image_id> bash

  docker stop


# Notes

Not intended in anyway for Production use.


#TODOs



