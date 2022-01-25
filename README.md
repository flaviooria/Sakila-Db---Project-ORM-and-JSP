# SAKILA DB WEB WITH HIBERNATE AND JSP

---
* ## Descripción
    * Está página web esta basada la base de datos sakila, donde se tratan datos sobre películas,actores,audiencia etc. Además utilizamos tecnologías como Hibernate que lo usamos como [ORM](https://www2.deloitte.com/es/es/pages/technology/articles/que-es-orm.html) (Object Maping Relational) o en español Mapeador Objeto Relacional que nos ayudara con la persistencia de datos y modelado de datos tales como los POJOS en nuestro proyecto.

* ## Tecnologías 
    * Hibernate
    * Java
    * Docker 
    * Mysql 
    * Java Servle Page (JSP)
    * Html,Css and JS


### ***Requisitos previos antes de ejecutar el programa en sistemas operativos Windows y MacOs.***

**Windows**

- Tener un sistema operativo superior a Windows 7. Necesitas un espacio en RAM como mínimo de 128MB. Además espacio en el disco duro mínimo 124MB para arrancar JRE (Java Runtime Environment). Contar con un explorador (Microsoft Edge, Firefox, Google Chrome, etc.) nos servirá para descargar el JRE en nuestro ordenador.

**MacOs**

- Tener un sistema operativo superior a Mac Os X 10.8.3 de 64bits.Necesitas un espacio en RAM como mínimo de 128MB. Además espacio en el disco duro mínimo 124MB para arrancar JRE (Java Runtime Environment). Contar con un explorador (Safari, Firefox, Google Chrome, etc.) nos servirá para descargar el JRE en nuestro ordenador.

### **Instalación de JRE (Java Runtime Environment).**

- El **JRE** es el **J**ava **R**untime **E**nvironment, en español es el Entorno de Ejecución de Java, en palabras del propio portal de Java es la implementación de la Máquina virtual de Java que realmente ejecuta los programas de Java, esto quiere decir que aquí encontraremos todo lo necesario para ejecutar nuestras aplicaciones escritas en Java.

- [link de descarga](https://www.oracle.com/java/technologies/javase-jre8-downloads.html)

  * Instalación en Windows escoger el fichero de descarga si es de 32 bits(x86) o 64 bits(x64).

    ![img](https://lh3.googleusercontent.com/zS1y70n8KDCeW47Wq9lf5Y8KzXWFvuh08ZZmg-u2x3kNqboLRZvygWN1FBM_W3RVGc9Efr_z3XIxtElMdyT8u-ZeN4-VhnmtHvcnVdKlQc1lM95Ps3kbn9jddUdrEAPlwyf0jHQ=s0)



  * Instalación en Mac Os X escoger el fichero de descarga si es de 32 bits(x86) o 64 bits(x64)

    ![img](https://lh6.googleusercontent.com/4-0EPGxQfTwkRFN_LjT7p6Zq4wP1TRjQNsREalZ_GCNXvPd_Rw8zJlP8eC7sTtzdRM-4So9_8caPelxUX8Xh7IpJOUAA1XbwNvLU_bMt0g09ckQMJwYZ3awjBr48tSO-jkXVomw=s0)


#### Obteniendo Servidor Apache Tomcat version 8

------

Apache Tomcat es un contenedor Java Servlet, o contenedor web, que proporciona la funcionalidad extendida para interactuar con Java Servlets, al tiempo que implementa varias especificaciones técnicas de la plataforma Java: JavaServer Pages (JSP), Java Expression Language (Java EL) y WebSocket. Esto nos permitirá poder ejecutar nuestra aplicación web.

A continuación les sugerimos ingresar al link o enlace de descarga del servido apache tomcat.

- [Enlace de descarga de servidor.](https://tomcat.apache.org/download-80.cgi "Página para descargar apache tomcat")

##### ¿Cuál descargar?

-  Tanto en usuarios de sistemas operativos Windows o Mac pueden optar por la versión de Source Code y descargando en formato zip, la cual luego tendrían que descomprimir. 

![tomcat-file-download](https://firebasestorage.googleapis.com/v0/b/fernanpopapp.appspot.com/o/Web-Images%2Ftomcat.png?alt=media&token=0e4b5a4e-4cca-44da-8b22-facd1080706a)

------

## Notas para el desarrollador

- Antes de que arranques la página quisiera ayudarte con librerías que puedas necesitar o ficheros que necesites editar para poder ejecutar y compilar el programa correctamente.

  - Tienes dentro del repositorio un directorio llamado Database, ahí encontraras los ficheros sakila.sql y sakila_schema.sql el cual puedes utilizar para poder manejar la base de datos del programa.

- Utilizo [Docker](https://hub.docker.com/)  para alojar la base de datos, y también para administrar nuestra base de datos utilizaremos phpmyadmin.  A continuación te mostrare los pasos que debes de tomar.

  1. Instalar [Docker](https://www.docker.com/products/docker-desktop "Enlace para descargar docker" ).

  2. Descargar los contenedores de [mysql](https://hub.docker.com/_/mysql) y [phpmyadmin](https://hub.docker.com/_/phpmyadmin). 

     ### ¿Cómo se hace?
     - Descargaremos el contenedor y arrancaremos la imagen de mysql. Para mas información ir al enlace siguiente de  [mysql](https://hub.docker.com/_/mysql) . Copia y pega los siguientes lineas en tu cli.

     ```bash
     $ docker run --name mysql -e MYSQL_ROOT_PASSWORD=your_password -d -p 3306:3306 --character-set-server=utf8mb4 mysql 
     ```

     -  Descargaremos phpmyadmin, y lo enlazaremos a nuestra base de datos de esta forma podremos administrarla. Copia y pega los siguientes lineas en tu cli.

       ```bash
       $ docker run --name phpmyadmin -d --link mysql:db -p 8081:80 phpmyadmin
       ```

       3. Añadir nuestra base de datos fernapop.sql al contenedor de mysql y para poder administrarla con phpmyadmin solo bastaría con ingresar a [web - phpmyadmin](http://localhost:8081/).

     ```bash
     $ docker exec -it mysql mysql -u root -p
     $ password: your_password
     ```

     ***copia el contenido del fichero fernanpop.sql y pegalo.***