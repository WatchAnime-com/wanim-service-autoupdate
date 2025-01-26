#!/bin/bash

# Docker image'ı çek
docker pull criy/wanim-services:video-gateway-server-latest
docker pull criy/wanim-services:config-server-latest
docker pull criy/wanim-services:discovery-server-latest
docker pull criy/wanim-services:gateway-server-latest
docker pull criy/wanim-services:video-list-service-latest
docker pull criy/wanim-services:user-service-latest
docker pull criy/wanim-services:video-node-server-latest
docker pull criy/wanim-services:video-service-latest

# Buraya ek olarak yapmak istediğiniz başka işlemleri de ekleyebilirsiniz
