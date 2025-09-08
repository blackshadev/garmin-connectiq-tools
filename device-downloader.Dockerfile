# based on https://github.com/matco/connectiq-tester/blob/master/Dockerfile

FROM ubuntu:22.04

RUN apt update && apt install -y wget unzip curl libsecret-1-0 expat libxext6 libxkbcommon0 libxkbcommon-x11-0 libxxf86vm1 libsm6 libatk-bridge2.0-0 libgtk-3-0 libwebkit2gtk-4.0-37
RUN cd /root && wget https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip && unzip ./connectiq-sdk-manager-linux.zip

ENTRYPOINT [ "/bin/bash" ]

