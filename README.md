# ConnectIQ tools

A Docker image with the ConnectIQ tools. It does not support the simulator due to missing library files, but all other tools work.

## Usage

This docker image contain all tools for interacting with the Garmin ConnectIQ toolset

`docker run -it ghcr.io/blackshadev/garmin-connectiq-tools:8.3.0`

### Releasing

`java -jar /connectiq/bin/monkeybrains.jar -e -r -w -o $OUTPUT -f $PROJECT -y $DEVELOPER_KEY`

### Compiling / Checking

`java -jar /connectiq/bin/monkeybrains.jar -f $PROJECT -d $DEVICE -o $OUTPUT -y $DEVELOPER_KEY -l $TYPE_CHECK_LEVEL`

## Updating

### Devices

Ensure you have installed all devices locally and run `./update_devices.sh` , it will archive all locally installed devices into the repository. There doesn't seems to be a way to download the devices without running garmin's sdk-manager, which is a GUI app. If you have the solution to this problem, hit me up

### SDK version

Change the version in the Dockerfile

## Based on

The files here are largely based on [prior work done by matco](https://github.com/matco/connectiq-tester). The difference being I focussed on optimising the docker image some more and I wanted to expose more tools besides only running unit tests in the most strict type checking level