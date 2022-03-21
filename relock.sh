#!/bin/sh

# set path
if [ -z "$(command -v fastboot)" ] && [ -e "fastboot" ]; then
  export PATH=$PWD/bin:$PATH
fi

# Defaults
default_platform="sdm636"
default_buildtype="user"
default_slot="a" # X00T/D an A only partition device

platform="$(fastboot getvar platform | grep platform | awk '{print $NF}')"
buildtype="$(fastboot getvar build-type 2>&1 | grep build-type | awk '{print $NF}')"
slot="$(fastboot getvar current-slot 2>&1 | grep current-slot | awk '{print $NF}')"

secret_key="$(fastboot getvar secret-key-opt 2>&1 | grep secret-key-opt | awk '{print $NF}')"
secret_partition="$(fastboot oem get_random_partition 2>&1 | grep bootloader | awk '{print $NF}')"

if [ -z "$platform" ];then
    platform="$default_platform"
fi

if [ -z "$buildtype" ];then
    buildtype="$default_buildtype"
fi

if [ -z "$slot" ];then
    slot="$default_slot"
fi

if [ "$buildtype" = "user" ];then
    fastboot flashing lock
    fastboot flashing lock_critical
fi

# Download (I don't even know what this part does)

if [ -e "${platform}_$2" ];then
    printf "begin fastboot download %s\n" "${platform}_$2"
    fastboot flash $1 ${platform}_$2
elif [ -e "$2" ];then
    printf "begin fastboot download %s \n" "$2"
    fastboot flash $1 $2
else
    printf "Can't find file: %s or %s, Skip!\n" "$2" "${platform}_$2"
fi

read -r answer -p "All done, do you want to reboot(y/n)? "
if [ "$answer" == "y" ] || [ "$answer" == "Y" ];then
    fastboot oem recovery_and_reboot
fi
