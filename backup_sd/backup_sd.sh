## 
## Backup SilentDefense Script
## This will backup a Command Center if you uncomment out the nids copies it will backup a Sensor
## Created by Jonathan Jesse - Feb 2020
## 

mkdir /home/silentdefense/backup_$(date +%Y%m)
cd backup_$(date +%Y%m)

/etc/init.d/supervisor stop

sudo -u postgres pg_dump -Fc silentdefense > silentdefense_db.dump 
sudo -u postgres pg_dump -Fc druid > druid_db.dump 

sudo cp -R /opt/druid-data/ . 
sudo cp -R /opt/sdconsole/conf/ . 
sudo cp -R /opt/sdconsole/tomcat/conf . 
sudo cp -R /opt/sdconsole/ssl . 
# sudo cp -R /opt/nids/saved . 
# sudo cp -R /opt/nids/pcaps . 

/etc/init.d/supervisor start
