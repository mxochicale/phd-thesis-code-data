
##scripts
/home/ai/github/phd-thesis-code-data/code/rscripts/utde/minimum_embedding_parameters-hii/ami/v00 


##datapath
/home/ai/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/ami/v00 





# scripts



# `source(paste(getwd(),"/B_ami.R", sep=""), echo=TRUE)`

```
#####################################
# w2, 2-second window (100 samples) ## 100 to 200
wstar=100
windowlengthnumber=100
windowltag <- 'w2'

######################################
## w5, 5-second window (250 samples) # 100 to 350
#wstar=100
#windowlengthnumber=250
#windowltag <- 'w5'

######################################
### w10, 10-second window (500 samples) ## 100 to 600
#wstar=100
#windowlengthnumber=500
#windowltag <- 'w10'
#
######################################
## w15, 15-second window (750 samples) ## 100 to 850
#wstar=100
#windowlengthnumber=750
#windowltag <- 'w15'
```

```
> end.time - start.time
Time difference of 5.333008 secs
```


datapath: `/home/ai/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/ami/v00` 

```
-rw-rw-r-- 1 ai ai 3188178 Sep 25 14:54 AMI-w10.dt
-rw-rw-r-- 1 ai ai   21528 Sep 25 14:54 MTD-w10.dt
```




# `source(paste(getwd(),"/CA_plotamiH.R", sep=""), echo=TRUE)`

```
AMI <- fread('AMI-w2.dt', header=TRUE)
MTD <- fread('MTD-w2.dt', header=TRUE)
windowl<-'w2'


#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#
#
#AMI <- fread('AMI-w10.dt', header=TRUE)
#MTD <- fread('MTD-w10.dt', header=TRUE)
#windowl<-'w10'
#
#
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
```



```
> end.time - start.time
Time difference of 1.589342 secs
```

output path
`/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters-hii/ami/v00` 



```
-rw-rw-r-- 1 ai ai 28478 Sep 25 17:38 mindelaysi_HS01_HFnb-window-w10.png
-rw-rw-r-- 1 ai ai 28799 Sep 25 17:38 mindelaysi_HS01_HFwb-window-w10.png
-rw-rw-r-- 1 ai ai 28682 Sep 25 17:38 mindelaysi_HS01_HNnb-window-w10.png
-rw-rw-r-- 1 ai ai 28724 Sep 25 17:38 mindelaysi_HS01_HNwb-window-w10.png
-rw-rw-r-- 1 ai ai 28775 Sep 25 17:38 mindelaysi_HS02_HFnb-window-w10.png
-rw-rw-r-- 1 ai ai 28755 Sep 25 17:38 mindelaysi_HS02_HFwb-window-w10.png
-rw-rw-r-- 1 ai ai 28700 Sep 25 17:38 mindelaysi_HS02_HNnb-window-w10.png
-rw-rw-r-- 1 ai ai 28854 Sep 25 17:38 mindelaysi_HS02_HNwb-window-w10.png
```


# `source(paste(getwd(),"/CB_plotamiV.R", sep=""), echo=TRUE)`


```
AMI <- fread('AMI-w2.dt', header=TRUE)
MTD <- fread('MTD-w2.dt', header=TRUE)
windowl<-'w2'


#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#

#AMI <- fread('AMI-w10.dt', header=TRUE)
#MTD <- fread('MTD-w10.dt', header=TRUE)
#windowl<-'w10'
#
##
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
#
```



```
> end.time - start.time
Time difference of 3.634047 secs
```

output path
`/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters-hii/ami/v00` 


```

-rw-rw-r-- 1 ai ai 28604 Sep 25 17:34 mindelaysi_HS01_VFnb-window-w10.png
-rw-rw-r-- 1 ai ai 28712 Sep 25 17:34 mindelaysi_HS01_VFwb-window-w10.png
-rw-rw-r-- 1 ai ai 28560 Sep 25 17:34 mindelaysi_HS01_VNnb-window-w10.png
-rw-rw-r-- 1 ai ai 28568 Sep 25 17:34 mindelaysi_HS01_VNwb-window-w10.png
-rw-rw-r-- 1 ai ai 28734 Sep 25 17:34 mindelaysi_HS02_VFnb-window-w10.png
-rw-rw-r-- 1 ai ai 28749 Sep 25 17:34 mindelaysi_HS02_VFwb-window-w10.png
-rw-rw-r-- 1 ai ai 28846 Sep 25 17:34 mindelaysi_HS02_VNnb-window-w10.png
-rw-rw-r-- 1 ai ai 28753 Sep 25 17:34 mindelaysi_HS02_VNwb-window-w10.png



```





# todo

* [ ] automatically select the window

Fri 31 Aug 13:42:24 BST 2018


