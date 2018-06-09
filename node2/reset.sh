#!/bin/bash
docker-compose -f docker-compose-dev.yml down
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)