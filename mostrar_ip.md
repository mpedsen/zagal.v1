En la primera parte comprobamos si está instalado el programa net-tools ( aunque parezca evidente, no todas las distribuciones lo tienen)

echo " Vamos a averiguar los datos relacionados con tu IP..."
# vamos a hacer una busqueda si está instalado tools
**if [ $find '/usr/sbin/ifconfig' ]; then**
	#en el caso que lo tengamos instalado pasaría a la función ver_ip
	**ver_ip 
else 
echo " No tiene el programa net-tools instalado, procedemos instalación..."**
	#instala programa net-tools 
	**sudo apt install net-tools**
	#una vez instalado pasaría al a función ver_ip
	**ver_ip**


#función ver_ip
ver_ip()  {
#ejecutamos conmando ifconfig y lo pasamos a un archivo llamado ip_propia.raw
ifconfig > ip_propia.raw
	#con csplit dividiremos el archivo ip_propia.raw cada vez que encuentre un salto
	de línea y creará tantos archivos dividos como necesite y lo sobranre a /dev/null ( que es a donde se manda la basurilla)
	csplit ip_propia.raw '/^$/' {*} > /dev/null
#creamos la variable ip para que nos resulte más fácil todo y ahora le diremos que nos muestre la línea donde aparece 
un números del 1 al 9 en grupo de dígitos de 1 a 3 y escribrimos 4 veces que es el tamaño de una ip
y lo coge del archivo xx00 ya que es el primero y único que necesito
ip=$(grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' xx00)
	#nos muestra la ip
	echo "$ip"
	#borra el archivo ip_propia.raw y todos los que se hayan generado con xx
	rm ip_propia.raw
	rm xx*
}
