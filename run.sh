#!/bin/sh
config_file="/etc/ddclient/ddclient.conf"
delay=$(grep -v '^\s*#' "${config_file}" | grep -i -m 1 "daemon" | awk -F '=' '{print $2}')

if [ -z "${delay}" ]
then
  delay=3600
fi

while true
do
  ddclient -daemon=0 -verbose | grep -i 'success'
  sleep ${delay}
done
