# installscript-linux
Normalerweise verwendet man kein `sudo` in einem Bash script, aber hier handelt es sich auch mehr um  
eine Beispielsammlung von Programmen und eher weniger um ein fertiges Script.  
Es sollte zwar auch so problemlos die genannten packages installieren,  
jedoch finden sich viele auskommentierte Pakete und Links, die ja gerade dazu da sind  
um je nach Bedarf aktiviert zu werden.  

### Tipp:
Before invoking `apt install`, filter non-existent packages out of the list. The list of installable  
packages can be obtained by running `apt-cache --generate pkgnames`, which we then `grep` for  
the packages we want to install, and `xargs` the result into `apt install`. The full command looks  
like this:  

```
apt-cache --generate pkgnames \
| grep --line-regexp --fixed-strings \
  -e package1 \
  -e package2 \
  -e package3 \
  … \
| xargs apt install -y
```
