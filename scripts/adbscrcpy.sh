#!/usr/bin/env bash

adb devices
if adb devices | grep -wi "device" > /dev/null 2>&1; then
	echo "[OK] Device found"
	tcpip 5555
	deviceip=192.168.0.10:5555
else
	echo "[ER] Device not found"
fi

adb connent $deviceip

scrcpy & disown
