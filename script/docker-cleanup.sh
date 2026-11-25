#!/bin/bash

docker image prune -f
docker container prune -f
# Remove build cache not used for 30 days
docker builder prune -f --filter until=720h

# Completely all delete
# docker system prune -a -f
