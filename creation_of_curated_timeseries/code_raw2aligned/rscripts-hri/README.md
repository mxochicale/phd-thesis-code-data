r-scripts
---


# Creating and setting up the raw data into aligned data

1. Generate aligned data with `/mscripts/rawData_TO_TimeAlignedDataForSeparateActivities15_p01_to_p22_octave_linux.m`
which creates this output path:
`/home/map479/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux`

```
$ tree -d
.
├── p01
│   └── p01-HRI
├── p02
│   └── p02-HRI


├── p21
│   └── p21-HRI
└── p22
    └── p22-HRI
```


# Generating data.table files

```
cd .../code_raw2aligned/rscripts-hri
R
```


## 2. Create 'TidiedInterpolatedData.datatable'
`source(paste(getwd(),"/BA_creating_TidiedInterpolatedDATA_p01p22.R", sep=""), echo=TRUE)`

```
/home/map479/tmp/phdtmpdata/outcomes/preProcessedDataTable_p01_to_p22 
158M Jul 27 11:01 TidiedInterpolatedData.datatable
```



## 3. Create only raw data for AccX AccY AccZ GyroX GyroY GyroZ for HS01 and RS01
`source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v06.R", sep=""), echo=TRUE)`


* names of xdata object for 'TidiedInterpolatedTHENpreprocessedData-v06.dt'
```
> names(xdata)
 [1] "Participant" "Activity"    "Sensor"      "Sample"      "AccX"       
 [6] "AccY"        "AccZ"        "GyroX"       "GyroY"       "GyroZ"      
> head(xdata)
   Participant Activity Sensor Sample      AccX        AccY      AccZ
1:         p01       HN   HS01      1 -1.000000  4.00000000 -978.0000
2:         p01       HN   HS01      2 -3.994159  6.08593402 -981.7004
3:         p01       HN   HS01      3 -3.051809  0.05725664 -991.3705
4:         p01       HN   HS01      4 -1.921741  2.71938601 -969.3355
5:         p01       HN   HS01      5 -6.917193  5.22073518 -971.6132
6:         p01       HN   HS01      6  2.505496 -1.94244414 -975.2334
        GyroX    GyroY    GyroZ
1: -2.2500000 3.062500 1.937500
2: -2.1778894 2.549903 2.007128
3: -2.2152526 3.313847 1.499128
4: -0.7921632 3.185006 1.562309
5: -0.6829491 3.540080 1.505756
6: -0.6333563 3.374851 1.436897
```



`/home/map479/mxochicale/github/phd-thesis-code-data/timeseries/hri`
```
$ls -l	
	-rw-rw-r-- 1 map479 map479 39876955 Jul 27 12:02 TidiedInterpolatedRawData-v06.dt
```




















## Other files





## names of xdata object for 'TidiedInterpolatedTHENpreprocessedData-v05.datatable'


source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v05.R", sep=""), echo=TRUE) # without low-high/freqs filtering but different smoothness of data

* `ls -l`:
	`-rw-rw-r--  1 map479 map479  716125034 May 25 15:19 TidiedInterpolatedTHENpreprocessedData-v05.datatable`

```
> names(xdata)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "Timestamp"   
 [6] "AccX"         "AccY"         "AccZ"         "GyroX"        "GyroY"       
[11] "GyroZ"        "zmuvAccX"     "zmuvAccY"     "zmuvAccZ"     "zmuvGyroX"   
[16] "zmuvGyroY"    "zmuvGyroZ"    "sg1AccX"      "sg1AccY"      "sg1AccZ"     
[21] "sg1GyroX"     "sg1GyroY"     "sg1GyroZ"     "sg1zmuvAccX"  "sg1zmuvAccY" 
[26] "sg1zmuvAccZ"  "sg1zmuvGyroX" "sg1zmuvGyroY" "sg1zmuvGyroZ" "sg2AccX"     
[31] "sg2AccY"      "sg2AccZ"      "sg2GyroX"     "sg2GyroY"     "sg2GyroZ"    
[36] "sg2zmuvAccX"  "sg2zmuvAccY"  "sg2zmuvAccZ"  "sg2zmuvGyroX" "sg2zmuvGyroY"
[41] "sg2zmuvGyroZ" "sg3AccX"      "sg3AccY"      "sg3AccZ"      "sg3GyroX"    
[46] "sg3GyroY"     "sg3GyroZ"     "sg3zmuvAccX"  "sg3zmuvAccY"  "sg3zmuvAccZ" 
[51] "sg3zmuvGyroX" "sg3zmuvGyroY" "sg3zmuvGyroZ" "sg4AccX"      "sg4AccY"     
[56] "sg4AccZ"      "sg4GyroX"     "sg4GyroY"     "sg4GyroZ"     "sg4zmuvAccX" 
[61] "sg4zmuvAccY"  "sg4zmuvAccZ"  "sg4zmuvGyroX" "sg4zmuvGyroY" "sg4zmuvGyroZ"

```

## source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v04.R", sep=""), echo=TRUE) # with lfzmuv hfzmuv lfsgzmuv hfsgzmuv and HS01,...,RS02

* 20 Participants: TidiedInterpolatedTHENpreprocessedData-v04.datatable,  ~2.1GB # " "


## names of xdata object for 'TidiedInterpolatedTHENpreprocessedData-v03.datatable'

source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v03.R", sep=""), echo=TRUE) # with lfzmuv hfzmuv lfsgzmuv hfsgzmuv   

* 20 Participants: TidiedInterpolatedTHENpreprocessedData-v03.datatable,  ~2.1GB # with sg-zmuv lf hf for zmuv and sgzmuv data (~v03.R)

```
> names(xdata)
  [1] "Participant"   "Activity"      "Sensor"        "Sample"       
  [5] "Timestamp"     "AccX"          "AccY"          "AccZ"         
  [9] "MagnX"         "MagnY"         "MagnZ"         "GyroX"        
 [13] "GyroY"         "GyroZ"         "qW"            "qX"           
 [17] "qY"            "qZ"            "Amag"          "Gmag"         
 [21] "Mmag"          "pc1_Acc"       "pc2_Acc"       "pc3_Acc"      
 [25] "zmuvAccX"      "zmuvAccY"      "zmuvAccZ"      "zmuvMagnX"    
 [29] "zmuvMagnY"     "zmuvMagnZ"     "zmuvGyroX"     "zmuvGyroY"    
 [33] "zmuvGyroZ"     "zmuvqW"        "zmuvqX"        "zmuvqY"       
 [37] "zmuvqZ"        "zmuvAmag"      "zmuvGmag"      "zmuvMmag"     
 [41] "sgAccX"        "sgAccY"        "sgAccZ"        "sgMagnX"      
 [45] "sgMagnY"       "sgMagnZ"       "sgGyroX"       "sgGyroY"      
 [49] "sgGyroZ"       "sgqW"          "sgqX"          "sgqY"         
 [53] "sgqZ"          "sgAmag"        "sgGmag"        "sgMmag"       
 [57] "sgpc1_Acc"     "sgpc2_Acc"     "sgpc3_Acc"     "sgzmuvAccX"   
 [61] "sgzmuvAccY"    "sgzmuvAccZ"    "sgzmuvMagnX"   "sgzmuvMagnY"  
 [65] "sgzmuvMagnZ"   "sgzmuvGyroX"   "sgzmuvGyroY"   "sgzmuvGyroZ"  
 [69] "sgzmuvqW"      "sgzmuvqX"      "sgzmuvqY"      "sgzmuvqZ"     
 [73] "sgzmuvAmag"    "sgzmuvGmag"    "sgzmuvMmag"    "lfAccX"       
 [77] "lfAccY"        "lfAccZ"        "lfMagnX"       "lfMagnY"      
 [81] "lfMagnZ"       "lfGyroX"       "lfGyroY"       "lfGyroZ"      
 [85] "lfqW"          "lfqX"          "lfqY"          "lfqZ"         
 [89] "lfAmag"        "lfGmag"        "lfMmag"        "lfpc1_Acc"    
 [93] "lfpc2_Acc"     "lfpc3_Acc"     "lfsgAccX"      "lfsgAccY"     
 [97] "lfsgAccZ"      "lfsgMagnX"     "lfsgMagnY"     "lfsgMagnZ"    
[101] "lfsgGyroX"     "lfsgGyroY"     "lfsgGyroZ"     "lfsgqW"       
[105] "lfsgqX"        "lfsgqY"        "lfsgqZ"        "lfsgAmag"     
[109] "lfsgGmag"      "lfsgMmag"      "lfsgpc1_Acc"   "lfsgpc2_Acc"  
[113] "lfsgpc3_Acc"   "lfzmuvAccX"    "lfzmuvAccY"    "lfzmuvAccZ"   
[117] "lfzmuvMagnX"   "lfzmuvMagnY"   "lfzmuvMagnZ"   "lfzmuvGyroX"  
[121] "lfzmuvGyroY"   "lfzmuvGyroZ"   "lfsgzmuvAccX"  "lfsgzmuvAccY" 
[125] "lfsgzmuvAccZ"  "lfsgzmuvMagnX" "lfsgzmuvMagnY" "lfsgzmuvMagnZ"
[129] "lfsgzmuvGyroX" "lfsgzmuvGyroY" "lfsgzmuvGyroZ" "hfAccX"       
[133] "hfAccY"        "hfAccZ"        "hfMangX"       "hfMangY"      
[137] "hfMangZ"       "hfGyroX"       "hfGyroY"       "hfGyroZ"      
[141] "hfqW"          "hfqX"          "hfqY"          "hfqZ"         
[145] "hfAmag"        "hfGmag"        "hfMmag"        "hfpc1_Acc"    
[149] "hfpc2_Acc"     "hfpc3_Acc"     "hfsgAccX"      "hfsgAccY"     
[153] "hfsgAccZ"      "hfsgMagnX"     "hfsgMagnY"     "hfsgMagnZ"    
[157] "hfsgGyroX"     "hfsgGyroY"     "hfsgGyroZ"     "hfsgqW"       
[161] "hfsgqX"        "hfsgqY"        "hfsgqZ"        "hfsgAmag"     
[165] "hfsgGmag"      "hfsgMmag"      "hfsgpc1_Acc"   "hfsgpc2_Acc"  
[169] "hfsgpc3_Acc"   "hfzmuvAccX"    "hfzmuvAccY"    "hfzmuvAccZ"   
[173] "hfzmuvMagnX"   "hfzmuvMagnY"   "hfzmuvMagnZ"   "hfzmuvGyroX"  
[177] "hfzmuvGyroY"   "hfzmuvGyroZ"   "hfsgzmuvAccX"  "hfsgzmuvAccY" 
[181] "hfsgzmuvAccZ"  "hfsgzmuvMagnX" "hfsgzmuvMagnY" "hfsgzmuvMagnZ"
[185] "hfsgzmuvGyroX" "hfsgzmuvGyroY" "hfsgzmuvGyroZ"
> 
```





## names of xdata object for 'TidiedInterpolatedTHENpreprocessedData-v02.datatable'

source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v02.R", sep=""), echo=TRUE) # with sgzmuv data

* 20 Participants: TidiedInterpolatedTHENpreprocessedData-v02.datatable,  ~1.7GB # with sg-zmuv data (~v02.R)

```
> names(xdata)
  [1] "Participant"  "Activity"     "Sensor"       "Sample"       "Timestamp"   
  [6] "AccX"         "AccY"         "AccZ"         "MagnX"        "MagnY"       
 [11] "MagnZ"        "GyroX"        "GyroY"        "GyroZ"        "qW"          
 [16] "qX"           "qY"           "qZ"           "Amag"         "Gmag"        
 [21] "Mmag"         "pc1_Acc"      "pc2_Acc"      "pc3_Acc"      "zmuvAccX"    
 [26] "zmuvAccY"     "zmuvAccZ"     "zmuvMagnX"    "zmuvMagnY"    "zmuvMagnZ"   
 [31] "zmuvGyroX"    "zmuvGyroY"    "zmuvGyroZ"    "zmuvqW"       "zmuvqX"      
 [36] "zmuvqY"       "zmuvqZ"       "zmuvAmag"     "zmuvGmag"     "zmuvMmag"    
 [41] "sgAccX"       "sgAccY"       "sgAccZ"       "sgMagnX"      "sgMagnY"     
 [46] "sgMagnZ"      "sgGyroX"      "sgGyroY"      "sgGyroZ"      "sgqW"        
 [51] "sgqX"         "sgqY"         "sgqZ"         "sgAmag"       "sgGmag"      
 [56] "sgMmag"       "sgpc1_Acc"    "sgpc2_Acc"    "sgpc3_Acc"    "sgzmuvAccX" 
 [61] "sgzmuvAccY"   "sgzmuvAccZ"   "sgzmuvMagnX"  "sgzmuvMagnY"  "sgzmuvMagnZ"
 [66] "sgzmuvGyroX"  "sgzmuvGyroY"  "sgzmuvGyroZ"  "sgzmuvqW"     "sgzmuvqX"   
 [71] "sgzmuvqY"     "sgzmuvqZ"     "sgzmuvAmag"   "sgzmuvGmag"   "sgzmuvMmag" 
 [76] "lAccX"        "lAccY"        "lAccZ"        "lMagnX"       "lMagnY"      
 [81] "lMagnZ"       "lGyroX"       "lGyroY"       "lGyroZ"       "lqW"         
 [86] "lqX"          "lqY"          "lqZ"          "lAmag"        "lGmag"       
 [91] "lMmag"        "lpc1_Acc"     "lpc2_Acc"     "lpc3_Acc"     "lsgAccX"     
 [96] "lsgAccY"      "lsgAccZ"      "lsgMagnX"     "lsgMagnY"     "lsgMagnZ"    
[101] "lsgGyroX"     "lsgGyroY"     "lsgGyroZ"     "lsgqW"        "lsgqX"       
[106] "lsgqY"        "lsgqZ"        "lsgAmag"      "lsgGmag"      "lsgMmag"     
[111] "lsgpc1_Acc"   "lsgpc2_Acc"   "lsgpc3_Acc"   "hAccX"        "hAccY"       
[116] "hAccZ"        "hMangX"       "hMangY"       "hMangZ"       "hGyroX"      
[121] "hGyroY"       "hGyroZ"       "hqW"          "hqX"          "hqY"         
[126] "hqZ"          "hAmag"        "hGmag"        "hMmag"        "hpc1_Acc"    
[131] "hpc2_Acc"     "hpc3_Acc"     "hsgAccX"      "hsgAccY"      "hsgAccZ"     
[136] "hsgMagnX"     "hsgMagnY"     "hsgMagnZ"     "hsgGyroX"     "hsgGyroY"    
[141] "hsgGyroZ"     "hsgqW"        "hsgqX"        "hsgqY"        "hsgqZ"       
[146] "hsgAmag"      "hsgGmag"      "hsgMmag"      "hsgpc1_Acc"   "hsgpc2_Acc"  
[151] "hsgpc3_Acc"
```


## names of xdata object for 'TidiedInterpolatedTHENpreprocessedData_01.datatable'

source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v01.R", sep=""), echo=TRUE) # with zmuv data

* 20 Participants: TidiedInterpolatedTHENpreprocessedData_01.datatable,   ~1.568GB  # with zmuv data (~v01.R)
```
> names(xdata)
  [1] "Participant" "Activity"    "Sensor"      "Sample"      "Timestamp"  
  [6] "AccX"        "AccY"        "AccZ"        "MagnX"       "MagnY"      
 [11] "MagnZ"       "GyroX"       "GyroY"       "GyroZ"       "qW"         
 [16] "qX"          "qY"          "qZ"          "Amag"        "Gmag"       
 [21] "Mmag"        "pc1_Acc"     "pc2_Acc"     "pc3_Acc"     "zmuvAccX"   
 [26] "zmuvAccY"    "zmuvAccZ"    "zmuvMagnX"   "zmuvMagnY"   "zmuvMagnZ"  
 [31] "zmuvGyroX"   "zmuvGyroY"   "zmuvGyroZ"   "zmuvqW"      "zmuvqX"     
 [36] "zmuvqY"      "zmuvqZ"      "zmuvAmag"    "zmuvGmag"    "zmuvMmag"   
 [41] "sgAccX"      "sgAccY"      "sgAccZ"      "sgMagnX"     "sgMagnY"    
 [46] "sgMagnZ"     "sgGyroX"     "sgGyroY"     "sgGyroZ"     "sgqW"       
 [51] "sgqX"        "sgqY"        "sgqZ"        "sgAmag"      "sgGmag"     
 [56] "sgMmag"      "sgpc1_Acc"   "sgpc2_Acc"   "sgpc3_Acc"   "lAccX"      
 [61] "lAccY"       "lAccZ"       "lMagnX"      "lMagnY"      "lMagnZ"     
 [66] "lGyroX"      "lGyroY"      "lGyroZ"      "lqW"         "lqX"        
 [71] "lqY"         "lqZ"         "lAmag"       "lGmag"       "lMmag"      
 [76] "lpc1_Acc"    "lpc2_Acc"    "lpc3_Acc"    "lsgAccX"     "lsgAccY"    
 [81] "lsgAccZ"     "lsgMagnX"    "lsgMagnY"    "lsgMagnZ"    "lsgGyroX"   
 [86] "lsgGyroY"    "lsgGyroZ"    "lsgqW"       "lsgqX"       "lsgqY"      
 [91] "lsgqZ"       "lsgAmag"     "lsgGmag"     "lsgMmag"     "lsgpc1_Acc"
 [96] "lsgpc2_Acc"  "lsgpc3_Acc"  "hAccX"       "hAccY"       "hAccZ"      
[101] "hMangX"      "hMangY"      "hMangZ"      "hGyroX"      "hGyroY"     
[106] "hGyroZ"      "hqW"         "hqX"         "hqY"         "hqZ"        
[111] "hAmag"       "hGmag"       "hMmag"       "hpc1_Acc"    "hpc2_Acc"   
[116] "hpc3_Acc"    "hsgAccX"     "hsgAccY"     "hsgAccZ"     "hsgMagnX"   
[121] "hsgMagnY"    "hsgMagnZ"    "hsgGyroX"    "hsgGyroY"    "hsgGyroZ"   
[126] "hsgqW"       "hsgqX"       "hsgqY"       "hsgqZ"       "hsgAmag"    
[131] "hsgGmag"     "hsgMmag"     "hsgpc1_Acc"  "hsgpc2_Acc"  "hsgpc3_Acc"
```



```
source(paste(getwd(),"/BA_creating_TidiedInterpolatedDATA_p01p22.R", sep=""), echo=TRUE)
source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v00.R", sep=""), echo=TRUE)
```

##  Data size for

* 06 Participants: TidiedInterpolatedTHENpreprocessedData.datatable,      ~405MB
* 20 Participants: TidiedInterpolatedTHENpreprocessedData.datatable,      ~1.371GB 


