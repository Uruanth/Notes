# Ubuntu

## Personalizar

1. Instalar retoques (tweaks)

   ~~~bash
   sudo apt install gnome-tweaks
   ~~~

2. Abrir la app, dentro de ella esta todo para configurar

3. Pagina para descargar mas temas, verificar la categoria, en ubuntu 22.04 es GTK3/4

   https://www.gnome-look.org/browse?cat=135&ord=latest

4. Con el comando cp copiar a la carpetas de temas o iconos dependiendo de lo que se quiera

   ~~~bash
   cp -r <temaNuevo> /usr/share/themes #Para temas
   cp -r <temaNuevo> /usr/share/icons #Para iconos
   ~~~

   ## Export variable
   
   ```bash
   export PATH=/<ruta>:$PATH
   ```
   
   

## TMUX

### Comando

~~~bash
tmux new #Crear una nueva sesion de tmux o iniciarlo
# CTRL + B se debe oprimir antes de cualquiera de las siguientes opciones
## Dividir el panel de manera vertical
% 
## Dividir el panel de manera horizontal
" 
## Enfocar o des enfocar el panel actual
z
# Ver el id del panel, si luego ingresas el id de un panel quedas en el
q


## Mantener pulsado ctrl+b y las flechas para re dimensionar los paneles


~~~

## .rar

Primero instalar rar y unrar.

~~~bash
sudo apt-get install rar
sudo apt-get install unrar
~~~

### Comprimir archivo

Tener la cosola en la carpeta donde esta el archivo

~~~ bash
rar a nombre_a_dar.rar archivo1 archivo2 carpeta1 
~~~

### Descomprimir archivos

Tener la cosola en la carpeta donde esta el archivo, luego de la x el nombre del archivo, luego la ruta donde se descomprime.

~~~ bash
unrar x mk.rar /home/dairon/Videos
~~~
