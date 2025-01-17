#!/bin/bash

# Script için gerekli servis ve timer dosyalarının adları
SERVICE_NAME="update-script.service"
TIMER_NAME="update-script.timer"

# Servis dosyasının içeriği
cat <<EOF | sudo tee /etc/systemd/system/$SERVICE_NAME
[Unit]
Description=Run update script from GitHub

[Service]
ExecStart=/bin/bash -c 'curl -sSL https://raw.githubusercontent.com/WatchAnime-com/wanim-service-autoupdate/refs/heads/main/auto_update.sh | bash'

[Install]
WantedBy=multi-user.target
EOF

# Timer dosyasının içeriği
cat <<EOF | sudo tee /etc/systemd/system/$TIMER_NAME
[Unit]
Description=Run update script every hour

[Timer]
OnUnitActiveSec=1h
Unit=$SERVICE_NAME

[Install]
WantedBy=timers.target
EOF

# systemd daemon'u yeniden yükle
sudo systemctl daemon-reload

# Timer'ı etkinleştir ve başlat
sudo systemctl enable $TIMER_NAME
sudo systemctl start $TIMER_NAME

# Durumu kontrol et
sudo systemctl status $TIMER_NAME
