r-scripts for Human-Image Imitation (hii)
---


# Creating and setting up the raw data into aligned data

## 1. Generate aligned data
`/mscripts/hii_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux.m`
which creates this output path: `/home/USERNAME/tmp/phdtmpdata/hii_time_aligned_timeseries`

```
~/tmp/phdtmpdata/hii_time_aligned_timeseries$ tree -d
.
├── p01-HII
├── p02-HII
├── p06-HII
├── p07-HII
├── p08-HII
├── p09-HII
├── p10-HII
├── p11-HII
├── p13-HII
├── p14-HII
├── p15-HII
├── p16-HII
├── p17-HII
├── p18-HII
├── p19-HII
├── p21-HII
└── p22-HII

17 directories


```



## 2. Generating data.table files

```
cd ../code_raw2aligned/rscripts-hii/
R
```


## Create 'hii-TidiedInterpolatedData.datatable'

Run `source(paste(getwd(),"/BA_creating_TidiedInterpolatedDATA_p01p22.R", sep=""), echo=TRUE)`
which creates
```
246M Aug 28 19:07 hii-TidiedInterpolatedData.datatable
246M Aug 29 14:34 hii-TidiedInterpolatedData.datatable
```
at

`/home/map479/tmp/phdtmpdata/outcomes/preProcessedDataTable_p01_to_p22`







## 3. Create only raw data for AccX AccY AccZ GyroX GyroY GyroZ for HS01 and RS01

Run four times 
`source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22.R", sep=""), echo=TRUE)`


which generate four data table objects for each of the sensors, having the following
names and heading

```

> names(xdata)
 [1] "Participant" "Activity"    "Sensor"      "Sample"      "AccX"       
 [6] "AccY"        "AccZ"        "GyroX"       "GyroY"       "GyroZ"      
> head(xdata)
   Participant Activity Sensor Sample      AccX      AccY      AccZ      GyroX
1:         p01     HNnb   HS01      1 -83.00000 -350.0000 -917.0000 -0.8750000
2:         p01     HNnb   HS01      2 -80.00924 -349.9962 -916.9986 -1.6246964
3:         p01     HNnb   HS01      3 -73.99445 -350.0166 -918.0011 -1.5014525
4:         p01     HNnb   HS01      4 -78.99232 -339.0045 -917.0000 -0.9989654
5:         p01     HNnb   HS01      5 -78.01218 -348.9853 -917.0000 -2.1216285
6:         p01     HNnb   HS01      6 -76.98702 -341.0478 -917.0000 -2.1893038
      GyroY    GyroZ
1: 2.812500 1.562500
2: 2.937488 1.312823
3: 2.937420 1.311597
4: 3.062265 1.812952
5: 2.688194 1.562912
6: 2.563188 1.562229


```
Then comment and uncomment the following lines to generate the data table for four sensors


```
#xdata <- xdata[.(c('HS01'))]
#xdata <- xdata[.(c('HS02'))]
#xdata <- xdata[.(c('HS03'))]
xdata <- xdata[.(c('HS04'))]

################################################################################
####  (5)  Writing Data
#write.table(xdata, "hii-HS01-TidiedInterpolatedRawData.dt", row.name=FALSE)
#write.table(xdata, "hii-HS02-TidiedInterpolatedRawData.dt", row.name=FALSE)
#write.table(xdata, "hii-HS03-TidiedInterpolatedRawData.dt", row.name=FALSE)
write.table(xdata, "hii-HS04-TidiedInterpolatedRawData.dt", row.name=FALSE)
```


output path:
`~/github/phd-thesis-code-data/data-outputs/raw-timeseries/hii`



Files:
```

27M Sep 22 16:47 hii-HS01-TidiedInterpolatedRawData.dt
31M Sep 22 16:49 hii-HS02-TidiedInterpolatedRawData.dt
28M Sep 22 16:50 hii-HS03-TidiedInterpolatedRawData.dt
32M Sep 22 16:51 hii-HS04-TidiedInterpolatedRawData.dt

```





