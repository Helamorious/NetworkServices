#!/bin/bash
sed -i -e 's/INTERFACESv4=""/INTERFACESv4="eth0"/g' /etc/default/isc-dhcp-server
if [ ! -f /var/lib/dhcp/dhcpd.leases ]; then
	touch /var/lib/dhcp/dhcpd.leases
fi

/usr/sbin/named -g >> /var/log/named.log 2>&1 &
sleep 1
/usr/sbin/dhcpd -d -f >> /var/log/dhcp.log 2>&1 
