#!/bin/bash

#First automatically find project directory
cd ../
projectdir=$(pwd)
cd config/

# Make docker-sync for project
sed "s#{{PROJECT_FOLDER}}#$projectdir#g" docker_templates/docker-sync_template.yml > docker-sync.yml

#Make docker-compose file dependent for cpu
sed "s#{{IMAGE}}#[FILL IMAGE HERE]#g" docker_templates/docker-compose_template.yml > docker-compose.yml

# Clean old docker-sync-stack
sudo docker-sync-stack clean

# Run docker sync 
sudo docker-sync-stack start
