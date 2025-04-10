#!/usr/bin/env bash
#
# ------------------------------------------------------------
# Important Commands
#   nmcli -p device show
# ------------------------------------------------------------
#
#
time=$(date +'%Y-%m-%d %X')
user=$(id -u -n)
host=$(cat /proc/sys/kernel/hostname)
ssid=$(nmcli connection show --active | sed 's/[  ]\+/:/g' | cut -d\: -f1 | tr '\n' ':' | cut -d\: -f2)
ip=$(nmcli -p device show | grep IP4.ADDRESS | sed 's/[ :]\+/:/g' | tr '\n' ':' | cut -d\: -f2)
mem=$(free -h | sed 's/[  ]\+/:/g' | cut -d\: -f4 | tr "\n" ":" | cut -d\: -f2)
ker=$(uname -r)

echo ${ker} \| ${mem} \| ${ssid}\@${ip} \| ${user}\@${host} \| ${time}
