# based on https://github.com/matco/connectiq-tester/blob/master/Dockerfile

FROM alpine:3.21 AS installer_sdk

RUN apk -U --no-cache add \
    curl \
    jq \
    unzip \
    tar

ENV CONNECT_IQ_VERSION=7.4.3
ENV CONNECT_IQ_HOME=/connectiq
RUN mkdir -p /connectiq /connectiq-devices

# Download SDK
COPY downloader.sh /root/downloader.sh
RUN /root/downloader.sh

FROM alpine:3.21 AS installer_devices

# Copy devices from local
COPY devices.tar.gz /tmp/devices.tar.gz
RUN tar -xzf /tmp/devices.tar.gz -C /connectiq-devices

FROM alpine:3.21

ENV CONNECT_IQ_HOME=/connectiq
ENV PATH=${PATH}:${CONNECT_IQ_HOME}/bin

COPY --from=installer_sdk /connectiq ${CONNECT_IQ_HOME}

RUN mkdir -p /root/.Garmin/ConnectIQ/Devices
COPY --from=installer_devices /connectiq-devices /root/.Garmin/ConnectIQ/Devices

COPY releaser.sh ${CONNECT_IQ_HOME}/bin/

RUN apk -U --no-cache add \
	openjdk17-jre-headless

ENTRYPOINT [ "/bin/sh" ]