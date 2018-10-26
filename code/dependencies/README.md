

# R

## R version 3.4.4 (2018-03-15) -- "Someone to Lean On"

## installing R

Follow [this instructions](https://github.com/mxochicale/R/blob/master/upgradeR/installation-ubuntu1604.md) to install R in Ubuntu 16.04 


```
packages-dependencies.sh
```


## packages
Run `install-basic-packages.R` for package dependecies



##  nonlinearTseries


1. install dependencies by running `packages-dependencies.sh`
```
./packages-dependencies.sh
```

2. install nonlinearTseries with R script `install_nonlinearTseries.R`
```
R
source(paste(getwd(),"/install-nonlinearTseries.R", sep=""), echo=FALSE)
```

3. then clone personal nonlinearTseries repository
```
cd
cd github
git clone https://github.com/mxochicale/nonlinearTseries
```







# GNU Octave


## GNU Octave, version 4.0.2 [:link:](https://unix.stackexchange.com/questions/280195/how-to-install-octave-without-gui-in-ubuntu-16-0://unix.stackexchange.com/questions/280195/how-to-install-octave-without-gui-in-ubuntu-16-04)

* withouht: sudo apt-get build-dep octave [:link:](https://askubuntu.com/questions/730322/how-to-install-octave-in-ubuntu-14-04-using-terminal#comment1083602_730333)

```
cd ~/Downloads
wget ftp://ftp.gnu.org/gnu/octave/octave-4.0.2.tar.gz
tar xf octave-4.0.2.tar.gz
cd octave-4.0.2/
./configure
make 
sudo make install

# remove
rm -rf octave-4.0.2
rm octave-4.0.2.tar.gz 
```


remove octave [:link:](https://askubuntu.com/questions/814054/uninstalling-octave-from-ubuntu-16-04-lts)
```
sudo make uninstall

```



## ISSUES

### GNU Octave 4.2.2 Installation in Ubuntu 16.04
*(this versions has an issue with undefined variables when calling functions )*

```
sudo add-apt-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave octave-signal octave-control
```
remove octave [:link:](https://askubuntu.com/questions/814054/uninstalling-octave-from-ubuntu-16-04-lts) 
```
sudo apt-get remove --auto-remove octave
```






