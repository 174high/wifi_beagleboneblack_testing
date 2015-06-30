mount -o remount,rw /dev/block/stl6 /system

insmod /system/lib/modules/wlcore_sdio.ko 

netcfg wlan0 up

iw wlan0 scan|grep -e"SSID" -e "signal"

dhcpcd  wlan0

ping 192.168.1.1

hostapd -B /data/misc/wifi/hostapd.conf

ifconfig wlan0 192.168.100.1  netmask 255.255.255.0 

echo 1 > /proc/sys/net/ipv4/ip_forward
busybox udhcpd  /data/misc/wifi/udhcpd_wlan.conf
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE


iw phy `ls /sys/class/ieee80211/` interface add p2p0 type managed


#ifconfig p2p0 192.168.43.3 netmask 255.255.255.0 up

wpa_supplicant  -ip2p0 -Dnl80211 -c/data/misc/wifi/p2p_supplicant.conf &

wpa_cli -p /data/misc/wifi/wlan0

p2p_connect 8a:e3:ab:cb:4e:a4  pbc

0. p2p_find 

1.type it  p2p_connect  a2:e4:53:f0:83:8b  pbc  on our platform

2. connect our network on mobile 

3.dhcpcd  p2p-p2p0-0 






















