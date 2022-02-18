#!/bin/bash

#install grafana
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.0.4_amd64.deb
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_5.0.4_amd64.deb

sudo systemctl daemon-reload
sudo systemctl enable grafana-server 
sudo systemctl start grafana-server.service


# change default password

cat <<EOF > /etc/grafana/grafana.ini
[security]
admin_user = ${login}
admin_password = ${password}

EOF

sudo service grafana-server restart