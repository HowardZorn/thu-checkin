cp thu-checkin.py /usr/bin/thu-checkin.py
cp thu-checkin@.service thu-checkin@.timer /etc/systemd/system

chmod 755 /usr/bin/thu-checkin.py

systemctl daemon-reload
