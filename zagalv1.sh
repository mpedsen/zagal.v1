#!/bin/bash

menu_principal() {
clear
cat<<EOF
Menú principal de zagalv1:
Por favor seleccione una opción:
1. Averigua cual es tu ip , máscara de red..
2. Comprimir y descomprimir archivos
3. Comprueba si tienes un programa instalado
4. Gestión Usuarios (alta, baja, modificación)
5. Gestión Grupos (alta, baja, modificación)
6. Activa/ Desactiva IPV6  
7. SSH y Port Forwading (Tunel Local con SSH)
8. Escaneos con Nmap
9.Salir
EOF
}

menu_comprimir(){
	clear
	echo -e "\e[1;32m Elija una de las opciones: "
	echo -e "1. Comprime con zip"
	echo -e "2. Descomprime con zip"
	echo -e "3. Comprime  con Tar"
	echo -e "4. DesComprime con Tar"
	echo -e "5. Comprime  con gzip"
	echo -e "6. DesComprime con gzip"
	echo -e "7. Comprime con bz2"
	echo -e "8. DesComprime  con bz2"
	echo -e "9. Volver menu principal"
	echo -e "10. Salir\e[0m"
	read -p " Seleccione una opcion opción:" 

	case $REPLY in 
	    1)
		echo -e "\e[1;35m [INFO] COMPRIMIR A ARCHIVO ZIP \e[0m" 
		var=1
		comprimir 1
		;;

	    2) 
		echo -e "\e[1;35m [INFO] DESCOMPRIMIR ARCHIVO ZIP \e[0m"	
		var=2
		comprimir 2 
		;;
	    3)
		echo -e "\e[1;35m [INFO] COMPRIMIR A ARCHIVO TAR \e[0m"
		var=3
		comprimir 3
		;;
	    4)
		echo -e "\e[1;35m [INFO] DESCOMPRIMIR  ARCHIVO TAR \e[0m"
		var=4
		comprimir 4
		;;
	    5)
		echo -e "\e[1;35m [INFO] COMPRIMIR A ARCHIVO GZIP \e[0m"
		var=5
		comprimir 5
		;;
	    6)
		echo -e "\e[1;35m [INFO] DESCOMPRIMIR ARCHIVO GZIP \e[0m"
		var=6
		comprimir 6
		;;
	    7)
		echo -e "\e[1;35m [INFO] COMPRIMIR A ARCHIVO BZ2 \e[0m"
		var=7
		comprimir 7
		;;
	    8)
		echo -e "\e[1;35m [INFO] DESCOMPRIMIR ARCHIVO BZ2  \e[0m"
		var=8
		comprimir 8
		;;
	    9)
		./zagalv1.sh
		;;
	    10)
		exit
		;;
	esac
}
menu_Nmap() {
clear
echo -e "\e[1;32mQue escaneo desea hacer:"
echo -e "1.Escaneo con scripts predeterminados"
echo -e "2.Escanea los scripts disponibles para autenticación."
echo -e "3.Escanea pra recuperar información de la víctima."
echo -e "4.Escaneo con script vulners"
echo -e "5.Escanea de forma no intrusiva una ip."
echo -e "6.Escanea y descubre las vulnerabilidades más conocidas."
echo -e "7.Escanea con todos los scripts disponibles con extensión NSE."
echo -e "8.Volver menú principal."
echo -e "9.Salir\e[0m"
read -p "Elija una opción: "
echo -e "\e[6;31m[INFO] Paciencia el escaneo puede tardar unos minutos....\e[0m"
  
	case $REPLY in
	"1")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
 		read IP
		sudo nmap -f -sS -sV -Pn $IP
		;;
	"2")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
		read IP
		sudo nmap -f -sS -sV -Pn --script auth $IP
		;;
	"3")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
		read IP
		sudo nmap -f -sS -sV -Pn --script discovery $IP
		;;
	"4")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
        	read IP
		sudo nmap -sV --script vulners --script-args mincvss=5.0 $IP
		;;
	"5")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
                read IP
		sudo nmap -f --script safe $IP
		;;
	"6")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
        	read IP
		sudo nmap -f --script vuln $IP
		;;
	"7")
		echo -e "\e[32m Introduzca Ip a escanear\e[0m"
        	read IP
		sudo nmap -f --script all $IP
		;;
	"8") 
		./zagalv1.sh
		;;
	"9")
		exit
		;; 
	esac
}
ver_ip()  {
ifconfig > ip_propia.raw
	csplit ip_propia.raw '/^$/' {*} > /dev/null
ip=$(grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' xx00)
	echo "$ip"
	rm ip_propia.raw
	rm xx*
}

comprimir() {
	if [ $var == "1" ] || [ $var == "3" ]; then
 	echo -e "\e[1;34m Indica tipo archivo .txt, .raw... * para todo tipo\e[0m"
	read tipo
 	tipo2=*$tipo
 	echo -e "\e[1;34mEscribe la ruta del directorio\e[0m"
 	read rutaarchivo
	echo -e "\e[1;34mPon un nombre al nuevo archivo\e[0m"
 	read nombrearchivo
	for file in $tipo2
 		do
 			if [ $var == "1" ] ;then
 			 	zip $rutaarchivo/$nombrearchivo.zip "$file"
 			fi
 			if [ $var == "3" ]; then
 				tar -zcvf $rutaarchivo/$nombrearchivo.tar.gz "$file"
 			fi
 		done
		echo -e "\e[6;31m[INFO] Archivo comprimido con exito\e[0m"
 	fi
	if [ $var == "2" ] || [ $var == "4" ]; then
	echo " Introduce la ruta del archivo para descomprimir"
        read ruta
        if [ -f $ruta ]; then
        	if [ $var == "2" ]; then
 			unzip $ruta -d zip
		fi
		if [ $var == "4" ]; then
		#-x extrae contenido archivo -v muestra proceso -f nombrearchivo		
			tar -xvzf $ruta  
		fi
		echo -e "\e[6;31m[INFO] Archivo descomprimido con exito\e[0m"
	else
                echo -e "\e[6;31m[INFO] No se encuentra archivo que indicas\e[0m"
        fi 
	fi

	#comprimir archivos
    	if [ $var == "5" ] || [ $var == "7" ]; then
		echo -e "\e[3;31m [INFO] SOLO COMPRIME UN ARCHIVO NO UN DIRECTORIO \e[0m"
		echo " Escribe la ruta completa donde está alojado el archivo"
        	read rutaarchivo
		if [ -f $rutaarchivo ]; then
			if [ $var == "5" ]; then
				gzip -q $rutaarchivo 
			fi
			if [ $var == "7" ]; then
				bzip2 $rutaarchivo 
			fi
			echo -e "\e[6;31m[INFO] Archivo comprimido con éxito\e[0m"
		else
			 echo -e "\e[6;31m[INFO] No se encuentra archivo que indicas\e[0m"
		fi

	fi
	#descomprimir archivos
	if [ $var == "6" ] || [ $var == "8" ]; then
     	echo -e "\e[1;34m Indica la ruta completa donde esté alojado el archivo a descomprimir\e[0m"
	read rutaarchivo 
	if [ -f $rutaarchivo ]; then
		if [ $var == "6" ]; then
			gzip -d $rutaarchivo
		fi
		if [ $var == "8" ]; then
			bzip2 -d $rutaarchivo
		fi
		echo -e "\e[6;31m[INFO] Archivo descomprimido con éxito\e[0m"
	else
		echo -e "\e[6;31m[INFO] No se encuentra archivo que indicas\e[0m"
	fi
	fi
}

ipv6() {
clear
		echo -e "\e[1;32mElija una de las opciones:"
	        echo -e "1. Habilita IPV6 en Linux"
	        echo -e "2. Deshabilita IPV6 en Linux"
		echo -e "3. Volver menú principal"
	        echo -e "4. Salir\e[0m"
	        read -p "Selecciona una opción:"

	        case $REPLY in
	                "1")
	                        sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
	                        sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
	       			echo -e "\e[6;31m[INFO] IPV6 Habilitada\e[0m"
		                ;;
	               "2")
	                        sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
	                        sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
	                        echo -e "\e[6;31m[INFO] IPV6 DesHabilitada\e[0m"
				;;
	               "3")
			    ./zagalv1.sh
				;;
		       "4")
	                        exit
	        		;;
	        esac
		 

}
menu_tunel() {
clear	
	echo -e "\e[1;35mSSH Elige una opción (comprueba antes que los puertos están abiertos):\e[0m"
	echo -e "\e[1;35m1. SSH a una máquina sólo.\e[0m"
	echo -e "\e[1;35m2. Port Forwarding con 3 máquinas:\e[0m"
	echo -e "\e[1;35m3. Volver Menú Principal\e[0m"
	echo -e "\e[1;35m4. Salir.\e[0m"
	read -p "Selecciona una opción:"

		case $REPLY in 
		"1")
			echo -e "\e[1;35mIntroduce la ip de la máquina que vas a atacar\e[0m"
                        read ip3
                        echo -e "\e[1;35mUsuario de la maquina que vas a atacar\e[0m"
                        read usr
                        echo "$usr $ip3 $puerto3"
                        sudo ssh -o HostKeyAlgorithms=+ssh-rsa  "$usr"@"$ip3"
			;;
		"2")
			echo -e "\e[1;35mIntroduce el puerto de máquina que con la que vas a atacar\e[0m"
        		read puerto1
        		echo -e "\e[1;35mIntroduce la ip de la máquina que estará en medio\e[0m"
        		read ip2
        		echo -e "\e[1;35mIntroduce el puerto de la máquina que estará en medio\e[0m"
        		read puerto2
        		#echo -e "\e[1;35mIntroduce el puerto de la máquina que vas a atacar\e[0m"
        		#read puerto3 
        		echo -e "\e[1;35mIntroduce la ip de la máquina que vas a atacar\e[0m"
        		read ip3
        		echo -e "\e[1;35mUsuario de la maquina que vas a atacar\e[0m"
        		read usr
			echo " $puerto1:$ip2:$puerto2 $usr@$ip3 -p $puerto3"
		       	ssh -L $puerto1:$ip2:$puerto2 $usr@$ip3 -o HostkeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa
			;;
		"3") 
			./zagalv1.sh
			;;
		"4")
			exit
			;;
		esac
}

menu_grupo() {
clear
echo -e "\e[1;32mGestión de grupo:"
echo -e "1. Crear un grupo (alta)."
echo -e "2. Modificar un grupo"
echo -e "3. Eliminar un grupo (baja)."
echo -e "4. Gestión usuarios con grupos" 
echo -e "5. Volver menú principal"
echo -e "6. Salir\e[0m"
read -p "Introduce una opción: "
case $REPLY in 
	"1")
		alta_grupo
		;;
	"2")
 		clear
		echo -e "\e[1;32m¿Que desea modificar....?:"
                echo -e "1. El GID de un grupo"
                echo -e "2. El nombre de un grupo."
		echo -e "3. La contraseña de un grupo"
		echo -e "4. Eliminar la contraseña de un grupo"
                echo -e "5. Volver menú principal"
                echo -e "6. Salir\e[0m"
                read -p "Elija una opción:"
 		case $REPLY in
		    "1") 
			echo -e "\e[1;32mDime el nombre del grupo a modificar\e[0m"
			read nombre
			echo -e "\e[1;32mIntroduce el número de GID, recuerda que del 0 al 999 está reservado al sistema\e[0m"
			read gid
			sudo groupmod -g $gid $nombre
			sudo cat /etc/group | grep $nombre
			;;
		    "2")
			echo -e "\e[1;32mDime como se llama el grupo que quieres modificar:\e[0m"
			read nomOld
			echo -e "\e[1;32mDime como quieres llamar ahora al grupo\e[0m"
			read newNom
			sudo groupmod -n $newNom $nomOld
			sudo cat /etc/group | grep $nerNom
			;;
		    "3")
			echo -e "\e[1;32mDime nombre de el grupo que quieres cambiar contraseña:\e[0m"
                        read nom
                        echo -e "\e[1;32mDime la nueva contraseña para el grupo\e[0m"
                        read pass
			sudo groupmod -p $pass $nom
			sudo cat /etc/group | grep $nom
			;;
		    "4")
			echo -e "\e[1;32mDime el nombre del grupo que quieres eliminar la  contraseña:\e[0m"
                        read nom
			sudo gpasswd -r $nom
			;;
		    "5")
			./zagalv1.sh
			;;
		    "6")
			exit
			;;
		esac  	
	;;
	"3")
		echo -e "\e[1;12mDime nombre de el grupo que quieres eliminar:\e[0m"
		read nom
		sudo groupdel $nom
		;;
	"4") 
		gest_Users
		;;
	"5")
		./zagalv1.sh
		;;
	"6")
		exit
		;;
esac
}
gest_Users() {
clear
echo -e "\e[1;36m1. Mostrar grupos a los que pertenece un usuario.\e[0m"
echo -e "\e[1;36m2. Agregar un usuario a un grupo existente.\e[0m"
echo -e "\e[1;36m3. Agregar usuario admin a un grupo.\e[0m"
echo -e "\e[1;36m4. Agregar usuarios miembros de un grupo.\e[0m"
echo -e "\e[1;36m5. Cambiar usuario a grupo primario.\e[0m"
echo -e "\e[1;36m6. Eliminar un usuario de un grupo al que pertenece. \e[0m"
echo -e "\e[1;36m7. Volver Menú Principal\e[0m"
echo -e "\e[1;36m8. Salir\e[0m"
read -p "Elija una opción: "

case $REPLY in
	1) 
	echo -e "\e[1;36m Dime el nombre de usuario para ver a que grupos pertenece:\e[0m"
	read nombre
	groups $nombre
	;;
	2)
	echo -e "\e[1;36mDime el nombre de usuario que quieres agregar al grupo: \e[0m"
	read nombre
	echo -e "\e[1;36mDime el nombre de grupo al que quieres agregar el $nombre \e[0m"
	read grupo
	sudo usermod -a -G $grupo $nombre
	;;
	3)
	echo -e "\e[1;36mDime el nombre de usuario administrador que quieres agregar al grupo: \e[0m"
        read nombre
        echo -e "\e[1;36mDime el nombre de grupo al que lo quieres agregar\e[0m"
        read grupo
	sudo gpasswd -A $nombre $grupo
	;;
	4)
	echo -e "\e[1;36mEscribe los nombres de usuarios que quieres agregar al grupo separados por una coma y sin espacios: \e[0m"
        read nombres
        echo -e "\e[1;36mDime el nombre de grupo al que quieres agregar el $nombre \e[0m"
        read grupo
	sudo gpasswd -M $nombres $grupo
	;;
	5)
	echo -e "\e[1;36mDime el nombre de usuario que quieres agregar al grupo primario: \e[0m"
        read nombre
        echo -e "\e[1;36mDime el nombre de grupo al que quieres agregar el $nombre \e[0m"
        read grupo
	sudo usermod -g $grupo $nombre
	;;
	6)
	echo -e "\e[1;36mDime el nombre de usuario que quieres eliminar: \e[0m"
        read nombre
        echo -e "\e[1;36mDime el nombre de grupo del que quieres eliminar el usuario \e[0m"
        read grupo
	sudo deluser $nombre $grupo
	;;
	7)
	./zagalv1.sh
	;;
	8)
	exit
	;;
esac
}
alta_grupo()  {
		echo -e "\e[0;42m¿Que desea crear?:"
		echo -e "1. Crear un nuevo grupo usuarios"
		echo -e "2. Crear un nuevo grupo de sistema."
		echo -e "3. Asignar una contraseña a un grupo"
		echo -e "4. Volver menú principal"
		echo -e "5. Salir\e[0m"
		read -p "Elija una opción:"

		case $REPLY in 
			"1") 
				echo -e "\e[0;42mIndica el nombre del grupo que quieres crear:\e[0m"
				read nombre	
				sudo groupadd $nombre
				sudo cat /etc/group | grep $nombre
			;;
			"2") 
				echo -e "\e[0;42mIndica el nombre del grupo del sistema que quieres crear\e[0m "
				read nombre
				sudo -r addgroup $nombre
				sudo cat /etc/group | grep $nombre
			;;
			"3") 
			    echo -e "\e[0;42mPor favor escriba la contraseña\e[0m:"
			    read password
			    sudo groupadd -p $password $nombre
			;;
			"4")
		 		./zagalv1.sh
			;;
                        "5") 
				exit
			;;
			esac
}     
menu_user() {
clear
echo -e "\e[1;32mMenú de las opciones de usuario en Linux: \e[0m"
echo -e "\e[1;32m1. Crea un usuario por defecto (más rápido) \e[0m"
echo -e "\e[1;32m2. Crea un usuario guiado, insertando dato por dato\e[0m"
echo -e "\e[1;32m3. Crea un usuario con directorio home diferente al predeterminado. \e[0m"
echo -e "\e[1;32m4. Crea un usuario sin directorio home \e[0m"
echo -e "\e[1;32m5. Ponle una password a un usuario(/bin/sh)\e[0m"
echo -e "\e[1;32m6. Crea un usuario con fecha de caducidad\e[0m"
echo -e "\e[1;32m7. Crea un usuario con aviso caducidad contraseña, vencimiento contraseña y número de intentos de inicio de sesión. \e[0m"
echo -e "\e[1;32m8. Cambiar la password de un usuario\e[0m"
echo -e "\e[1;32m9. Modificar fecha que expira cuenta usuario\e[0m"
echo -e "\e[1;32m10. Bloquear contraseña usuario\e[0m"
echo -e "\e[1;32m11. Desbloquear contraseña usuario\e[0m"
echo -e "\e[1;32m12. Bloquear cuenta usuario\e[0m"
echo -e "\e[1;32m13. Desbloquear cuenta usuario\e[0m"
echo -e "\e[1;32m14. Agregar Información a una cuenta de usuario\e[0m"
echo -e "\e[1;32m15. Cambiar ID usuario (UID)\e[0m"
echo -e "\e[1;32m16. Ver la información de un usuario\e[0m"
echo -e "\e[1;32m17. Elimina a un usuario\e[0m"
echo -e "\e[1;32m18. Elimina a un usuario y todos sus datos\e[0m"
echo -e "\e[1;32m19. Volver Menú Principal\e[0m"
echo -e "\e[1;32m20. Salir\e[0m"
read -p "Por favor elija una opción:"
case $REPLY in
	1) 
		clear
		echo -e "\e[1;35mEscribe el nombre de usuario que quieres crear\e[0m"
		read user
		sudo adduser $user
		id $user 
	;;
	2)
		clear
		echo -e "\e[1;35mEscribe el nombre de usuario que quieres crear\e[0m"
		read user
		sudo useradd -m $user
		echo -e "\e[1;35mVamos a crear una contraseña: \e[0m"
		sudo passwd $user
		echo -e "\e[1;35mAhora ya tienes una carpeta para tu usuario\e[0m"
		ls -lah /home/$user
	;;
	3)
		clear
		echo -e "\e[1;35mEscribe el nombre de usuario que quieres crear\e[0m"
		read user
		echo -e "\e[1;35mEscribe el nombre del directorio fuera de home \e[0m"
		read direct
		sudo useradd -m -d /$direct/$user $user
                echo -e "\e[1;35mEscribe el nombre de usuario que quieres ponerle fecha de caducidad \e[0m"
	;;
	4)
		clear
                echo -e "\e[1;35mEscribe el nombre de usuario que quieres crear, sin directorio home\e[0m"
                read user
		sudo useradd -M $user
	;;
	5)
		clear
                echo -e "\e[1;35mEscribe el nombre de usuario que quieres ponerle password \e[0m"
                read user
		sudo passwd $user
	;;
	6)
		clear
                read user
		echo -e "\e[1;35m Escribe la fecha de caducidad en este formato yyyy/mm/dd"
		read fecha
		sudo useradd -m -e $fecha $user
		echo -e "\e[1;34m Este usuario no tiene password ni grupo asignado\e[0m"
	;;	
	7)
		clear
 		echo -e "\e[1;35m Dime el nombre del nuevo usuario\e[0m"
                read user
		echo -e "\e[1;35m Dime la cantidad de días que puede usarse máximo la contraseña\e[0m"
                read dias
		echo -e "\e[1;35m Dime la cantidad de días que quieres ponerle para que avise que va a caducar la contraseña"
                read diasaviso
		echo -e "\e[1;35m DIme cuantos intentos de inicio de sesion puede hacer el usuario"
                read numlogin
		sudo useradd -m -K PASS_MAX_DAYS=$dias -K PASS_WARN_AGE=$diasaviso -K LOGIN_RETRIES=$numlogin $user 
	;;
	8)
		clear
		echo -e "\e[1;32mDime el usuario para cambiar su password\e[0m"
		read user
		sudo passwd $user		
	;;
	9)
		clear
                echo -e "\e[1;32mDime el usuario para cambiar su fexha expiración\e[0m"
                read user
		echo -e "\e[1;35m Escribe la nueva fecha de caducidad en este formato yyyy/mm/dd"
                read fecha
                sudo usermod -e $fecha $user
	;;
	10)
		clear
		echo -e "\e[1;32mDime el usuario para bloquearle la contraseña\e[0m"
		read user
		sudo usermod -L $user
	;;
	11)
		clear
		echo -e "\e[1;32mDime el usuario para desbloquear su contraseña\e[0m"
		read user
		sudo usermod -U $user
	;;
	12)
		clear
                echo -e "\e[1;32mDime el usuario para bloquearle su cuenta\e[0m"
                read user
                sudo usermod -e 1 $user

	;;
	13)
		clear
                echo -e "\e[1;32mDime el usuario para desbloquearle la cuenta\e[0m"
                read user
		#99999 nunca expira
                sudo usermod -e 99999 $user
	;;
	14)
		clear
                echo -e "\e[1;32mDime el usuario al que quieres agregarle información\e[0m"
                read user
                sudo chfn $user
	;;
	15)
		clear
                echo -e "\e[1;32mDime el usuario para cambiar ID\e[0m"
                read user
		echo -e "\e[1;32m Introduce nuevo número ID ( *recuerda de 0 a 999 reservado sistema)"
                read num
		sudo usermod -u $num $user
	;;
	16)
		clear
                echo -e "\e[1;32mDime el usuario para ver su información\e[0m"
                read user
                sudo cat /etc/passwd | grep $user
	;;
	17)
		clear
		echo -e "\e[1;32mDime el usuario que deseas eliminar\e[0m"
                read user
		sudo userdel $user
	;;
	18)
		clear
		echo -e "\e[1;32mDime el usuario para eliminarlo junto con sus datos\e[0m"
                read user
		sudo userdel -r $user
	;;
	19)
		./zagalv1.sh
	;;
	20)
		exit
	;;
esac

}
menu_principal
read -p "Introduce una opción del 1 al 9: "
case $REPLY in
	"1") echo " Vamos a averiguar los datos relacionados con tu IP..."
	# vamos a hacer una busqueda si está instalado tools
	if [ $find '/usr/sbin/ifconfig' ]; then
	#creamos un fichero raw y extraemos datos del fichero
	ver_ip 
	else 
	echo " No tiene el programa net-tools instalado, procedemos instalación..."
		sudo apt install net-tools
		ver_ip
	fi
	;;
	"2") 
		menu_comprimir
		;;
	"3")
	 clear
	  echo -e "\e[2;34mDime que programa quieres buscar\e[0m"
		read programa
		for buscar in "$programa"; do
		test -f /usr/bin/$programa
			if [ "$(echo $?)" == "0" ]; then
			echo -e "\e[6;31mEl programa existe\e[0m"
			else
			echo -e "\e[6;31mEl programa no existe\e[0m"
			fi
		done 
		;;
	"4") 
		#usuarios
		menu_user
		;;
	"5") 
		#gestión grupos
		menu_grupo
		;;

	"6")
		ipv6
		;;
	"7") 
		menu_tunel
		;;
	"8") 	menu_Nmap
		;;
	"9") 
	   	exit
	   	;;
   esac


