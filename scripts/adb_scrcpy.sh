#!/usr/bin/env bash
#export MAIN_DEVICE=<device>

if adb devices | grep ".0."; then
	echo "[OK]: Connection found"

	device=$(adb devices | grep ".0." | awk '{print $1}')
	echo "[OK]: $device"

	if [ -n "$MAIN_DEVICE" ]; then
		echo "[INFO]: Using Preconfigured device"
		adb connect "$MAIN_DEVICE:5555"
	else
		adb connect "$device"
	fi
else
	adb tcpip 5555
	read -p $'\n[!]: Devices not detected.\nEnter device IP: ' device
	adb connect "$device"
fi

scrcpy >/dev/null 2>&1 &
disown

