

# `source(  paste( getwd(), '/Ba_timeseries_aH.R', sep=''), echo=TRUE )`,  `source(  paste( getwd(), '/Bb_timeseries_aV.R', sep=''), echo=TRUE )`




```
############################
####### one window lenght
#windowsl <- c(100)
#windowsn <- c('w2')
#

###########################
###### one window lenght
windowsl <- c(500)
windowsn <- c('w10')


##########################
##### two windows lenght
#windowsl <- c(500, 750)
#windowsn <- c('w10', 'w15')
```

figures
`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/timeseries_plots` 



```
-rw-rw-r-- 1 ai ai 317057 Sep 26 11:22 aH-sg0zmuvGyroZ-HS01-w500.png
-rw-rw-r-- 1 ai ai 317415 Sep 26 11:22 aH-sg0zmuvGyroZ-HS02-w500.png
-rw-rw-r-- 1 ai ai 314301 Sep 26 11:22 aH-sg1zmuvGyroZ-HS01-w500.png
-rw-rw-r-- 1 ai ai 314308 Sep 26 11:22 aH-sg1zmuvGyroZ-HS02-w500.png
-rw-rw-r-- 1 ai ai 225988 Sep 26 11:22 aH-sg2zmuvGyroZ-HS01-w500.png
-rw-rw-r-- 1 ai ai 227913 Sep 26 11:22 aH-sg2zmuvGyroZ-HS02-w500.png
-rw-rw-r-- 1 ai ai 308569 Sep 26 11:22 aV-sg0zmuvGyroY-HS01-w500.png
-rw-rw-r-- 1 ai ai 306992 Sep 26 11:22 aV-sg0zmuvGyroY-HS02-w500.png
-rw-rw-r-- 1 ai ai 303970 Sep 26 11:22 aV-sg1zmuvGyroY-HS01-w500.png
-rw-rw-r-- 1 ai ai 301627 Sep 26 11:22 aV-sg1zmuvGyroY-HS02-w500.png
-rw-rw-r-- 1 ai ai 218605 Sep 26 11:22 aV-sg2zmuvGyroY-HS01-w500.png
-rw-rw-r-- 1 ai ai 215399 Sep 26 11:22 aV-sg2zmuvGyroY-HS02-w500.png
```






# `source(  paste( getwd(), '/Ca_rp_aH.R', sep=''), echo=TRUE )`

```
###########################
###### one window lenght
windowsl <- c(500)
windowsn <- c('w10')

```

> end.time - start.time
Time difference of 1.491195 mins



figures path
```
/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rp_plots/H 
0 directories, 144 files  
```


# `source(  paste( getwd(), '/Cb_rp_aV.R', sep=''), echo=TRUE )`


```
###########################
###### one window lenght
windowsl <- c(500)
windowsn <- c('w10')

```

> end.time - start.time
Time difference of 1.478986 mins

figures path
```
/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rp_plots/V 
0 directories, 144 files  

```




# `source(  paste( getwd(), '/D_rqa.R', sep=''), echo=TRUE )`



> end.time - start.time
Time difference of 22.21162 secs



`/home/ai/github/phd-thesis-code-data/data-outputs/rqa/hii/v00`

```
 4096]  rqa
│   ├── [       4096]  hii
│   │   └── [       4096]  v00
│   │       └── [     112361]  rqa_w10.dt
```


```
> head(W)
   Participant Window Activity Sensor         Axis        REC      RATIO
1:         p01   w500     HNnb   HS01 sg0zmuvGyroY 0.66728013  1.4689405
2:         p01   w500     HNnb   HS01 sg1zmuvGyroY 0.69762707  1.4244194
3:         p01   w500     HNnb   HS01 sg2zmuvGyroY 1.00000000  0.9999902
4:         p01   w500     HNnb   HS01 sg0zmuvGyroZ 0.04747827 20.6106235
5:         p01   w500     HNnb   HS01 sg1zmuvGyroZ 0.05204989 19.0136019
6:         p01   w500     HNnb   HS01 sg2zmuvGyroZ 0.35145665  2.8382477
         DET         DIV Lmax     Lmean LmeanWithoutMain     ENTR       LAM
1: 0.9801948 0.002217295  451  19.66564         19.60200 2.722548 0.9900167
2: 0.9937135 0.002217295  451  45.40943         45.27903 3.713611 0.9983512
3: 0.9999902 0.002217295  451 226.75028        226.50000 6.111127 1.0000000
4: 0.9785567 0.002217295  451  23.20782         22.15686 3.057082 0.9864948
5: 0.9896558 0.002217295  451  28.52033         27.36957 3.332376 0.9934173
6: 0.9975210 0.002217295  451  57.34668         57.03045 4.045507 0.9996797
   Vmax      Vmean
1:  270  25.241631
2:  368  42.061188
3:  452 452.000000
4:   55   5.788869
5:   56   5.849391
6:  165  25.151016

```





# `> source(  paste( getwd(), '/Ea_rqa_plots_aH.R', sep=''), echo=TRUE )`

```
#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')
```


> end.time - start.time
Time difference of 4.300439 secs



# `> source(  paste( getwd(), '/Eb_rqa_plots_aV.R', sep=''), echo=TRUE )`

```
#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')
```


> end.time - start.time
Time difference of 4.039564 secs
















# `source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )`


> end.time - start.time
Time difference of 1.969605 mins

ai@machine:~/github/phd-thesis-code-data/data-outputs/rqa/hii/v00$ tree -h
.
├── [691K]  RQAs_p01w500.dt


# `source(  paste( getwd(), '/Fb_rqa_topology_plots.R', sep=''), echo=TRUE )`


> end.time - start.time
Time difference of 35.41509 secs

0 directories, 192 files
ai@machine:~/github/phd-thesis/figs/results/rqa/hii/v00/topologies/p01$ 


Wed 26 Sep 20:52:08 BST 2018





# `source(  paste( getwd(), '/Ga_rqa_topology.R', sep=''), echo=TRUE )`



```
window_path <- '/'
activitytag<-'H'
windowsl <- c(500)
p01
sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')
sensors <- c('HS01','HS02')# HumanSensor01  and HumanSensor02
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```

```
> end.time - start.time
Time difference of 32.46168 mins

 15M Sep 26 21:37 RQAs_p01w500_H.dt
```



```
window_path <- '/'
activitytag<-'V'
sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY
windowsl <- c(500)
activities <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
p01
sensors <- c('HS01','HS02')# HumanSensor01  and HumanSensor02
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```

```


> end.time - start.time
Time difference of 33.96764 mins

 14M Sep 27 11:34 RQAs_p01w500_V.dt

```




```
activitytag<-'V'
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY
	activities <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
pNN <- c('p04')
```

```
> end.time - start.time
Time difference of 34.9958 mins
14M Sep 27 13:38 RQAs_p04w500_V.dt
```


```
activitytag<-'H'
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')
pNN <- c('p04')
```

```

> end.time - start.time
Time difference of 30.57114 mins

14M Sep 27 14:10 RQAs_p04w500_H.dt
```






```
activitytag<-'H'
sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')
pNN <- c('p05')
```

```
> end.time - start.time
Time difference of 30.82028 mins
15M Sep 27 12:14 RQAs_p05w500_H.dt
```




```
activitytag<-'V'
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY
	activities <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
pNN <- c('p05')
```

```
> end.time - start.time
Time difference of 33.53593 mins
15M Sep 27 13:01 RQAs_p05w500_V.dt
```









```
pNN <- c('p04')
windowsl <- c(500)
sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb','VNnb', 'VNwb', 'VFnb', 'VFwb')
sensors <- c('HS01','HS02')# HumanSensor01  and HumanSensor02
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```

```
> end.time - start.time
Time difference of 3.567361 hours

52M Sep 27 01:42 RQAs_p04w500_all.dt
```



```
/home/ai/github/phd-thesis-code-data/data-outputs/rqa/hii/v00 

$ tree -h
.
├── [ 14M]  RQAs_p01w500_H.dt
├── [ 14M]  RQAs_p01w500_V.dt
├── [ 51M]  RQAs_p04w500_all.dt
├── [ 14M]  RQAs_p04w500_H.dt
├── [ 14M]  RQAs_p04w500_V.dt
├── [ 14M]  RQAs_p05w500_H.dt
├── [ 14M]  RQAs_p05w500_V.dt
└── [110K]  rqa_w10.dt
```










# `source(  paste( getwd(), '/Gb_rqa_topology_plots.R', sep=''), echo=TRUE )`


* p01

````
activitytag<-'H'
file<-'RQAs_p01w500_H'
selectParticipant <- 'p01'
activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')
axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
```

```
> end.time - start.time
Time difference of 47.32413 secs

`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p01/H` 
0 directories, 96 files

```


```
activitytag<-'V'
file<-'RQAs_p01w500_V'
selectParticipant <- 'p01'
activities <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')
```


```
> end.time - start.time
Time difference of 47.05734 secs

`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p01/V` 
0 directories, 96 files

```



* p04



```
activitytag<-'H'
file<-'RQAs_p04w500_H'
selectParticipant <- 'p04'
activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')
axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
```

```
> end.time - start.time
Time difference of 47.32413 secs

`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p04/H` 
0 directories, 96 files

```


```
activitytag<-'V'
file<-'RQAs_p04w500_V'
selectParticipant <- 'p04'
activities <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')
```

```
> end.time - start.time
Time difference of 47.32413 secs

`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p04/H` 
0 directories, 96 files

```



* p05



```
activitytag<-'H'
file<-'RQAs_p05w500_H'
selectParticipant <- 'p05'
activities <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')
axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
```

```
> end.time - start.time
Time difference of 47.32413 secs

`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p04/H` 
0 directories, 96 files

```


```
activitytag<-'V'
file<-'RQAs_p05w500_V'
selectParticipant <- 'p05'
activities <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')
```

```
> end.time - start.time
Time difference of 47.32413 secs

`/home/ai/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p04/H` 
0 directories, 96 files

```







# `source(  paste( getwd(), '/Ga_rqa_topology.R', sep=''), echo=TRUE )`


* for four windows 
```
#windowsl <- c(100,250,500,750)
#windowsn <- c('w2', 'w5', 'w10', 'w15')
```


** w750
```
window_path <- '/windows'
activitytag<-'H'
sg0zmuvGyroZ

windowsl <- c(750)
windowsn <- c('w15')

activities <- c('HNnb')
pNN <- c('p01')
sensors <- c('HS01')# HumanSensor01
```

```
> end.time - start.time
Time difference of 1.37724 mins
```




** w500
```
window_path <- '/windows'
activitytag<-'H'
sg0zmuvGyroZ

windowsl <- c(500)
windowsn <- c('w10')


activities <- c('HNnb')
pNN <- c('p01')
sensors <- c('HS01')# HumanSensor01
```

```
> end.time - start.time
Time difference of 42.65506 secs
```


** w250
```
window_path <- '/windows'
activitytag<-'H'
sg0zmuvGyroZ

windowsl <- c(250)
windowsn <- c('w10')


activities <- c('HNnb')
pNN <- c('p01')
sensors <- c('HS01')# HumanSensor01
```

```
> end.time - start.time
Time difference of 20.69652 secs
```

** w100
```
window_path <- '/windows'
activitytag<-'H'
sg0zmuvGyroZ

windowsl <- c(100)
windowsn <- c('w10')


activities <- c('HNnb')
pNN <- c('p01')
sensors <- c('HS01')# HumanSensor01
```

```
> end.time - start.time
Time difference of 14.25468 secs
```







```

~/github/phd-thesis-code-data/data-outputs/rqa/hii/v00/windows$ tree -h
.
├── [480K]  RQAs_p01w100_H.dt
├── [601K]  RQAs_p01w250_H.dt
├── [607K]  RQAs_p01w500_H.dt
└── [609K]  RQAs_p01w750_H.dt

0 directories, 4 files

```




# `source(  paste( getwd(), '/Gb_rqa_topology_plots.R', sep=''), echo=TRUE )`


* w100

````
activitytag<-'windows'
file <- 'RQAs_p01w100_H'
selectParticipant <- 'p01'
selectWindow <- 'w100'
activities <- c('HNnb')
sensors <- c('HS01')# HumanSensor01
axis <- c('sg0zmuvGyroZ')
```

```

> end.time - start.time
Time difference of 2.871578 secs

```

* w250

````
activitytag<-'windows'
file <- 'RQAs_p01w250_H'
selectParticipant <- 'p01'
selectWindow <- 'w250'
activities <- c('HNnb')
sensors <- c('HS01')# HumanSensor01
axis <- c('sg0zmuvGyroZ')
```

```

> end.time - start.time
Time difference of 2.871578 secs

```

* w500

````
activitytag<-'windows'
file <- 'RQAs_p01w500_H'
selectParticipant <- 'p01'
selectWindow <- 'w500'
activities <- c('HNnb')
sensors <- c('HS01')# HumanSensor01
axis <- c('sg0zmuvGyroZ')
```

```

> end.time - start.time

Time difference of 1.991215 secs
```

* w750

````
activitytag<-'windows'
file <- 'RQAs_p01w750_H'
selectParticipant <- 'p01'
selectWindow <- 'w750'
activities <- c('HNnb')
sensors <- c('HS01')# HumanSensor01
axis <- c('sg0zmuvGyroZ')
```

```

> end.time - start.time
Time difference of 1.935682 secs

```








```
~/github/phd-thesis/figs/results/rqa/hii/v00/rqa_topologies/p01/windows$ tree -h
.
├── [289K]  w100_DET_HS01_HNnb_sg0zmuvGyroZ.png
├── [300K]  w100_ENTR_HS01_HNnb_sg0zmuvGyroZ.png
├── [335K]  w100_RATIO_HS01_HNnb_sg0zmuvGyroZ.png
├── [298K]  w100_REC_HS01_HNnb_sg0zmuvGyroZ.png
├── [315K]  w250_DET_HS01_HNnb_sg0zmuvGyroZ.png
├── [311K]  w250_ENTR_HS01_HNnb_sg0zmuvGyroZ.png
├── [358K]  w250_RATIO_HS01_HNnb_sg0zmuvGyroZ.png
├── [313K]  w250_REC_HS01_HNnb_sg0zmuvGyroZ.png
├── [328K]  w500_DET_HS01_HNnb_sg0zmuvGyroZ.png
├── [325K]  w500_ENTR_HS01_HNnb_sg0zmuvGyroZ.png
├── [334K]  w500_RATIO_HS01_HNnb_sg0zmuvGyroZ.png
├── [300K]  w500_REC_HS01_HNnb_sg0zmuvGyroZ.png
├── [315K]  w750_DET_HS01_HNnb_sg0zmuvGyroZ.png
├── [329K]  w750_ENTR_HS01_HNnb_sg0zmuvGyroZ.png
├── [364K]  w750_RATIO_HS01_HNnb_sg0zmuvGyroZ.png
└── [319K]  w750_REC_HS01_HNnb_sg0zmuvGyroZ.png

0 directories, 16 files
```

















# SORTED 

* [x] New plots to compare, smootheness, windolength in different sensors 
	and for different participatns


	sg0zmuvAccX, sg1zmuvAccX, sg2zmuvAccX, sg3zmuvAccX,
	sg0zmuvAccY, sg1zmuvAccY, sg2zmuvAccY, sg3zmuvAccY,
	sg0zmuvAccZ, sg1zmuvAccZ, sg2zmuvAccZ, sg3zmuvAccZ,
	sg0zmuvGyroX, sg1zmuvGyroX, sg2zmuvGyroX, sg3zmuvGyroX,
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg3zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ, sg3zmuvGyroZ

*NOTE* When running `C0_rp` for all axis, particpants, sensors, and activities.
	it takes Time difference of 30.18849 mins

Then we only select the axis AccY and GyroZ as being the axis which show 
better consistency in the patters for all the posibilities int he time series.

RP for 
```
> names(xpa)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "sg0zmuvAccY" 
 [6] "sg1zmuvAccY"  "sg2zmuvAccY"  "sg3zmuvAccY"  "sg0zmuvGyroZ" "sg1zmuvGyroZ"
[11] "sg2zmuvGyroZ" "sg3zmuvGyroZ"
```
were computed in Time difference of 10.66991 mins

	added: Tue 19 Jun 20:26:27 BST 2018  

Main issues has been solved with:
```
source(  paste( getwd(), '/A_dataset.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Ba_timeseries_aH.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Bb_timeseries_aV.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Ca_rp_aH.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Cb_rp_aV.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/D_rqa.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Ea_rqa_plots_aH.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Eb_rqa_plots_aV.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/F0_rqa_topology.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Fb_rqa_topology_plots.R', sep=''), echo=TRUE )
```
	sorted: Fri 20 Jul 16:59:36 BST 2018  







* [x] Create a 3d surface as figure 1.16 in \cite{marwan2015} with three parameters: 
	- RQA metric, embedding dimension, recurrence threshold
	- RQA metric, delay embedding, recurrence threshold

```
@incollection{marwan2015,
  author    = {Norbert Marwan and Charles L. Webber}, 
  title={Mathematical and Computational Foundations of Recurrence Quantifications}, 
  editor = {Charles L. Webber and Norbert Marwan}, 
  booktitle = {Recurrence Quantification Analysis: Theory and Best Practices},
  publisher = {Springer, Cham},
  edition   = 1,
  isbn      = {978-3-319-07154-1},
  year= 2015, 
  pages       = "3-43",
  chapter     = 1
}
```
	added: Wed 20 Jun 08:11:06 BST 2018
	sorted:  Wed 18 Jul 15:49:33 BST 2018 with `source(  paste( getwd(), '/F0_rqa_topology.R', sep=''), echo=TRUE )`



* [x] testing epsilon parameters:


```

		#epsilon<-0.2#all rp almost white	
		#epsilon <- 0.8#well distinguished rp
		epsilon <- 1#well distinguished rp
		#epsilon <- 1.2#well distinguished rp
		#epsilon<-2# rp p02HN white
		#epsilon<-3# p01HNsg1>black then p01HNsg2>white	
                rqa.analysis=rqa(time.series = xn, embedding.dim= dim_i, time.lag=tau_j,
                                   radius=epsilon,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)

```


added: Thu 31 May 10:01:46 BST 2018
sorted:  Wed 18 Jul 15:50:05 BST 2018 with `source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )`



* [x] adding vertical arm movements!

added: Thu  5 Jul 16:42:31 BST 2018
sorted: Mon  9 Jul 22:16:24 BST 2018



* [x]  Delete `xdata_v03.dt` which size is 145MB before comit the repo!

```
> names(xpa)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "sg0zmuvAccX" 
 [6] "sg1zmuvAccX"  "sg2zmuvAccX"  "sg3zmuvAccX"  "sg0zmuvAccY"  "sg1zmuvAccY" 
[11] "sg2zmuvAccY"  "sg3zmuvAccY"  "sg0zmuvAccZ"  "sg1zmuvAccZ"  "sg2zmuvAccZ" 
[16] "sg3zmuvAccZ"  "sg0zmuvGyroX" "sg1zmuvGyroX" "sg2zmuvGyroX" "sg3zmuvGyroX"
[21] "sg0zmuvGyroY" "sg1zmuvGyroY" "sg2zmuvGyroY" "sg3zmuvGyroY" "sg0zmuvGyroZ"
[26] "sg1zmuvGyroZ" "sg2zmuvGyroZ" "sg3zmuvGyroZ"
```

`xdata_v03.dt` 53MB for 

```
> names(xpa)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "sg0zmuvAccY" 
 [6] "sg1zmuvAccY"  "sg2zmuvAccY"  "sg3zmuvAccY"  "sg0zmuvGyroZ" "sg1zmuvGyroZ"
[11] "sg2zmuvGyroZ" "sg3zmuvGyroZ"
```
	added: Tue 19 Jun 20:25:26 BST 2018


Data only for the following sensors with two smotthed normalised valuyes
```

polynomial_degree <- 5
SavitzkyGolayCoeffs1 <- sgolay(p=polynomial_degree, n=29 ,m=0)
SavitzkyGolayCoeffs2 <- sgolay(p=polynomial_degree, n=159 ,m=0)


...

xpa <- xdata[,.(
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]

```
	sorted: Sun  8 Jul 20:42:20 BST 2018




# TODO

* [ ] Modify the dimensions of the plot as well as the limits in each of the axis
	to show with more detail of the fluctuations of the 3d surfaces and its maxima
	and minima int them.   
	added: Fri 20 Jul 17:04:33 BST 2018  



* [ ]  Test the changes in RQA values when using different sources of datatables:
* /home/map479/mxochicale/github/hwum-dataset/r-scripts/rqa/v01 
* /home/map479/mxochicale/github/hwum-dataset/r-scripts/rqa/v02

```
preprossededata_path <- paste(github_path,'/DataSets/hwum_repository/outcomes/preProcessedDataTable_p01_to_p22',sep='')
data <- fread("TidiedInterpolatedData.datatable", header=TRUE)

rawdata_path <- paste(github_path,'/hwum-dataset/data-output/rawdata',sep='')
xdata <- fread("TidiedInterpolatedRawData-v06.dt", header=TRUE)

```

	added: Fri 15 Jun 22:40:02 BST 2018



* [ ]  Lmax values distrubution of values are a very suspicipuos for all the
participants which require more investgations about the calculations 

added: Fri 15 Jun 21:36:23 BST 2018





######################################################################
# `source(  paste( getwd(), '/F0_rqa_topology.R', sep=''), echo=TRUE )`

3D plot for  one participant and one axis



```


##########################
##### one window lenght
windowsl <- c(100)
windowsn <- c('w2')



```





# REVIEW THE CODE FROM HERE!
Fri 31 Aug 19:58:41 BST 2018







# `source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )`


select axis
```
data <- data[,.(
	sg0zmuvGyroZ
	#sg0zmuvGyroZ, sg1zmuvGyroZ
	#sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]
```

select window
```
###########################
##### four window lenghts
windowsl <- c(100,250,500,750)
windowsn <- c('w2', 'w5', 'w10', 'w15')
```

select activity
```
#activities <- c( 'HN' )
activities <- c( 'HN', 'HF' )
#activities <- c('HN', 'HF', 'VN', 'VF')
```


select number of participants
```
#number_of_participants <- 1
#number_of_participants <- 3
#number_of_participants <- 12
number_of_participants <- 20
```

select sensors
```
#sensors <- c('HS01') # HumanSensor01
sensors <- c('HS01','RS01')# RobotSensor01  and HumanSensor01	
```

select embedding parameters
```
#dimensions <- seq(1,10)
#delays <- seq(1,10)
```

select recurrence threshold
```
epsilons <- seq(0.2,3.0,0.1)
```





Unfortunatelly, the machine has been fresed after closing and open brave internet browser
for which the computation of three days has been lost. However, we have learnt that 
memory resources has to be well used to avoid memory problems. Therefore, using top
is good tool. 
Similarly, creating different RQAs files for each participant would help us to get
results from one to one, without waiting for the completion of all particpants.
added: Wed 18 Jul 15:49:03 BST 2018



machine has been frozen for the second time on the day, which is a bit strage!
However, this time I will separeate the RQA of particpant01
with four windows  and avoid exesive use of the machine  resources!
added: Wed 18 Jul 22:50:25 BST 2018



* output files path:  `/home/map479/mxochicale/github/hwum-dataset/data-output/rqa/v03/rqa`


```
Time difference of 18.66111 mins 
for: 23M Jul 18 23:15 RQAs_p01w100.dt

p01
w100
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```




```
Time difference of 45.54471 mins
25M Jul 19 11:57 RQAs_p01w250.dt


p01
w250
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```



```
Time difference of 3.272555 hours
for: 26M Jul 19 02:42 RQAs_p01w500.dt

p01
w500
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)

```



```
Time difference of 10.53419 hours
for: 26M Jul 19 23:01 RQAs_p01w750.dt

p01
w750
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```


```
Time difference of 3.196113 hours
for 26M Jul 20 02:29 RQAs_p02w500.dt

p02
w500
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```



```
Time difference of 3.262477 hours
for 25M Jul 20 12:10 RQAs_p03w500.dt

p03
w500
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```









# `source(  paste( getwd(), '/Fb_rqa_topology_plots.R', sep=''), echo=TRUE )`


```
#
#file_ext <- paste('RQAs_p01w100.dt',sep='')
#W100 <- fread( file_ext, header=TRUE)
#
#file_ext <- paste('RQAs_p01w250.dt',sep='')
#W250 <- fread( file_ext, header=TRUE)
#
#file_ext <- paste('RQAs_p01w500.dt',sep='')
#W500 <- fread( file_ext, header=TRUE)
#
#file_ext <- paste('RQAs_p01w750.dt',sep='')
#W750 <- fread( file_ext, header=TRUE)
#
#W <- rbind(W100, W250, W500, W750)
#

#file_ext <- paste('RQAs_p02w500.dt',sep='')
#W <- fread( file_ext, header=TRUE)
#

file_ext <- paste('RQAs_p03w500.dt',sep='')
W <- fread( file_ext, header=TRUE)
```





```
## (4.2.1) Activities Selection
	#activities <- c('HN','HF')
	activities <- c('VN','VF')
```


```

				#axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
				axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')

```










































