apt install -y python3-pip && pip3 install exabgp
exabgp --fi > /usr/local/etc/exabgp/exabgp.env
sed -i "s/pipename = 'exabgp'/pipename = 'root'/g" /usr/local/etc/exabgp/exabgp.env
sed -i "s/user = 'nobody'/user = 'root'/g" /usr/local/etc/exabgp/exabgp.env
mkdir /etc/exabgp
touch /etc/exabgp/exabgp.conf
cat > /etc/exabgp/exabgp.conf <<EOL
neighbor 10.100.1.27 {
    local-address 10.100.1.51;
    peer-as 64512;
    local-as 64512;
    router-id 10.100.1.51;
    description "RT-CGNAT";
    family {
      ipv4 unicast;
    }
} 
EOL
touch /etc/systemd/system/exabgp.service
cat > /etc/systemd/system/exabgp.service <<EOL
[Unit]
Description=ExaBGP
Documentation=man:exabgp(1)
Documentation=man:exabgp.conf(5)
Documentation=https://github.com/Exa-Networks/exabgp/wiki
After=network.target
ConditionPathExists=/etc/exabgp/exabgp.conf
 
[Service]
Environment=exabgp_daemon_daemonize=false
ExecStartPre=/bin/bash -c "mkfifo /run/root.{in,out}"
ExecStart=/usr/local/bin/exabgp /etc/exabgp/exabgp.conf
User=root
Restart=always
SyslogIdentifier=ExaBGP

[Install]
WantedBy=multi-user.target
EOL

systemctl enable exabgp.service
systemctl start exabgp
systemctl status exabgp
