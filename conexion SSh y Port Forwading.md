# Conexión SSH y Port Forwarding

## Conexión SSH
La conexión SSH ( Secure Shell)  es un protocolo de red destinado principalmente a la conexión con máquinas a las que accedemos por línea de comandos.
SSH utiliza varias técnicas o formas de cifrado, logrando así la máxima protección en la transferencia de datos:
- Cifrado simétrico ( el más usado) cifrado secreto compartido o también llamado clave compartida.
Mediante este método se utiliza una clave generada mediante un algoritmo y se utiliza tanto para el cifrado como el descifrado de información intercambiada entre cliente y servidor.
- Cifrado asimétrico utiliza dos claves: una para el cifrado de información y otra diferente para el descifrado.
Estas dos claves son conocidas como clave pública (public key) y clave privada (private key).
La pública utilizada en el cifrado de información y la privada para el descifrado.

- Hashing efectivo para autenticar mensajes y garantizar que nadie pueda modificar la información que se transmite.
Realmente lo que hace este sistema es crear un hash o una cadena de longitud fija para cada entrada. Esto es posible gracias a una función hash que no tiene inversa, es decir, una vez que el mensaje es cifrado, no hay marcha atrás, el mensaje no se puede descifrar.
Su funcionamiento es mediante el cifrado de clave compartida, encripta la información que se va a transmitir entre servidor y cliente. Posteriormente, para proteger y evitar que esta información sea interceptada o modificada por nadie, la protege con un hash.

La forma sencilla para una conexión SSH sería poner los datos de la máquina a la que nos queremos conectar

      ssh <usuario>@<ip maquina>:<puerto>
## Para iniciar el servidor SSH en caso de que no esté funcionando


      sudo systemctl start ssh

## Abrir un puerto para SSH en configuración o 

      nano /etc/ssh/sshd_config
![image](https://github.com/user-attachments/assets/13726402-b8a6-4f46-8ee9-51a7a7e676b5)

## Y cambiar algunas partes más de la configuración (ej. PublickeyAuthentication)
![image](https://github.com/user-attachments/assets/7f6846af-b402-41ff-8db2-aca82b7ac706)

## Comandos en SSH
![image](https://github.com/user-attachments/assets/bc4898c3-40c2-4363-8ec7-d1642bed1187)

### En nuestro código hemos usado 

      sudo ssh -o HostKeyAlgorithms=+ssh-rsa  <usuario>@<ip>
  
Donde le decimos que haga conexión ssh "-o" que significa que le vamos a poner opciones
HostKeyAlgorithms que utilice ssh y rsa ( claves rsa)

## Port Forwading ( con SSH)
El Port Forwarding dirige el tráfico de red desde un puerto en un terminal Linux a otro puerto de otra máquina o terminal. 

Yo he usado esto:

      ssh -L <puerto1>:<ipmedio>:<puertomedio> <usuario>@$<ipfinal> -o HostkeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa

 Donde:
  - -L es para marcar la dirección
  - puerto 1 es el puerto de la primera máquina o terminal desde donde realizaremos la conexion SSH
  - ip medio sería si lo hacemos entre 3 máquinas como yo lo he hecho, y sería la ip de la máquina que estaría en el centro y haría de puente
  - puerto medio sería igual que el anterior pero con el puerto por donde sale
  - ipfinal sería la ip de la máquina o terminal con la que hariamos la conexión final de SSH
  - PubkeyAcceptedAgorithms con los mismos comandos que HostKeyALgorithms para que la conexión sea más efectiva


  

