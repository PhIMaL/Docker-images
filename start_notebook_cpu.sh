#!/bin/bash

#First automatically find project directory
cd ../
projectdir=$(pwd)
cd config/

# Make docker-sync for project
sed "s#{{PROJECT_FOLDER}}#$projectdir#g" docker_templates/docker-sync_template.yml > docker-sync.yml

#Make docker-compose file dependent for cpu
sed "s#{{IMAGE}}#phimal/cpu:latest#g" docker_templates/docker-compose_cpu.yml > docker-compose.yml

# Run docker sync 
sudo docker-sync-stack start
