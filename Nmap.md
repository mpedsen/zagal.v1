# Nmap
Muestro lo que he utilizado en mi script pero podeis ver muchos más en:

https://nmap.org/man/es/man-briefoptions.html
    

-f  Fragmentar paquetes para evasión y falsificación cortafuegos

-sS Análisis TCP SYN/Connect()/ACK/Window/Maimon 

-sV Sondear puertos abiertos, para obtener información de servicio/versión

-Pn No ping. Omite etapa descubrimiento del host

--script para añadir script elegido para el sondeo


Para ver todas las opciones de scripts existentes  
                
    cd /usr/share/nmap/scripts

Para verlos todos 

    ls


### Para reflejar el resultado de un escaneo en un archivo 

    sudo nmap <opcines que queramos poner> <Ip o url a escanear> > <nombrearchivo con su extensión>


### Tipos de scripts que existen

AUTH. Relacionados con la autenticación de usuarios.

BROADCAST. Descubrimiento de hosts mediante mensajes de broadcast en la red local.

BRUTE. Uso de técnicas de fuerza bruta para descubrir crendenciales sobre diferentes protocolos y aplicaciones.

DEFAULT. Scripts por defecto (pueden ser lanzados mediante la opción -sC de Nmap) 

DISCOVERY. Trata de hacer descubrimiento de hosts e información mediante consultas a servicios SMB, SNMP, directorios LDAP, etc.

DOS. Relacionados con ataques tipo DOS (denegación de servicio).

EXPLOIT. Para explotar alguna vulnerabilidad.

EXTERNAL. Scripts que realizan conexiones con servicios externos(ej whois).

FUZZER. Utilizan técnicas de fuzzing (conjunto de pruebas de caja negra que permiten descubrir errores en los programas o protocolos mediante la introducción de datos al azar, inválidos y malformados)

INTRUSIVE. Son extremadamente intrusivos, que podrían incluso bloquear el host objetivo.

MALWARE. Tratan de identificar si el host ha sido comprometido por algún tipo de malware o tiene alguna puerta trasera.

SAFE. Poco intrusivos.

VERSION. Invocados cuando se usa la opción -sV. No se pueden invocar explícitamente el uso de esta categoría.

VULN. Busca vulnerabilidades en el host.
### Para ver todas las categorías de scripts visita:

   https://nmap.org/book/nse.html 




