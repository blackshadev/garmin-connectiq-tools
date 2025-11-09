#!/bin/sh

tar -zcf ./devices2.tar.gz -C ~/.Garmin/ConnectIQ/Devices/ .
rm -rf devices.tar.gz
mv devices2.tar.gz devices.tar.gz
