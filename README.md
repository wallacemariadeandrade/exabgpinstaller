# exabgpinstaller
An easy way to install [ExaBGP](https://github.com/Exa-Networks/exabgp).

```root@debian11:~# apt install -y git```

```root@debian11:~# git clone https://github.com/wallacemariadeandrade/exabgpinstaller.git```

```root@debian11:~# cd exabgpinstaller/```

```root@debian11:~/exabgpinstaller# chmod +x exabgpinstaller.sh```

```root@debian11:~/exabgpinstaller# ./exabgpinstaller.sh```

BGP neighbors configurations file is ```/etc/exabgp/exabgp.conf```.

Have fun!

## Commands
Some usefull commands:

```
exabgpcli show neighbor summary

exabgpcli neighbor 10.100.1.27 announce route 100.101.255.200 next-hop 172.31.31.2 community 65001:666

exabgpcli neighbor 10.100.1.27 withdraw route 100.101.255.200 next-hop 172.31.31.2 community 65001:666

exabgpcli neighbor 170.150.220.254 announce flow route source-ipv4 198.18.2.210/32 redirect-to-nexthop-ietf 10.99.90.2

```