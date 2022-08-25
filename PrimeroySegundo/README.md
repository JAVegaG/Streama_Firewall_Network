# _**firewall server**_ and _**Streaming server**_ using _Streama_

The steps developed during this section are shown below:

- Design the network architecture.
- Configure the backend server with the media resources for the streaming service.
- Configure firewall interfaces to protect data so that resources on the backend can only be accessed through this server.
- Perform performance tests.
- Design the provisioning files based on the configurations that were necessary for the correct operation of the previous steps.
- Check the operation of the provisioning files.

Now, the first 3 articles are further developed:

## _**Design the network architecture**_

Taking into account that the query for resources to the backend server must be done through a firewall server, it is required that the backend is in a private network and the firewall has a public interface where the query must be resolved and a private one. within the network of the backend server accessing the resources.

## _**Configure the streaming server**_

For this, the server was initially updated, then the latest version of Oracle Java was downloaded using wget as follows:

>wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11 /d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

Afterwards, the downloaded rpm package is installed on the server. Now, the Streama jar package must be downloaded from [Streama](https://github.com/streamaserver/streama/releases), for this wget is used with the link corresponding to the latest available version:

>wget https://github.com/streamaserver/streama/releases/download/v1.10.3/streama-1.10.3.jar

A new directory _/opt/streama_ is created, the jar _streama.war_ is renamed and moved to the created directory, a subdirectory _media_ is also created there and _chmod 644_ permissions are granted to it to store the streaming resources. The streama description file _streama.service_ should now be added to _/etc/systemd/system/_. Finally, the service is activated and enabled:

>systemctl start streama

> systemctl enable streama
