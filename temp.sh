#!/bin/sh

while [ 1 ]; do
  t=$(cat /sys/devices/w1_bus_master1/28-0417c3d140ff/w1_slave | tail -1 | cut -d= -f2)
  o="${t:0:2}.${t:2:3}"
  /storage/.kodi/addons/service.mosquitto/bin/mosquitto_pub \
    -P mosquitto \
    -u mosquitto \
    -t mqtt/dom/parter/salon/temperatura \
    -m $o
  sleep 60
done
