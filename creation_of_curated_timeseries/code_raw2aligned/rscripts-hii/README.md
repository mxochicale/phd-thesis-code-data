r-scripts for Human-Image Imitation (hii)
---


# Creating and setting up the raw data into aligned data

## 1. Generate aligned data
`/mscripts/hii_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux.m`
which creates this output path: `/home/map479/tmp/phdtmpdata/hii_time_aligned_timeseries`

```
$ tree -d
.
├── p01
│   └── p01-HII
├── p02
│   └── p02-HII
├── p06
│   └── p06-HII
├── p07
│   └── p07-HII
├── p08
│   └── p08-HII
├── p09
│   └── p09-HII
├── p10
│   └── p10-HII
├── p11
│   └── p11-HII
├── p13
│   └── p13-HII
├── p14
│   └── p14-HII
├── p15
│   └── p15-HII
├── p16
│   └── p16-HII
├── p17
│   └── p17-HII
├── p18
│   └── p18-HII
├── p19
│   └── p19-HII
├── p21
│   └── p21-HII
└── p22
    └── p22-HII

34 directories

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
```
at

`/home/map479/tmp/phdtmpdata/outcomes/preProcessedDataTable_p01_to_p22`







## 3. Create only raw data for AccX AccY AccZ GyroX GyroY GyroZ for HS01 and RS01
`source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22.R", sep=""), echo=TRUE)`


* names of xdata object for 'hii-TidiedInterpolatedTHENpreprocessedData.dt'


```
> names(xdata)
 [1] "Participant" "Activity"    "Sensor"      "Sample"      "AccX"       
 [6] "AccY"        "AccZ"        "GyroX"       "GyroY"       "GyroZ"      
> head(xdata)


```

`/home/map479/mxochicale/github/phd-thesis-code-data/timeseries/hii`

```

```





