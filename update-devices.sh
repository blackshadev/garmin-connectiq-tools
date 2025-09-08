#!/bin/sh

DIR='.home/.Garmin/ConnectIQ/Devices'
tar -zcf ./devices2.tar.gz -C "$DIR" .
