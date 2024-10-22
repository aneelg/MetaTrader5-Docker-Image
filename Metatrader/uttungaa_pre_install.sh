# !/bin/bash

machine_arch=$(uname -m)
echo $machine_arch

sudo mkdir /opt/uttungaa/; sudo mkdir /opt/uttungaa/logs/; 
# sudo mkdir /opt/uttungaa/lib/; 
sudo mkdir /opt/uttungaa/scripts/; 
# sudo apt-get install unzip -y; 
sudo apt-get update -y; 
# sudo apt-get install net-tools -y; 
sudo apt install -y jq; 
sudo apt install -y vim-tiny;
# sudo apt install python3-pip -y; 


sudo apt install -y postgresql;
# Deb 11 needs the below command to start postgres
sudo -u postgres pg_ctlcluster 15 main start

sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'asterisk';"
sudo -u postgres psql -U postgres -d jyothik8674665 -c "insert into strategy_config (name,index,lots,deploy_on,entry_mod,stop_loss,status,paper,entry_day,entry_time,exit_day,exit_time) values ('MT5','XAUUSDc',0.01,'DEV','500',1, 'ACTIVE','false',6,'10:00', 5, '15:20');"

# postgresql-contrib -y;pip install psycopg2-binary;
sudo apt-get install moreutils -y; 
sudo apt-get install -y supervisor;
sudo apt-get install -y net-tools;

# if [[ "$machine_arch" == "aarch64" ]]; then
#     echo "ARM architecture"
#     sudo apt install snapd; sudo snap install chromium
# elif [[ "$machine_arch" == "x86_64" ]]; then
#     echo "x86_64 architecture"
#     sudo apt update -y; sudo apt install -y wget gnupg ca-certificates; wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -; echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list;sudo apt update -y;sudo apt install google-chrome-stable -y; sudo apt-get -f install -y;
# else
#     echo "Unknown architecture"
# fi

# (wget "https://meshcentral.com/meshagents?script=1" -O ./meshinstall.sh || wget "https://meshcentral.com/meshagents?script=1" --no-proxy -O ./meshinstall.sh) && chmod 755 ./meshinstall.sh && sudo -E ./meshinstall.sh https://meshcentral.com 'NlmFaSfnDRMlOWgI$B5WylQjvw03n4$m1qUgs9rl5JsVtXmIIAZsLTUt4b3OxUpO' || ./meshinstall.sh https://meshcentral.com 'NlmFaSfnDRMlOWgI$B5WylQjvw03n4$m1qUgs9rl5JsVtXmIIAZsLTUt4b3OxUpO'
# sudo timedatectl set-timezone Asia/Kolkata
sudo wget https://scm-analytics.s3.amazonaws.com/uttungaa_package/scripts/versions.json -O /opt/uttungaa/scripts/versions.json
sudo wget https://scm-analytics.s3.amazonaws.com/uttungaa_package/scripts/user.conf -O /opt/uttungaa/scripts/user.conf
sudo wget https://scm-analytics.s3.amazonaws.com/uttungaa_package/scripts/postgresql.conf -O /opt/uttungaa/scripts/postgresql.conf
sudo wget https://scm-analytics.s3.amazonaws.com/uttungaa_package/scripts/pg_hba.conf -O /opt/uttungaa/scripts/pg_hba.conf
sudo wget https://scm-analytics.s3.amazonaws.com/uttungaa_package/scripts/uttungaa_update_forex.sh -O /opt/uttungaa/scripts/uttungaa_update_forex.sh
sudo wget https://scm-analytics.s3.amazonaws.com/uttungaa_package/scripts/update_forex.conf -O /etc/supervisor/conf.d/update_forex.conf
sudo chmod a+x /opt/uttungaa/scripts/uttungaa_update_forex.sh
