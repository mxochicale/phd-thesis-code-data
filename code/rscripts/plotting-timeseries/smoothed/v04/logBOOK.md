

# code
/home/ai/github/phd-thesis-code-data/code/rscripts/plotting-timeseries/smoothed/v04 

#output
/home/ai/github/phd-thesis/figs/results/smoothed-timeseries/v04 




#vertical

1. `A_dataset.R`

```
#xpa <- xdata[,.(
#	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
#	), by=. (Participant,Activity,Sensor,Sample)]
xpa <- xdata[,.(
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY
	), by=. (Participant,Activity,Sensor,Sample)]

```
2. `B_timeseries.R`

```
#movementtag <- 'H' 
#setkey(wkdata, Activity)
#awkdata <- wkdata[.(c('HN', 'HF'))]
movementtag <- 'V' 
setkey(wkdata, Activity)
awkdata <- wkdata[.(c('VN', 'VF'))]

```


 

#horizontal


1. `A_dataset.R`

```
xpa <- xdata[,.(
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]
#xpa <- xdata[,.(
#	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY
#	), by=. (Participant,Activity,Sensor,Sample)]
#
```


2. `B_timeseries.R`

```
movementtag <- 'H' 
setkey(wkdata, Activity)
awkdata <- wkdata[.(c('HN', 'HF'))]
#movementtag <- 'V' 
#setkey(wkdata, Activity)
#awkdata <- wkdata[.(c('VN', 'VF'))]
```






