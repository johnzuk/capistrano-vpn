#!/bin/bash
echo $PASSWORD | openconnect $SERVER --user=$USER --authgroup=$GROUP -b

sleep 5

iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -A FORWARD -i eth0 -j ACCEPT

route del -net 172.17.0.0 netmask 255.255.240.0 dev tun0

exec "$@"
