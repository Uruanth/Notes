# NeoVim Ubuntu melo

usar los comandos

~~~bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo apt install silversearcher-ag

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
##Instalar la ultima version de node lts

sudo apt install python3-pip
~~~

Este archivo debe ser tipo lua, ejemplo, `plugin.lua` y debe ser requerido en el init.lua, instala automaticamente el packer.vim para instalar plugins

~~~lua
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like:
  -- use 'neovim/nvim-lspconfig'
  end
)
~~~

luego abrir init.vim y ejecutar :PlugInstall y :PackerInstall

> Repo lista [servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) lsp

