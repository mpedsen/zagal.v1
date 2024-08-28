# Activación y Desactivación IPV6
### Cuando algunos programas nos dan problema con IPV6 está será la forma más fácil de activarlo o desactivarlo
Se trata del mismo código con la diferencia que si ponemos:

### 0 - lo activamos

### 1 - lo desactivamos

# Activación IPV6
Primero debemos cambiar valor en "all" a 0

    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0

Y hacerlo despues en "default"

    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0




# Desactivación IPV6
Primero debemos cambiar valor en "all" a 1

    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

Y hacerlo despues en "default"

    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1


## Para comprobar desde consola si está activo IPV6 o no
Con el código

    ip -6 addr
Cuando lanzamos el comando sólo nos mostrará en pantalla algo cuando esté activado el IPV6, como se muestra en la imagen


![image](https://github.com/user-attachments/assets/02695bfb-aa08-4af7-af23-49c826fc681a)




    
