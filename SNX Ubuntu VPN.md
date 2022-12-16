# SNX Ubuntu VPN

## Instalar

1. descargar el archivo .sh (Se deja uno en el repo de respaldo)

https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails&fileid=22824

2. Usar el comando 

   ~~~sh
   apt-get install libc6:i386 libx11-6:i386 libpam0g:i386 libstdc++5:i386
   ~~~

3. Dar permisos al archivo y correrlo con 

   ~~~sh
   chmod +x <file>
   sudo ./<file>
   ~~~

## Como usar

1. Usar el comando con la ruta ip y el usario correspondiente

   ~~~bash
   snx -s <ip> -u <user>
   ~~~

2. Luego solicita la contraseña, la ingresamos y listo 

