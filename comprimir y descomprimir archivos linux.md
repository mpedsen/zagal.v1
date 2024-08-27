
# COMPRIMIR A ARCHIVO ZIP 
ruta donde queramos coger archivo para zip

nombrearchivo será el nombre que le ponemos al archivo nuevo terminado en .zip

  	zip <rutaarchivo>/<nombrearchivo.zip> 
# DESCOMPRIMIR ARCHIVO ZIP 	
ponemos la ruta donde se encuentre el archivo
-d que significa descompresión

    unzip <ruta> -d zip 

# COMPRIMIR A ARCHIVO TAR.gz 
c indica la creación de un archivo.
z habilita la compresión gzip.
v produce una salida detallada (verbose), mostrando los archivos a medida que se comprimen.
f especifica el nombre del archivo de salida.

     tar -zcvf <nombrearchivonuevo.tar.gz> <rutadirectorio para agrupar> 

# DESCOMPRIMIR  ARCHIVO TAR.gz
x indica la extracción de archivos.
z habilita la descompresión gzip.
v muestra una lista de los archivos a medida que se extraen.
f especifica el nombre del archivo a descomprimir.


      tar -xvzf <ruta archivo>
      
# COMPRIMIR A ARCHIVO GZIP

      gzip -q <rutaarchivo>
# DESCOMPRIMIR ARCHIVO GZIP

      gzip -d $rutaarchivo
# COMPRIMIR A ARCHIVO BZ2

      bzip2 <rutaarchivo>
# DESCOMPRIMIR ARCHIVO BZ2  

      bzip2 -d <rutaarchivo>
