#!/bin/sh

DIR='~/.Garmin/ConnectIQ/Devices'

if [[ "$OSTYPE" == "darwin"* ]]; then
    DIR='/Users/vincent/Library/Application Support/Garmin/ConnectIQ/Devices'
fi

tar -zcf ./devices2.tar.gz -C "$DIR" .
