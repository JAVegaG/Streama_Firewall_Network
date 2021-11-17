echo "Actualizar el servidor"

sudo yum -y update

echo "Instalar Wget"

sudo yum install wget -y

echo "Descargar Oracle Java"

sudo wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

echo "Instalar Oracle Java"

sudo yum -y localinstall jdk-8u131-linux-x64.rpm

echo "Descargar el paquete Streama War"

sudo wget https://github.com/streamaserver/streama/releases/download/v1.10.3/streama-1.10.3.jar

echo "Crear directorio de streama y mover ahí el archivo"

sudo mkdir /opt/streama
sudo mv streama-1.10.3.jar /opt/streama/streama.war

echo "Crear Directorio para guardar datos multimedia y configurar sus servicios"

sudo mkdir /opt/streama/media
sudo chmod 664 /opt/streama/media

echo "Crear el servicio de Streaming"

sudo echo "[Unit]" >> /etc/systemd/system/streama.service
sudo echo "Description=Streama Server" >> /etc/systemd/system/streama.service
sudo echo "After=syslog.target" >> /etc/systemd/system/streama.service
sudo echo "After=network.target" >> /etc/systemd/system/streama.service
sudo echo " " >> /etc/systemd/system/streama.service
sudo echo "[Service]" >> /etc/systemd/system/streama.service
sudo echo "User=root" >> /etc/systemd/system/streama.service
sudo echo "Type=simple" >> /etc/systemd/system/streama.service
sudo echo "ExecStart=/bin/java -jar /opt/streama/streama.war" >> /etc/systemd/system/streama.service
sudo echo "Restart=always" >> /etc/systemd/system/streama.service
sudo echo "StandardOutput=syslog" >> /etc/systemd/system/streama.service
sudo echo "StandardError=syslog" >> /etc/systemd/system/streama.service
sudo echo "SyslogIdentifier=Streama" >> /etc/systemd/system/streama.service
sudo echo " " >> /etc/systemd/system/streama.service
sudo echo "[Install]" >> /etc/systemd/system/streama.service
sudo echo "WantedBy=multi-user.target" >> /etc/systemd/system/streama.service

echo "Habilitar e iniciar servicio"

systemctl start streama
systemctl enable streama