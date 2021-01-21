#!/usr/bin/env sh

set -e

echo 'Deleting stopped containers'
docker container prune -f

echo 'Deleting unusued volumes'
docker volume prune -f

echo 'Deleting unused images'
docker image prune -a -f --filter "until=2h"

echo 'Clearing build cache'
docker builder prune -a -f --filter "until=6h" --keep-storage=8G