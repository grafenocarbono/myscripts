#!/bin/bash
sudo ufw allow 5901/tcp
sudo apt install xfce4 xfce4-goodies tightvncserver
sudo vncserver
sudo vncserver -kill :1
echo "startxfce4" >> ~/.vnc/xstartup
vncserver
"[Unit]
Description=TightVNC server
After=syslog.target network.target

[Service]
Type=forking
User=root
PAMName=login
PIDFile=/root/.vnc/%H:1.pid
ExecStartPre=-/usr/bin/vncserver -kill :1 > /dev/null 2>&1
ExecStart=/usr/bin/vncserver
ExecStop=/usr/bin/vncserver -kill :1

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/vncserver.service

sudo systemctl daemon-reload

