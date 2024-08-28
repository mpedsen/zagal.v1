# Usuarios en linux

## Para comprobar los usuarios que tenemos creados 

      cat /ect/passwd
## Comprobar donde se guardan las contraseñas almacenadas (hash) e información sobre caducidad y validez de la cuenta.

      cat /etc/shadow
## Comprobar donde se definen las variables que controlan aspectos de la creación de usuarios.

      cat /etc/login.defs 

## hay dos formas de crear usuarios,
la primera con adduser que lo hace de forma automatizada, solicitandote los datos cuando lo ejecutas,

la segunda con useradd en la que creas el usuario pero despues tienes que hacer de forma manual la password y todo lo demás


### Crea un usuario por defecto (más rápido) con adduser

    sudo adduser <nombreusuario>

### Crea un usuario guiado (sólo el usuario con useradd)

    sudo useradd -m <nombreusuario>
### Crea un usuario con directorio home diferente al predeterminado.
-m para usuario

-d para directorio

    sudo useradd -m -d /<directorio del usuario> <nombreusuario>
### Crea un usuario sin directorio home

    sudo useradd -M <nombreusuario>
### Ponle una password a un usuario(/bin/sh)

    sudo passwd <nombreusuario>
### Crea un usuario con fecha de caducidad
fecha en formato yyyy/mm/dd

    sudo useradd -m -e <fecha> <nombreusuario>
### Crea un usuario con aviso caducidad contraseña, vencimiento contraseña, número de intentos de inicio de sesión, número de intento de logins y si usuario puede iniciar sesión sin carpeta de inicio. 
PASS_MAX_DAYS 99999 : el máximo de días que una contraseña puede ser usada.

PASS_MIN_DAYS 0 :  el mínimo de días permitido para cambiar la contraseña.

PASS_WARN_AGE 7 : número de días antes de la caducidad para advertir de que va a caducar la contraseña.

LOGIN_RETRIES 5 : cantidad de intentos de inicio de sesión si la contraseña no es la correcta.

LOGIN_TIMEOUT 60 : tiempo que pasa antes de que el inicio de sesión agote el tiempo de espera.

DEFAULT_HOME yes : si un usuario puede iniciar sesión si no existe una carpeta de inicio.

      sudo useradd -m -K PASS_MAX_DAYS= -K PASS_MIN_DAYS= -K PASS_WARN_AGE= -K LOGIN_RETRIES= -K LOGIN_TIMEOUT= -K DEFAULT_HOME=
### Cambiar la password de un usuario

    sudo passwd <nombreusuario>
### Modificar fecha que expira cuenta usuario
fecha en formato yyyy/mm/dd

    sudo usermod -e <fecha> <nombreusuario>
### Bloquear contraseña usuario

      
      sudo usermod -L <nombreusuario>
   
### Desbloquear contraseña usuario

    sudo usermod -U <nombreusuario>
### Bloquear cuenta usuario

    sudo usermod -e 1 <nombreusuario>
### Desbloquear cuenta usuario
yyyy-mm-dd para marcarle una fecha de expiración

99999 para que nunca expire

EXPIRE puedes configurarlo con el valor establecido en la variable Expire en /etc/default/useradd  
                                                
      sudo usermod -e 99999 <nombreusuario>
### Agregar Información a una cuenta de usuario

    sudo chfn <nombreusuario>
### Cambiar ID usuario (UID)
Importante se reservan los números del 0 al 999 para cuentas del sistema

Para comprobar el id actual antes de cambiarlo 
                                                
      id <nombreusuario>
y para cambiarlo

      sudo usermod -u <nridnuevo> <nombreusuario>
      
### Ver la información de un usuario

      sudo cat /etc/passwd | grep <nombreusuario>
### Elimina a un usuario

      sudo userdel <nombreusuario>
### Elimina a un usuario y todos sus datos
-r significa de forma recursiva

      sudo userdel -r <nombreusuario>
