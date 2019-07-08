#!/bin/bash

#First automatically find project directory
cd ../
projectdir=$(pwd)
cd config/

if hash nvidia-docker 2>/dev/null; then
        sed "s#{{IMAGE}}#phimal/projects:diffusioncharacterization#g" docker_sync_templates/docker-compose_gpu.yml > docker-compose.yml
    else
        sed "s#{{IMAGE}}#phimal/projects:diffusioncharacterization#g" docker_sync_templates/docker-compose_cpu.yml > docker-compose.yml
    fi


# Setting mounting directory
sed -i "s#{{PROJECTDIR}}#$projectdir#g" docker-compose.yml

if [ ! "$(docker ps -a -f name=config_compute_1)" ]; then
    docker-compose restart config_compute_1
   else
    docker-compose up -d
   fi

