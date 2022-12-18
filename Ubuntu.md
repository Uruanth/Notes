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

