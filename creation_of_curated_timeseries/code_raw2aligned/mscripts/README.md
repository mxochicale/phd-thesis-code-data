rawData_TO_TimeAlignedDataForSeparateActivitiesNN_p01_to_p22_octave_linux
---

# Setting Up Paths

Set the paths where data is going to be saved and
check carefully where does the following paths are well defined.
```
cd ..;
cd ..;
main_path = pwd;
cd ..;
cd ..;
cd ..;
user_path = pwd;


data_path='/data_raw_p01-p22'
tmpdatapath='/tmp/phdtmpdata';
```


# Usage

## 1. create /tmp for data output
```
cd && mkdir -p tmp/phdtmpdata
```

## 2. Open a new terminal to run octave
```
octave --no-gui
```

Then run the m script:

```
hri_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux
```

output

```
data_path = /data_raw_p01-p22
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p01-HRI//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p02-HRI//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p03-HRI//')
  [2,1] = 0
}
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0
ans = 0


```



## 3. outcome data path


```
/home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux 
```

```
:~/tmp/phdtmpdata$ tree -d
.
└── time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux
    ├── p01-HRI
    ├── p02-HRI
    ├── p03-HRI
    ├── p04-HRI
    ├── p05-HRI
    ├── p06-HRI
    ├── p07-HRI
    ├── p08-HRI
    ├── p09-HRI
    ├── p10-HRI
    ├── p11-HRI
    ├── p12-HRI
    ├── p13-HRI
    ├── p14-HRI
    ├── p15-HRI
    ├── p16-HRI
    ├── p17-HRI
    ├── p18-HRI
    ├── p19-HRI
    ├── p20-HRI
    ├── p21-HRI
    └── p22-HRI

23 directories


```











# HII

## 1. create /tmp for data output
```
cd && mkdir -p tmp/phdtmpdata
```

## 2. Open a new terminal to run octave
```
octave --no-gui
```

Then run the m script:

```
hii_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux
```

output

```

octave:1> hii_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p01-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p02-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p06-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p07-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p08-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p09-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p10-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p11-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p13-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p14-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p15-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p16-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p17-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p18-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p19-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p21-HII//')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/ai/tmp/phdtmpdata/hii_time_aligned_timeseries/p22-HII//')
  [2,1] = 0
}



```



## 3. outcome data path


```
/home/ai/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux 
```
output

```
$ tree -d
.
├── hii_time_aligned_timeseries
│   ├── p01-HII
│   ├── p02-HII
│   ├── p06-HII
│   ├── p07-HII
│   ├── p08-HII
│   ├── p09-HII
│   ├── p10-HII
│   ├── p11-HII
│   ├── p13-HII
│   ├── p14-HII
│   ├── p15-HII
│   ├── p16-HII
│   ├── p17-HII
│   ├── p18-HII
│   ├── p19-HII
│   ├── p21-HII
│   └── p22-HII




```








octave --no-gui
readrawdataHII_labels
```

tunnig labels start and stop points:
```
vim labels_p01-p22_HII.txt 
```

When testing, be sure to change the lines for the row lines of starts and ends of the particpant:

```
p16_labels = labels(121:128,:);
```

```
octave --no-gui
readrawdataHII
```





## creating the separatged asctivies per participatns in 
`/home/map479/tmp/phdtmpdata/hii_time_aligned_timeseries`


```
octave --no-gui
hii_rawData_TO_TimeAlignedDataForSeparateActivities_p01_to_p22_octave_linux
```



data status

p01 data OK, aligment OK 
p02 data OK, aligment OK
p03 DISCARTED (s01 did not stream data)
p04 DISCARTED (s01 data is shifted)
p05 DISCARTED (s02 IS NOT COMPLETED)
p06 data OK, aligment OK (excpet for activity07)
p07 data OK, aligment OK
p08 data OK, aligment OK
p09 data OK, aligment OK
p10 data OK, aligment OK
p11 data OK, aligment OK
p12 DISCARTED data OK, aligment WRONG
p13 data OK, aligment OK
p14 data OK, aligment OK
p15 data OK, aligment OK
p16 data OK, aligment OK
p17 data OK, aligment OK
p18 data OK, aligment OK
p19 data OK, aligment OK
p20 DISCARTED data WRONG (s01 not completed)
p21 data OK, aligment SEMIOK (s02 is not well aligned)
p22 data OK, aligment SEMIOK (a07 is very shifted)

Fri 24 Aug 01:23:56 BST 2018





