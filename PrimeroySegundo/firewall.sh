echo "Se detienen servicios"

service NetworkManager stop
chkconfig NetworkManager off

echo "Configuracion del archivo systcl.conf, FORWARDING"

sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

echo "configuraciones de zonas public e internal"

firewall-cmd --set-default-zone=public

firewall-cmd --zone=public --add-interface=eth1
firewall-cmd --zone=public --add-interface=eth1 --permanent

firewall-cmd --zone=public --remove-interface=eth0
firewall-cmd --zone=public --remove-interface=eth0 --permanent

firewall-cmd --zone=public --remove-interface=eth2
firewall-cmd --zone=public --remove-interface=eth2 --permanent

firewall-cmd --zone=internal --add-interface=eth2
firewall-cmd --zone=internal --add-interface=eth2 --permanent

firewall-cmd --zone=public --add-masquerade
firewall-cmd --zone=public --add-masquerade --permanent

firewall-cmd --zone=internal --add-masquerade
firewall-cmd --zone=internal --add-masquerade --permanent

echo "Redireccion de puertos"

firewall-cmd --zone=public --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.5
firewall-cmd --zone=public --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.5 --permanent

echo "apertura de puerto 8080"

firewall-cmd --zone=public --add-port=8080/tcp
firewall-cmd --zone=public --add-port=8080/tcp --permanent
