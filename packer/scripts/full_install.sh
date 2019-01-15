#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt-get update -y
apt-get install -y ruby-full ruby-bundler build-essential mongodb-org
systemctl enable mongod
systemctl start mongod

cd /opt
git clone -b monolith https://github.com/express42/reddit.git
cd /opt/reddit
bundle install

cat <<EOF | sudo tee /etc/systemd/system/reddit.service
[Unit]
Description=Reddit App

[Service]
WorkingDirectory=/opt/reddit/
ExecStart=/usr/local/bin/puma --dir /opt/reddit/
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl enable reddit
