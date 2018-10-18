version 05  (v05)
---


# todo

* [ ] automatically select the window

Fri 31 Aug 13:42:24 BST 2018


# scripts


```
R
source(paste(getwd(),"/A_dataset.R", sep=""), echo=TRUE)
```



# `source(paste(getwd(),"/B_ami.R", sep=""), echo=TRUE)`

```
######################################
## w2, 2-second window (100 samples) ## 100 to 200
#wstar=100
#windowlengthnumber=100
#windowltag <- 'w2'
#
######################################
## w5, 5-second window (250 samples) # 100 to 350
#wstar=100
#windowlengthnumber=250
#windowltag <- 'w5'

#####################################
## w10, 10-second window (500 samples) ## 100 to 600
wstar=100
windowlengthnumber=500
windowltag <- 'w10'

######################################
## w15, 15-second window (750 samples) ## 100 to 850
#wstar=100
#windowlengthnumber=750
#windowltag <- 'w15'
```


```
> end.time - start.time
Time difference of 10.43898 secs
```

```
4.9M Oct 16 18:48 AMI-w10.dt
34K Oct 16 18:48 MTD-w10.dt
```
at `/home/ai/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters/ami/v05` 






# `source(paste(getwd(),"/CA_plotamiH.R", sep=""), echo=TRUE)`

```
#AMI <- fread('AMI-w2.dt', header=TRUE)
#MTD <- fread('MTD-w2.dt', header=TRUE)
#windowl<-'w2'
#

#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#
#
AMI <- fread('AMI-w10.dt', header=TRUE)
MTD <- fread('MTD-w10.dt', header=TRUE)
windowl<-'w10'

#
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
```



```
> end.time - start.time
Time difference of 2.365328 secs
```


```
28K Oct 16 19:21 mindelaysi_HS01_HF-window-w10.png
28K Oct 16 19:21 mindelaysi_HS01_HN-window-w10.png
27K Oct 16 19:21 mindelaysi_RS01_HF-window-w10.png
25K Oct 16 19:21 mindelaysi_RS01_HN-window-w10.png
```


at `/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters/ami/v05`
 

# `source(paste(getwd(),"/CB_plotamiV.R", sep=""), echo=TRUE)`


```
#AMI <- fread('AMI-w2.dt', header=TRUE)
#MTD <- fread('MTD-w2.dt', header=TRUE)
#windowl<-'w2'
#

#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#

AMI <- fread('AMI-w10.dt', header=TRUE)
MTD <- fread('MTD-w10.dt', header=TRUE)
windowl<-'w10'

##
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
#
```


```
> end.time - start.time
Time difference of 0.7130244 secs
```

```
51K Oct 16 19:28 mindelaysi_HS01_VF-window-w10.png
32K Oct 16 19:28 mindelaysi_HS01_VN-window-w10.png
50K Oct 16 19:28 mindelaysi_RS01_VF-window-w10.png
31K Oct 16 19:28 mindelaysi_RS01_VN-window-w10.png
```

at 
`/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters/ami/v05`
