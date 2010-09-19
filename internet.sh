#!/usr/local/bin/bash
ifconfig fxp0 ether 00:1b:11:0c:61:a0
ifconfig fxp0 media 10baset/utp  
ppp -ddial broadmax
ifconfig tun0 mtu 1492
