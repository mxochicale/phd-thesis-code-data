version 05 (v05)
---



# `> source(paste(getwd(), "/A_dataset.R", sep=""), echo=TRUE)`

```
xpa <- xdata[,.(
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]
```


`42M Oct 16 12:13 xdata_v05.dt`
at
`~/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters/dataset/v05`




# `> source(paste(getwd(), "/B_cao.R", sep=""), echo=TRUE)`





```
##########################
## (4.2.1) Activities Selection
#movement_variables <- c('HN','HF')
#movement_variables <- c('VN','VF')
movement_variables <- c('HN', 'HF', 'VN', 'VF')

```




```
#########################
#### one window lenght
windowsl <- c(100)
windowsn <- c('w2')

```
computation time for time series with 100sample window
```
Time difference of 51.67624 secs
```

```
6.0M Oct 16 12:24 EE-w2.dt
348K Oct 16 12:24 MED-w2.dt
```


at 
`~/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters/cao/v05` 





```
#########################
#### one window lenght
windowsl <- c(500)
windowsn <- c('w10')

```
computation time for time series with 100sample window
```
Time difference of 4.839247 mins
```

```
6.0M Oct 16 12:34 EE-w10.dt
348K Oct 16 12:34 MED-w10.dt

```


at 
`~/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters/cao/v05` 







```
###########################
##### four window lenghts
windowsl <- c(100,   250,  500,   750)
windowsn <- c('w2', 'w5', 'w10', 'w15')
```

computation time for time series with four windows 
```
> end.time - start.time
Time difference of 30.56192 mins
```









#  `> source(paste(getwd(), "/CA_cao_mm_H.R", sep=""), echo=TRUE)`

```
#acts <- 'H'
#windowl<-'w2'
#wdata <- fread('MED-w2.dt', header=TRUE)
#
#
#acts <- 'H'
#windowl<-'w5'
#wdata <- fread('MED-w5.dt', header=TRUE)

acts <- 'H'
windowl<-'w10'
wdata <- fread('MED-w10.dt', header=TRUE)

#acts <- 'H'
#windowl<-'w15'
#wdata <- fread('MED-w15.dt', header=TRUE)
```




> end.time - start.time
Time difference of 0.8402872 secs

```
8.3K Oct 16 12:43 aMED-H-w10.dt
```

at 
`~/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters/cao/v05` 






# `> source(paste(getwd(), "/CB_cao_mm_V.R", sep=""), echo=TRUE)`


comment and uncomment the following lines of code
```
#acts <- 'V'
#windowl<-'w2'
#wdata <- fread('MED-w2.dt', header=TRUE)


#acts <- 'V'
#windowl<-'w5'
#wdata <- fread('MED-w5.dt', header=TRUE)

acts <- 'V'
windowl<-'w10'
wdata <- fread('MED-w10.dt', header=TRUE)

#acts <- 'V'
#windowl<-'w15'
#wdata <- fread('MED-w15.dt', header=TRUE)
```



```
> end.time - start.time
Time difference of 0.6102109 secs
```


`8.3K Oct 16 12:57 aMED-V-w10.dt`

at 
`~/github/phd-thesis-code-data/data-outputs/utde/minimum_embedding_parameters/cao/v05` 













# `> source(paste(getwd(), "/EA_plotcao_avMED_H.R", sep=""), echo=TRUE)`

```

#
#windowl<-'w2'
#aMED <- fread('aMED-H-w2.dt', header=TRUE)


#windowl<-'w5'
#aMED <- fread('aMED-H-w5.dt', header=TRUE)


windowl<-'w10'
aMED <- fread('aMED-H-w10.dt', header=TRUE)

#windowl<-'w15'
#aMED <- fread('aMED-H-w15.dt', header=TRUE)


```



> end.time - start.time
Time difference of 0.7096527 secs



```
18K Oct 16 16:53 bp_avMED-HS01-w10-HF.png
19K Oct 16 16:53 bp_avMED-HS01-w10-HN.png
18K Oct 16 16:53 bp_avMED-RS01-w10-HF.png
17K Oct 16 16:53 bp_avMED-RS01-w10-HN.png
```

at `/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters/cao/v05`







# `> source(paste(getwd(), "/EB_plotcao_avMED_V.R", sep=""), echo=TRUE)`


```
#windowl<-'w2'
#aMED <- fread('aMED-V-w2.dt', header=TRUE)
#
#
#windowl<-'w5'
#aMED <- fread('aMED-V-w5.dt', header=TRUE)


windowl<-'w10'
aMED <- fread('aMED-V-w10.dt', header=TRUE)


#windowl<-'w15'
#aMED <- fread('aMED-V-w15.dt', header=TRUE)




```



> end.time - start.time
Time difference of 0.7334752 secs


```
19K Oct 16 16:56 bp_avMED-HS01-w10-VF.png
19K Oct 16 16:56 bp_avMED-HS01-w10-VN.png
18K Oct 16 16:56 bp_avMED-RS01-w10-VF.png
18K Oct 16 16:56 bp_avMED-RS01-w10-VN.png
```

at `/home/ai/github/phd-thesis/figs/results/utde/minimum_embedding_parameters/cao/v05`






