# Usuarios en linux

## Para comprobar los usuarios que tenemos creados 

      cat /ect/passwd
## Comprobar donde se guardan las contraseñas almacenadas (hash) e información sobre caducidad y validez de la cuenta.

      cat /etc/shadow
## Comprobar donde se defubeb las variables que controlan aspectos de la creación de usuarios.

      cat /etc/login.defs 

## hay dos formas de crear usuarios,
la primera con adduser que lo hace de forma automatizada, solicitandote los datos cuando lo ejecutas,

la segunda con useradd en la que creas el usuario pero despues tienes que hacer de forma manual la password y todo lo demás


### Crea un usuario por defecto (más rápido) con adduser

    sudo adduser <nombreusuario>

### Crea un usuario guiado (sólo el usuario con useradd)

    sudo useradd -m <nombreusuario>
### Crea un usuario con directorio home diferente al predeterminado.

    sudo useradd -m -d /<directorio del usuario> <nombreusuario>
### Crea un usuario sin directorio home

    sudo useradd -M <nombreusuario>
### Ponle una password a un usuario(/bin/sh)

    sudo passwd <nombreusuario>
### Crea un usuario con fecha de caducidad
fecha en formato yyyy/mm/dd

    sudo useradd -m -e <fecha> <nombreusuario>
### Crea un usuario con aviso caducidad contraseña, vencimiento contraseña y número de intentos de inicio de sesión. 
PASS_MAX_DAYS 99999 : el máximo de días que una contraseña puede ser usada.

PASS_MIN_DAYS 0 :  el mínimo de días permitido para cambiar la contraseña.

PASS_WARN_AGE 7 : número de días antes de la caducidad para advertir de que va a caducar la contraseña.

LOGIN_RETRIES 5 : cantidad de intentos de inicio de sesión si la contraseña no es la correcta.

LOGIN_TIMEOUT 60 : tiempo que pasa antes de que el inicio de sesión agote el tiempo de espera.

DEFAULT_HOME yes : si un usuario puede iniciar sesión si no existe una carpeta de inicio.

      sudo useradd -m -K PASS_MAX_DAYS= -K PASS_WARN_AGE= -K LOGIN_RETRIES=
### Cambiar la password de un usuario

    sudo passwd <nombreusuario>
### Modificar fecha que expira cuenta usuario
fecha en formato yyyy/mm/dd

    sudo usermod -e <fecha> <nombreusuario>
### Bloquear contraseña usuario

    
### Desbloquear contraseña usuario

    
### Bloquear cuenta usuario

    
### Desbloquear cuenta usuario

    
### Agregar Información a una cuenta de usuario

    
### Cambiar ID usuario (UID)
Para comprobar cual tiene simplemente id <nombreusuario> en consola 

    
### Ver la información de un usuario

      
### Elimina a un usuario

      
### Elimina a un usuario y todos sus datos

      
