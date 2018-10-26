version (v01)
---




```
# main dataset
/home/ai/github/phd-thesis-code-data/data-outputs/dataset/hii/v00 

# code
/home/ai/github/phd-thesis-code-data/code/rscripts/utde/minimum_embedding_parameters-hii/cao/v01 

# dataset EMBEDDINGS
/home/ai/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/cao/v01
```







# `> source(paste(getwd(), "/B_cao.R", sep=""), echo=TRUE)`

```

#########################
#### one window lenght
windowsl <- c(100)
windowsn <- c('w2')


#########################
#### one window lenght
windowsl <- c(500)
windowsn <- c('w10')

movement_variables <- c('HNnb', 'HNwb', 'HFnb', 'HFwb', 'VNnb', 'VNwb', 'VFnb', 'VFwb')



##############################
# (4.2.3) Participants Selection

#number_of_participants <- 1
#number_of_participants <- 2
#number_of_participants <- 3
#number_of_participants <- 5
number_of_participants <- 6
#number_of_participants <- 10
#number_of_participants <- 12
#number_of_participants <- 20
#



```




compuation time for
```
pNN <- c('p01', 'p04', 'p05', 'p10', 'p11', 'p15')
xdatam <- xdatam[.(c('HS01', 'HS02'))] 
movement_variables <- c('HNnb', 'HNwb', 'HFnb', 'HFwb', 'VNnb', 'VNwb', 'VFnb', 'VFwb')
```



```


> end.time - start.time
Time difference of 2.822107 mins

```

output


```
> ################################################################################
> setwd(r_scripts_path) ## go back to the r-script source path
> EEE
       tau dim        E1        E2 Sensor         axis Participant Activity
    1:   1   1 0.0132460 0.9534432   HS01 sg0zmuvGyroY         p01     HNnb
    2:   1   2 0.2941764 1.0035379   HS01 sg0zmuvGyroY         p01     HNnb
    3:   1   3 0.6668275 0.9701358   HS01 sg0zmuvGyroY         p01     HNnb
    4:   1   4 0.7736898 1.0313859   HS01 sg0zmuvGyroY         p01     HNnb
    5:   1   5 0.9020815 1.0488871   HS01 sg0zmuvGyroY         p01     HNnb
   ---                                                                     
51836:  10   5 0.9751372 1.0159433   HS02 sg2zmuvGyroZ         p15     VFwb
51837:  10   6 0.9955595 1.0094466   HS02 sg2zmuvGyroZ         p15     VFwb
51838:  10   7 0.9986435 1.0100936   HS02 sg2zmuvGyroZ         p15     VFwb
51839:  10   8 0.9908782 1.0034276   HS02 sg2zmuvGyroZ         p15     VFwb
51840:  10   9 0.9988179 1.0005047   HS02 sg2zmuvGyroZ         p15     VFwb
> MMMED
      minEmdDim tau Sensor         axis Participant Activity
   1:         6   1   HS01 sg0zmuvGyroY         p01     HNnb
   2:         7   2   HS01 sg0zmuvGyroY         p01     HNnb
   3:         7   3   HS01 sg0zmuvGyroY         p01     HNnb
   4:         6   4   HS01 sg0zmuvGyroY         p01     HNnb
   5:         8   5   HS01 sg0zmuvGyroY         p01     HNnb
  ---                                                       
5756:         5   6   HS02 sg2zmuvGyroZ         p15     VFwb
5757:         6   7   HS02 sg2zmuvGyroZ         p15     VFwb
5758:         6   8   HS02 sg2zmuvGyroZ         p15     VFwb
5759:         6   9   HS02 sg2zmuvGyroZ         p15     VFwb
5760:         5  10   HS02 sg2zmuvGyroZ         p15     VFwb
> 
```

```
> end.time - start.time
Time difference of 4.879095 mins
```

at: 
`/home/map479/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/cao/v01`




 

```
3.7M Oct 21 10:31 EE-w10.dt
220K Oct 21 10:31 MED-w10.dt
```



















#  `> source(paste(getwd(), "/CA_cao_mm_H.R", sep=""), echo=TRUE)`

```

#acts <- 'H'
#windowl<-'w10'
#wdata <- fread('MED-w10.dt', header=TRUE)
#
```


```
> end.time - start.time
Time difference of 0.2305536 secs
```




```
5.3K Oct 21 10:38 aMED-H-w10.dt
```

at 

`/home/map479/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/cao/v01`










# `> source(paste(getwd(), "/CB_cao_mm_V.R", sep=""), echo=TRUE)`


comment and uncomment the following lines of code
```

#acts <- 'V'
#windowl<-'w10'
#wdata <- fread('MED-w10.dt', header=TRUE)
#
```


```

> end.time - start.time
Time difference of 0.6873651 secs

```

```
5.3K Oct 21 10:41 aMED-H-w10.dt
```


at 

`/home/map479/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/cao/v01`













# `> source(paste(getwd(), "/EA_plotcao_avMED_H.R", sep=""), echo=TRUE)`

```
#windowl<-'w10'
#aMED <- fread('aMED-H-w10.dt', header=TRUE)
#MED <- fread('MED-w10.dt', header=TRUE)
#EE <- fread('EE-w10.dt', header=TRUE)
#
```

```

> end.time - start.time
Time difference of 2.383607 secs

```


```


17K Oct 21 11:42 avMED-HS01-w10-HFnb.png
18K Oct 21 11:42 avMED-HS01-w10-HFwb.png
18K Oct 21 11:42 avMED-HS01-w10-HNnb.png
18K Oct 21 11:42 avMED-HS01-w10-HNwb.png
18K Oct 21 11:42 avMED-HS02-w10-HFnb.png
17K Oct 21 11:42 avMED-HS02-w10-HFwb.png
16K Oct 21 11:42 avMED-HS02-w10-HNnb.png
17K Oct 21 11:42 avMED-HS02-w10-HNwb.png

```

at: `/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters-hii/cao/v01`
















# `> source(paste(getwd(), "/EB_plotcao_avMED_V.R", sep=""), echo=TRUE)`


```


#windowl<-'w10'
#aMED <- fread('aMED-V-w10.dt', header=TRUE)
#MED <- fread('MED-w10.dt', header=TRUE)
#EE <- fread('EE-w10.dt', header=TRUE)
#

```






```
> end.time - start.time
Time difference of 2.391517 secs
```

`/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters-hii/cao/v01`

```

18K Oct 21 11:37 avMED-HS01-w10-VFnb.png
17K Oct 21 11:37 avMED-HS01-w10-VFwb.png
17K Oct 21 11:37 avMED-HS01-w10-VNnb.png
18K Oct 21 11:37 avMED-HS01-w10-VNwb.png
17K Oct 21 11:37 avMED-HS02-w10-VFnb.png
17K Oct 21 11:37 avMED-HS02-w10-VFwb.png
18K Oct 21 11:37 avMED-HS02-w10-VNnb.png
17K Oct 21 11:37 avMED-HS02-w10-VNwb.png
```



