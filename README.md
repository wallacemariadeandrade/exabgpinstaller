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

```exabgpcli show neighbor summary```

```exabgpcli neighbor 10.100.1.27 announce route 100.101.255.200 next-hop 172.31.31.2 community 65001:666```