# _**servidor firewall**_ y _**servidor de Streaming**_ usando _Streama_**

Los pasos desarrollados durante esta sección se muestran a continuación:

- Diseñar la arquitectura de red.
- Configurar el servidor de backend con los recursos de media para el servicio de streaming.
- Configurar las interfaces del firewall para proteger los datos y que unicamente se pueda acceder a los recursos en el backend a través de este servidor.
- Realizar pruebas de funcionamiento.
- Diseñar los archivos de aprovisionamiento basados en las configuraciones que fueron necesarias para el correcto funcionamiento de los pasos anteriores.
- Comprobar el funcionamiento de los archivos de aprovisionamiento.

Ahora bien, los 3 primeros ítems se desarrollan más a fondo:

## _**Diseñar la arquitectura de la red**_

Teniendo en cuenta que la consulta de recursos al servidor de backend se debe realizar a través de un servidor de firewall, se requiere que el backend se encuentre en una red privada y el firewall tenga una interfaz pública donde se debe resolver la consulta y una privada dentro de la red del servidor de backend que acceda a los recursos.

## _**Configurar el servidor de Streaming**_

Para esto inicialmente se actualiza el servidor, después se descarga la última versión de Oracle Java usando wget de la siguiente manera:

>wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

Posteriormente, se instala en el servidor el paquete rpm descargado. Ahora, se debe descargar el paquete jar de Streama desde [Streama](https://github.com/streamaserver/streama/releases), para esto se usa wget con el link correspondiente a la última versión disponible:

>wget https://github.com/streamaserver/streama/releases/download/v1.10.3/streama-1.10.3.jar

Se crea un nuevo directorio _/opt/streama_, se renombre el jar _streama.war_ y se mueve a al directorio creado, ahí se crea también un subdirectorio _media_ y se le otorgan permisos _chmod 644_ para almanecar los recursos del streaming. Ahora se debe agregar el archivo de descripción de streama _streama.service_ en _/etc/systemd/system/_. Finalmente, se activa y habilita el servicio:

>systemctl start streama
>systemctl enable streama
