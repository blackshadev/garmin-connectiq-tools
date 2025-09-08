#!/bin/sh

mkdir -p .home/.Garmin/

docker build --platform linux/amd64 -t garmin-connectiq-device-downloader -f device-downloader.Dockerfile .

docker run --platform linux/amd64 -v ${PWD}/.home/.Garmin:/root/.Garmin -e DISPLAY=docker.for.mac.host.internal:0 -it garmin-connectiq-device-downloader 
