# installscript-linux
This script is supposed to automate the installation of many programs at the same time.  
Normally you wouldn't use `sudo` in a bash script, but in this case it's probably more like a  
collection of programs and apps and less of a normal script.  
This script includes a lot of deactivated/commented lines and you are encouraged to uncomment them  
depending on your needs. You can use this script as a guide to install some additional programs and codecs.  
I also tried to add a few explanations on the side.  

If you want to use this setup script the way it is, open your terminal and type:
```
sudo apt install curl
curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/webinstall.sh -O
chmod +x webinstall.sh
./webinstall.sh
```

### Tipps:
[If you do these 5 things... You should NOT use Linux](https://youtu.be/06cKL5DQ5CY)  
[Simple Tasks on Linux](https://youtu.be/6h2UmKTcCfA)  
[How to Use GitHub](https://youtu.be/v_1iqtOnUMg)  
[Git Tutorial Playlist](https://www.youtube.com/playlist?list=PL4cUxeGkcC9goXbgTDQ0n_4TBzOO0ocPR)  
[Understanding Linux Distros](https://youtu.be/DKFnqAtEOvc)  
[How to Choose a Linux Distribution](https://youtu.be/iox7fr7p5Hc)  
Use Linux for things like very long blender 3d renderings because the linux version will often cut the render time in half.  
Use Linux if your game runs too slow on Windows or your pc is just very old and you know how to use Linux.  

### Optional:
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

