


# `> source(paste(getwd(), "/A_dataset.R", sep=""), echo=TRUE)`

```
xpa <- xdata[,.(
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]
```


# `> source(paste(getwd(), "/B_cao.R", sep=""), echo=TRUE)`

```

#########################
#### one window lenght
windowsl <- c(100)
windowsn <- c('w2')


###########################
##### four window lenghts
#windowsl <- c(100,   250,  500,   750)
#windowsn <- c('w2', 'w5', 'w10', 'w15')



##########################
## (4.2.1) Activities Selection
#movement_variables <- c('HN','HF')
#movement_variables <- c('VN','VF')
movement_variables <- c('HN', 'HF', 'VN', 'VF')



```

computation time for time series with four windows 
```
> end.time - start.time
Time difference of 30.56192 mins
```


computation time for time series with 100sample window
```
Time difference of 51.67624 secs
```




#  `> source(paste(getwd(), "/CA_cao_mm_H.R", sep=""), echo=TRUE)`

```
acts <- 'H'
windowl<-'w2'
wdata <- fread('MED-w2.dt', header=TRUE)

#
#acts <- 'H'
#windowl<-'w5'
#wdata <- fread('MED-w5.dt', header=TRUE)
#
#acts <- 'H'
#windowl<-'w10'
#wdata <- fread('MED-w10.dt', header=TRUE)
#
#acts <- 'H'
#windowl<-'w15'
#wdata <- fread('MED-w15.dt', header=TRUE)
```





# `> source(paste(getwd(), "/CB_cao_mm_V.R", sep=""), echo=TRUE)`


comment and uncomment the following lines of code
```
acts <- 'V'
windowl<-'w2'
wdata <- fread('MED-w2.dt', header=TRUE)

#
#acts <- 'V'
#windowl<-'w5'
#wdata <- fread('MED-w5.dt', header=TRUE)
#
#acts <- 'V'
#windowl<-'w10'
#wdata <- fread('MED-w10.dt', header=TRUE)
#
#acts <- 'V'
#windowl<-'w15'
#wdata <- fread('MED-w15.dt', header=TRUE)
```





# `> source(paste(getwd(), "/DA_plotcao_E1E2_allMED_H.R", sep=""), echo=TRUE)`

```
windowl<-'w2'
aMED <- fread('aMED-H-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)
```


# `> source(paste(getwd(), "/DB_plotcao_E1E2_allMED_V.R", sep=""), echo=TRUE)`


```
windowl<-'w2'
aMED <- fread('aMED-V-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)
```

*Warning message:*
```
Removed 1 rows containing missing values (geom_point). 
```




# `> source(paste(getwd(), "/EA_plotcao_avMED_H.R", sep=""), echo=TRUE)`

```
windowl<-'w2'
aMED <- fread('aMED-H-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)


#windowl<-'w5'
#aMED <- fread('aMED-H-w5.dt', header=TRUE)
#MED <- fread('MED-w5.dt', header=TRUE)
#EE <- fread('EE-w5.dt', header=TRUE)
#

#windowl<-'w10'
#aMED <- fread('aMED-H-w10.dt', header=TRUE)
#MED <- fread('MED-w10.dt', header=TRUE)
#EE <- fread('EE-w10.dt', header=TRUE)
#

#windowl<-'w15'
#aMED <- fread('aMED-H-w15.dt', header=TRUE)
#MED <- fread('MED-w15.dt', header=TRUE)
#EE <- fread('EE-w15.dt', header=TRUE)
```







# `> source(paste(getwd(), "/EB_plotcao_avMED_V.R", sep=""), echo=TRUE)`


```
windowl<-'w2'
aMED <- fread('aMED-V-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)


#windowl<-'w5'
#aMED <- fread('aMED-V-w5.dt', header=TRUE)
#MED <- fread('MED-w5.dt', header=TRUE)
#EE <- fread('EE-w5.dt', header=TRUE)
#

#windowl<-'w10'
#aMED <- fread('aMED-V-w10.dt', header=TRUE)
#MED <- fread('MED-w10.dt', header=TRUE)
#EE <- fread('EE-w10.dt', header=TRUE)
#

#windowl<-'w15'
#aMED <- fread('aMED-V-w15.dt', header=TRUE)
#MED <- fread('MED-w15.dt', header=TRUE)
#EE <- fread('EE-w15.dt', header=TRUE)
```








