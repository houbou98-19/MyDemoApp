#!/bin/bash

resource_group=DockerDemoRG
location=northeurope
env_name=DockerDemoEnv
app_name=dockerdemoapp
app_port=8080
image=ghcr.io/houbou98-19/mydemoapp

az group create --location $location --name $resource_group

az containerapp env create --name $env_name --resource-group $resource_group --location $location

az containerapp create --name $app_name --resource-group $resource_group \
                       --image $image \
                       --environment $env_name \
                       --target-port $app_port \
                       --ingress external --query properties.configuration.ingress.fqdn