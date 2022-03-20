rm /usr/bin/thu-checkin.py
rm /etc/systemd/system/{thu-checkin.service,thu-checkin.timer}

systemctl daemon-reload