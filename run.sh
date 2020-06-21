#!/bin/bash
sed -i -e 's/INTERFACESv4=""/INTERFACESv4="eth0"/g' /etc/default/isc-dhcp-server
if [ ! -f /var/lib/dhcp/dhcpd.leases ]; then
	touch /var/lib/dhcp/dhcpd.leases
fi

chmod 644 /etc/bind/rndc.key

/usr/sbin/named -g &
sleep 1
/usr/sbin/dhcpd -d -f