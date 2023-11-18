# Windows

## Oh my posh

Terminal powershell bonita.

instalacion inicial

[pagina instalación](winget install JanDeDobbeleer.OhMyPosh -s winget)

```shell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

```shell
##Update
winget upgrade JanDeDobbeleer.OhMyPosh -s winget
```

### Modificar el tema, en un powerShell ingresar el comando

```shell
nvim $PROFILE
```

Guardar la siguiente linea 

`oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/multiverse-neon.omp.json" | Invoke-Expression`

### Instalar fuentes

En el shell ingresar el comando

```shell
oh-my-posh font install
```

Seleccionar la fuente de preferencia y reiniciar el terminal

### Iconos en el terminal

[Repo]([GitHub - devblackops/Terminal-Icons: A PowerShell module to show file and folder icons in the terminal](https://github.com/devblackops/Terminal-Icons))

En el poweshell ejecutar el comando y aceptar todo

```shell
Install-Module -Name Terminal-Icons -Repository PSGallery
```

Ahora en consola abrimos el archivo

```shell
nvim $PROFILE
```

y agregar la linea  `Import-Module -Name Terminal-Icons`. Reiniciar el terminal y listo.



## Habilitar scripts powerShell

```shell
Set-ExecutionPolicy unrestricted
```


## Docker in WSL without Docker Desktop
https://dev.to/bowmanjd/install-docker-on-windows-wsl-without-docker-desktop-34m9


