#  Gestión grupos en Linux
## Para comprobar los grupos que tenemos creados 

      cat /ect/group
## Comprobar filtrando solo el nombre del grupo que queramos los datos.

      cat /etc/group | grep <nombregrupo>
# - __Crear un grupo__

### Crear un grupo

      sudo groupadd <nombre_grupo>

### Crear un grupo del sistema

      sudo -r addgroup <nombre_grupo>
### Asignar una contraseña a un grupo

      sudo groupadd -p <contraseña> <nombre_grupo>

### Comprobar que hemos creado bien el grupo o hacer búsqueda del grupo

      sudo cat /ect/group | grep <nombre_grupo>
      
# - __Modificar un grupo__
### Mostrar grupo al que pertene un usuario

      groups <nombre_usuario>

### Agregar un usuario a un grupo existente

      sudo usermod -a -G <nombre_grupo> <nombre_usuario>

### Agregar usuario administrador a un grupo

      sudo gpasswd -A <nombre_usuario> <nombre_grupo>

### Agregar usuarios miembros de un grupo
Se añaden tantos usuarios como queramos pero separados por una coma ,

      sudo gpasswd -M <nombre_usuario>, <nombre_usuario>, <nombre_usuario> <nombre_grupo>

### Cambiar usuario a grupo primario

      sudo usermod -g <nombre_grupo> <nombre_usuario>

### Eliminar un usuario de un grupo al que pertenece

      sudo deluser <nombre_usuario> <nombre_grupo>

# - __Eliminar un grupo__

      sudo groupdel <nombre_grupo>

