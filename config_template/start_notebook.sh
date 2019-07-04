#!/bin/bash

#First automatically find project directory
cd ../
projectdir=$(pwd)
cd config/

# Make docker-sync for project
sed "s#{{PROJECT_FOLDER}}#$projectdir#g" docker_sync_templates/docker-sync_template.yml > docker-sync.yml

if hash nvidia-docker 2>/dev/null; then
        sed "s#{{IMAGE}}#[PASTE DOCKER IMAGE NAME HERE]#g" docker_sync_templates/docker-compose_gpu.yml > docker-compose.yml
    else
        sed "s#{{IMAGE}}#[PASTE DOCKER IMAGE NAME HERE]#g" docker_sync_templates/docker-compose_cpu.yml > docker-compose.yml
    fi

# Clean old docker-sync
sudo docker-sync-stack clean

# Run docker sync 
sudo docker-sync-stack start
