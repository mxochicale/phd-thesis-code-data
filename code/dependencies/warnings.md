


install-nonlinearTseries.R


'when using load_all()'
```
--------------------------------------------------------------------
ERROR: configuration failed for package ‘xml2’
* removing ‘/home/ai/R/x86_64-pc-linux-gnu-library/3.4/xml2’
* installing *source* package ‘devtools’ ...
** package ‘devtools’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
* DONE (devtools)
ERROR: dependency ‘xml2’ is not available for package ‘roxygen2’
* removing ‘/home/ai/R/x86_64-pc-linux-gnu-library/3.4/roxygen2’
ERROR: dependency ‘xml2’ is not available for package ‘rversions’
* removing ‘/home/ai/R/x86_64-pc-linux-gnu-library/3.4/rversions’

The downloaded source packages are in
	‘/tmp/RtmpCrdhTi/downloaded_packages’
Warning messages:
1: In install.packages("xml2", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘xml2’ had non-zero exit status
2: In install.packages("roxygen2", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘xml2’ had non-zero exit status
3: In install.packages("roxygen2", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘roxygen2’ had non-zero exit status
4: In install.packages("devtools", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘xml2’ had non-zero exit status
5: In install.packages("devtools", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘roxygen2’ had non-zero exit status
6: In install.packages("devtools", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘rversions’ had non-zero exit status
> 

```

```

checking for X... no
configure: error: X11 not found but required, configure aborted.
ERROR: configuration failed for package ‘rgl’
* removing ‘/home/ai/R/x86_64-pc-linux-gnu-library/3.4/rgl’
ERROR: dependency ‘rgl’ is not available for package ‘nonlinearTseries’
* removing ‘/home/ai/R/x86_64-pc-linux-gnu-library/3.4/nonlinearTseries’

The downloaded source packages are in
	‘/tmp/RtmphIzE5B/downloaded_packages’
Warning messages:
1: In install.packages("nonlinearTseries", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘rgl’ had non-zero exit status
2: In install.packages("nonlinearTseries", repos = mirror_repo, dependencies = TRUE) :
  installation of package ‘nonlinearTseries’ had non-zero exit status
```

Fri 31 Aug 12:47:02 BST 2018


sorted with 

```
sudo apt-get --yes install libxml2-dev # for xml2 calling load_all()
sudo apt-get install --yes r-cran-rgl # rgl for nonlinearTseries
```


* after installing packages <- c('car', 'scatterplot3d', 'plot3D', tseriesChaos" PLUS  dependencies = TRUE)

```
Warning messages:
1: In FUN(X[[i]], ...) :
  installation of package ‘rgl’ had non-zero exit status
2: In FUN(X[[i]], ...) :
  installation of package ‘alr4’ had non-zero exit status
```


Fri 31 Aug 11:14:35 BST 2018


* after installing ggplot2 and signal

```
** testing if installed package can be loaded
* DONE (Hmisc)
ERROR: dependencies ‘gdtools’, ‘svglite’, ‘xml2’ are not available for package ‘vdiffr’
* removing ‘/home/ai/R/x86_64-pc-linux-gnu-library/3.4/vdiffr’

The downloaded source packages are in
	‘/tmp/Rtmpsd651G/downloaded_packages’

```

Fri 31 Aug 10:47:00 BST 2018
