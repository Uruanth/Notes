# NeoVim

1. Instalarlo con chocolaty, en un powershell como administrador ejecutar lo siguiente

```shell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

2. Luego instalar NeoVim con el comando
   
   ```sh
   choco install neovim
   ```

3. Listo

---

## Modos

### Modo insert

Modo en el cual se permite agregar texto en nuestros archivos, para salir con dos veces la tecla `esc`.

### Modo remplazar

Es un modo donde se van remplazando los caracteres que ya existen por los tipeados

### Modo visual

Nos desplazamos de manera normal, pero va a ir seleccionando desde donde empezo el cursor hasta donde lo dejemos

---

## Comando

| Tecla(s)  | Lo que hace                                                                    |
| --------- | ------------------------------------------------------------------------------ |
| H         | mover izquierda                                                                |
| J         | mover abajo                                                                    |
| K         | mover arriba                                                                   |
| L         | mover derecha                                                                  |
| W w       | mover al final de la siguiente palabra                                         |
| B b       | mover al comienzo de la anterior palabra                                       |
| i         | Modo insert desde el caracter antes del cursor                                 |
| a         | Modo insert desde el caracter despues del cursor                               |
| A         | Modo insert desde al final de la linea                                         |
| x         | Eliminar caracter                                                              |
| ctrl + i  | retroceder en el historial de buffer                                           |
| ctrl + o  | avanzar en el historial de buffer                                              |
| dw        | eliminar hasta el fin de la palabra                                            |
| u         | Deshacer                                                                       |
| ctrl + r  | Rehacer                                                                        |
| d\<arg>   | para borrar, el argumento nos dira hasta donde queremos eliminar               |
| d$        | Eliminar todos los caracteres de la linea, pero sin borrar la linea            |
| d6w       | es igual a oprimir dw 6 veces                                                  |
| dd        | Elimina toda la linea                                                          |
| $         | ir al final de la linea                                                        |
| 0         | ir al inicio de la linea, es `cero` no la letra `O`                            |
| p         | pegar luego del cursor                                                         |
| P         | pegar antes del cursor                                                         |
| r\<arg>   | cambia el caracter donde esta el cursor por el caracter de arg                 |
| cw        | borrar la palabra y entrar en modo insert                                      |
| ciw       | lo mismo que `cw`, pero sin importar en que parte de la palabra este el cursor |
| gg        | Inicio del archivo                                                             |
| G         | Final del archiv                                                               |
| \<arg>G   | arg es el numero de linea al que uno quiere ir                                 |
| /\<arg>   | Buscar coincidencias despues del cursor                                        |
| ?\<arg>   | Buscar coincidencias antes del cursor                                          |
| n         | siguiente coincidencia en la busqueda                                          |
| N         | anterior coincidencia en la busqueda                                           |
| %         | cambiar entre parentesis correspondientes                                      |
| o         | Abrir una nueva linea abajo del cursor y deja en modo insertar                 |
| O         | Abrir una nueva linea arriba del cursor y deja en modo insertar                |
| shift + r | Modo remplazar                                                                 |
| y         | copiar lo seleccionado                                                         |
| \<arg>k   | arg es el numero de lineas que quiero devolverme                               |
|           |                                                                                |

### Navegación

| **Tecla(s)** | **Lo que hace**                                                                                        |
| ------------ | ------------------------------------------------------------------------------------------------------ |
| ctrl + e     | Scroll una linea abajo                                                                                 |
| ctrl + y     | Scroll una linea arriba                                                                                |
| ctrl + f     | Scroll una pagina abajo                                                                                |
| ctrl + b     | Scroll una pagina arriba                                                                               |
| ctrl + d     | Scroll una media pagina abajo                                                                          |
| ctrl + u     | Scroll una media pagina arriba                                                                         |
| H            | Mueve el cursor al principio de la pantalla                                                            |
| L            | Mueve el cursor a la mitad                                                                             |
| M            | Mueve el cursor al final de la pantalla                                                                |
| \<arg> k     | arg es el numero de lineas que quiero devolverme                                                       |
| \<arg> k     | arg es el numero de lineas que quiero avanzar                                                          |
| : \<arg>     | arg es el numero de linea que quiero ir                                                                |
| m\<arg>      | arg es un caracter alfabetico, marca la ubicación actual del cursos                                    |
| '\<arg>      | arg es un caracter alfabetico que se uso para marcar un lugar, el comando regresa el cursor a la marca |

```shell
# Para abrir un archivo en consola
nvim <fileName>

# Forzar el cerrado del archivo
:q! 

# Guardar
:w

# Guardar y salir
:wq

# Sustituir la primera existencia
:s/<queCambiar>/<porqueCambiar>

# Sustituir las ocurrencias de la linea
:s/<queCambiar>/<porqueCambiar>/g

# Sustituir las ocurrencias de un archivo
# La c es opcional, si se usa va a preguntar una por una cual remplazar
:%s/<queCambiar>/<porqueCambiar>/gc
```

---

# Atajos personalizados

```shell
nmap <leader>w :w<CR>
nmap <leader>w :w<CR>
```

---

# Plugins

1. Instalar el gestor de plugins [vim-plug](https://github.com/junegunn/vim-plug), se usa este comando en una shell como administrador
   
   ```shell
   iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
       ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
   ```

2. `C:\Users\adivi\AppData\Local\nvim-data\site\autoload `confirmar esta ruta contenga el archivo `plug.vim`

3. `C:\Users\adivi\AppData\Local\` en esta ruta crear una carpeta llamada nvim

4. `C:\Users\adivi\AppData\Local\nvim\` en esta ruta crear una carpeta llamada plugged.

5. `C:\Users\adivi\AppData\Local\nvim\` en este directorio crear un archivo llamado `init.vim`.

6. Abrir el archivo `init.vim` y colocar minimo esta linea
   
   `call plug#begin('~/AppData/Local/nvim/plugged')`
   
   1. Tambien podemos copiar todo esto en el archivo `init.vim`
   
   ```tex
   ":::instalacion de plugins:::
   
   call plug#begin('~/AppData/Local/nvim/plugged')     "directorio donde se van a instalar los plugins
   
   "plugins
   Plug 'joshdick/onedark.vim'         "tema
   Plug 'Yggdroot/indentLine'         "indentacion
   Plug 'mattn/emmet-vim'             "emmet para diseño web
   Plug 'vim-airline/vim-airline'        "diseño de la barra en la cual se muestran los modos, la linea, etc.
   Plug 'vim-airline/vim-airline-themes'    "temas para el vim-airline
   Plug 'preservim/nerdtree'        "gestor de archivos en forma de arbol.
   Plug 'christoomey/vim-tmux-navigator'    "poder navegar entre archivos abiertos
   Plug 'jiangmiao/auto-pairs'        "autocompletado de llaves, corchetes, etc.
   Plug 'neoclide/coc.nvim', {'branch': 'release'}    "autocompletado inteligente
   
   call plug#end()             "cerramos el llamado de los plugins
   
   "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   
   "CONFIGURACIONES BASICAS 
   set number                 "muestra los numeros de cada linea en la parte izquierda 
   set relativenumber             "la distribucion de los numeros en lineas de manera relativa
   set mouse=a                 "permite la interaccion con el mouse
   set noshowmode                "me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
   syntax enable                 "activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
   set encoding=utf-8             "permite setear la codificación de archivos para aceptar caracteres especiales
   set sw=4                 "la indentación genera 4 espacios
   set nowrap                "el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
   "set noswapfile                "para evitar el mensaje que sale al abrir algunos archivos sobre swap.
   set clipboard=unnamed            "para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.    
   ```
   
   "configuracion del tema
    set termguicolors "activa el true color en la terminal
    colorscheme onedark "activar el tema onedark
   
   "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   
   "configuracion de emmet-vim
    let g:user_emmet_leader_key=',' "mapeando la tecla lider por una coma, con esto se completa los tag con doble coma.
   
   "configuracion de vim-airline
    let g:airline#extensions#tabline#enabled = 1 "muestra la linea de pestaña en la que estamos buffer
    let g:airline#extensions#tabline#formatter = 'unique_tail' "muestra solo el nombre del archivo que estamos modificando
    let g:airline_theme='onedark' "el tema de airline
   
   "configuracion de nerdtree
    "mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa el
    "control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
    map <C-n> :NERDTreeToggle<CR>
   
   "configuracion por defecto de coc
    " TextEdit might fail if hidden is not set.
    set hidden
   
   " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup
   
   " Give more space for displaying messages.
    set cmdheight=2
   
   " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300
   
   " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c
   
   " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
    else
    set signcolumn=yes
    endif
   
   " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
   
   function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
    endfunction
   
   " Use <c-space> to trigger completion.
    if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
    else
    inoremap <silent><expr> <c-@> coc#refresh()
    endif
   
   " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
   
   " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
   
   " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
   
   " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
   
   function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
    else
    execute '!' . &keywordprg . " " . expand('<cword>')
    endif
    endfunction
   
   " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
   
   " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
   
   " Formatting selected code.
    xmap <leader>f <Plug>(coc-format-selected)
    nmap <leader>f <Plug>(coc-format-selected)
   
   augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
   
   " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a <Plug>(coc-codeaction-selected)
    nmap <leader>a <Plug>(coc-codeaction-selected)
   
   " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf <Plug>(coc-fix-current)
   
   " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
   
   " Remap <C-f> and <C-b> for scroll float windows/popups.
    " Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
   
   " NeoVim-only mapping for visual mode scroll
    " Useful on signatureHelp after jump placeholder of snippet expansion
    if has('nvim')
    vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
    vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
    endif
   
   " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
   
   " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
   
   " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
   
   " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
   
   " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
   
   " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>

```
7. Aqui el [archivo que uso](./.nvim/init.vim)

Dejando nvim mas bonito
```

":::instalacion de plugins:::

call plug#begin('~/AppData/Local/nvim/plugged')     "directorio donde se van a instalar los plugins

"plugins
" Temas
Plug 'joshdick/onedark.vim'         "tema

"Otros
Plug 'Yggdroot/indentLine'         "indentacion
Plug 'mattn/emmet-vim'             "emmet para diseño web
Plug 'vim-airline/vim-airline'        "diseño de la barra en la cual se muestran los modos, la linea, etc.
Plug 'vim-airline/vim-airline-themes'    "temas para el vim-airline
Plug 'preservim/nerdtree'        "gestor de archivos en forma de arbol.
Plug 'christoomey/vim-tmux-navigator'    "poder navegar entre archivos abiertos
Plug 'jiangmiao/auto-pairs'        "autocompletado de llaves, corchetes, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}    "autocompletado inteligente

Plug 'easymotion/vim-easymotion'

"HolaMundo hacer nvim como vsCode
" syntax
Plug 'sheerun/vim-polyglot'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" typing
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

"tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" autocomplete
"Plug 'sirver/ultisnips'

"IDE
Plug 'editorconfig/editorconfig-vim'
" Para poder usar full la busyqeda recordar instalar 
" choco install ag
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'

call plug#end()             "cerramos el llamado de los plugins

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"CONFIGURACIONES BASICAS 
set number                 "muestra los numeros de cada linea en la parte izquierda 
set relativenumber             "la distribucion de los numeros en lineas de manera relativa
set mouse=a                 "permite la interaccion con el mouse
set noshowmode                "me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
set encoding=utf-8             "permite setear la codificación de archivos para aceptar caracteres especiales
set sw=4                 "la indentación genera 4 espacios
set nowrap                "el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
"set noswapfile                "para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard=unnamed            "para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.    
syntax enable                 "activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set showcmd                 "mostar los comandos que estoy ejecutando"
set showmatch

"configuracion del tema
set termguicolors             "activa el true color en la terminal
colorscheme onedark             "activar el tema onedark

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"Atajos
let mapleader=' '            "Definir tecla lider
"Usar primero la tecla lider y luego la s, para ejecutar el plugin
nmap <leader>s <Plug>(easymotion-s2) 

"Configuraciones fzf
nmap <C-p> :Files<Cr> 

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"configuracion de emmet-vim
let g:user_emmet_leader_key=','     "mapeando la tecla lider por una coma, con esto se completa los tag con doble coma.

"configuracion de vim-airline
let g:airline#extensions#tabline#enabled = 1    "muestra la linea de pestaña en la que estamos buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'    "muestra solo el nombre del archivo que estamos modificando
let g:airline_theme='onedark'    "el tema de airline

"configuracion de nerdtree
"mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa el
"control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
map <C-n> :NERDTreeToggle<CR>
"Despues de abrir el archivo, nerdTree se cierra
let NERDTreeQuitOnOpen = 1

"configuracion por defecto de coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"Comandos personalizados
"Guardar
nmap <leader>w :w<CR>
"Salir usando space + q
nmap <leader>q :q<CR>

```
---

# Agregar Prettier a nvim

Basado en el repo [coc-prettier]([GitHub - neoclide/coc-prettier: Prettier extension for coc.nvim.](https://github.com/neoclide/coc-prettier))

Usar el comando `:CocInstall coc-prettier`

para usar el comando personalizado se agrega  esta linea al `init.vim`. `command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument`

---

# Agregar LUA a NVIM

1. De este repo seguir instrucciones mas o menos [repo](https://github.com/nvim-telescope/telescope.nvim)

2. Agregar estos dos plugin a `init.vim`

   ```shell
   Plug 'nvim-lua/plenary.nvim'
   Plug 'nvim-telescope/telescope.nvim'
```

3. `C:\Users\adivi\AppData\Local\nvim\` en este directorio crear una carpeta llamada `lua`.

4. `C:\Users\adivi\AppData\Local\nvim\lua` en este directorio crear una carpeta llamada `daironper`, este sera el nombre del espacio de trabajo que uno quiera

5. `C:\Users\adivi\AppData\Local\nvim\lua\daironper` en este directorio crear dos archivos:
   
   1. `init.lua`, el cual contendra la linea 
      
      ```shell
      required('daironper.telescope')
      ```
   
   2. `telescope.lua`, el cual contendra la linea 
      
      ```shell
      require('telescope').setup {}
      ```

6. `C:\Users\adivi\AppData\Local\nvim\init.vim` agregar la linea
   
   ```shell
   lua require('daironpe')
   ```

---

# LSP

Soporte de lenguajes para autocompletado y todo eso.

1. Buscar en el [repo](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver) el lenguaje que se quiere

2. usando npm instalar el serve del lenguaje

3. `C:\Users\adivi\AppData\Local\nvim\lua\daironper` crear un archivo llamado `lspconfing.lua`

4. Agregar al archivo creado el `require` que pide el repo
   
   ejem:
   
   ```lua
   require('lspconfig').tsserver.setup{}
   ```

5. Agregar el `require` al `init.lua`
   
   ```lua
   require('daironper.lspconfig')
   ```

# Agregar packer

1. usando un powershell como admin este comando 
   
   ```shell
   git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
   ```

Igual siempre revisar la doc [oficial](https://github.com/wbthomason/packer.nvim#requirements)
