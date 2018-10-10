
```
# main dataset
/home/ai/github/phd-thesis-code-data/data-outputs/dataset/hii/v00 

# code
/home/ai/github/phd-thesis-code-data/code/rscripts/utde/minimum_embedding_parameters-hii/cao/v00 

# dataset EMBEDDINGS
/home/ai/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters-hii/cao/v00 
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


```



```
3.7M Sep 25 12:18 EE-w10.dt
220K Sep 25 12:18 MED-w10.dt
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
Time difference of 0.2517123 secs

```




# `> source(paste(getwd(), "/DA_plotcao_E1E2_allMED_H.R", sep=""), echo=TRUE)`

```
windowl<-'w2'
aMED <- fread('aMED-H-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)
```



```
> end.time - start.time
Time difference of 15.74181 secs
```


# `> source(paste(getwd(), "/DB_plotcao_E1E2_allMED_V.R", sep=""), echo=TRUE)`


```
windowl<-'w2'
aMED <- fread('aMED-V-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)
```

```

> end.time - start.time
Time difference of 15.77039 secs


```




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
Time difference of 3.755447 secs
```



```
-rw-rw-r-- 1 ai ai 32012 Sep 25 14:09 avMED-HS01-w10-HFnb.png
-rw-rw-r-- 1 ai ai 31999 Sep 25 14:09 avMED-HS01-w10-HFwb.png
-rw-rw-r-- 1 ai ai 31888 Sep 25 14:09 avMED-HS01-w10-HNnb.png
-rw-rw-r-- 1 ai ai 31974 Sep 25 14:09 avMED-HS01-w10-HNwb.png
-rw-rw-r-- 1 ai ai 32049 Sep 25 14:09 avMED-HS02-w10-HFnb.png
-rw-rw-r-- 1 ai ai 31956 Sep 25 14:09 avMED-HS02-w10-HFwb.png
-rw-rw-r-- 1 ai ai 31926 Sep 25 14:09 avMED-HS02-w10-HNnb.png
-rw-rw-r-- 1 ai ai 32041 Sep 25 14:09 avMED-HS02-w10-HNwb.png
```


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
Time difference of 3.810233 secs
```



`/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters-hii/cao/v00`


```

-rw-rw-r-- 1 ai ai 32049 Sep 25 14:10 avMED-HS01-w10-VFnb.png
-rw-rw-r-- 1 ai ai 32020 Sep 25 14:10 avMED-HS01-w10-VFwb.png
-rw-rw-r-- 1 ai ai 32002 Sep 25 14:10 avMED-HS01-w10-VNnb.png
-rw-rw-r-- 1 ai ai 31934 Sep 25 14:10 avMED-HS01-w10-VNwb.png
-rw-rw-r-- 1 ai ai 32003 Sep 25 14:10 avMED-HS02-w10-VFnb.png
-rw-rw-r-- 1 ai ai 32045 Sep 25 14:10 avMED-HS02-w10-VFwb.png
-rw-rw-r-- 1 ai ai 31959 Sep 25 14:10 avMED-HS02-w10-VNnb.png
-rw-rw-r-- 1 ai ai 32006 Sep 25 14:10 avMED-HS02-w10-VNwb.png

```



