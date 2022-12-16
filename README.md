# Notes

## Ubuntu
### poner una ruta global para poder usar luego
Go to your home directory.
Type ls -a
You should see file named .bashrc (perhaps you will see file named .zshrc insead - then replace .bashrc with .zshrc)
Type nano .bashrc
Add this line to the end of file: export PATH=/path/to/your/instalation/directory/android-studio/bin:$PATH
Press CTRL+s, then CTRL+x
Reload with source ~/.bashrc
