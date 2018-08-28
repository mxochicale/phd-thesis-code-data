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
cd ..;
user_path = pwd;


data_path='/data_raw_p01-p22'
tmpdatapath='/tmp/phdtmpdata';
```


# Usage

## 1. create /tmp for data output
```
cd && mkdir -p /tmp/phdtmpdata
```

## 2. Open a new terminal to run octave
```
octave --no-gui
```

Then run the m script:

```
rawData_TO_TimeAlignedDataForSeparateActivities16_p01_to_p22_octave_linux
```

output

```
>> RawData_TO_TimeAlignedDataForSeparateActivities16_p01_to_p22_octave_linux
ans = 
{
  [1,1] = system( 'mkdir -p /home/map479/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p02/p02-HRI/')
  [2,1] = 0
}
ans = 
{
  [1,1] = system( 'mkdir -p /home/map479/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux/p03/p03-HRI/')
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




## 3. Testing the data by plotting it
To test the data from the previous script, you can run this command:

## Plotting data for activity 03
```
octave --no-gui
RawData_TO_TimeAlignedDataForSeparateActivities15_p01_to_p22_octave_linux


subplot(211),plot(ns01_p01_a3(:,8:10)), grid, subplot(212),plot(ns03_p01_a3(:,8:10)), grid
subplot(211),plot(ns01_p02_a3(:,8:10)), grid, subplot(212),plot(ns03_p02_a3(:,8:10)), grid
subplot(211),plot(ns01_p03_a3(:,8:10)), grid, subplot(212),plot(ns03_p03_a3(:,8:10)), grid
subplot(211),plot(ns01_p04_a3(:,8:10)), grid, subplot(212),plot(ns03_p04_a3(:,8:10)), grid
subplot(211),plot(ns01_p05_a3(:,8:10)), grid, subplot(212),plot(ns03_p05_a3(:,8:10)), grid
subplot(211),plot(ns01_p06_a3(:,8:10)), grid, subplot(212),plot(ns03_p06_a3(:,8:10)), grid
subplot(211),plot(ns01_p07_a3(:,8:10)), grid, subplot(212),plot(ns03_p07_a3(:,8:10)), grid
subplot(211),plot(ns01_p08_a3(:,8:10)), grid, subplot(212),plot(ns03_p08_a3(:,8:10)), grid
subplot(211),plot(ns01_p09_a3(:,8:10)), grid, subplot(212),plot(ns03_p09_a3(:,8:10)), grid
subplot(211),plot(ns01_p10_a3(:,8:10)), grid, subplot(212),plot(ns03_p10_a3(:,8:10)), grid
subplot(211),plot(ns01_p11_a3(:,8:10)), grid, subplot(212),plot(ns03_p11_a3(:,8:10)), grid
subplot(211),plot(ns01_p12_a3(:,8:10)), grid, subplot(212),plot(ns03_p12_a3(:,8:10)), grid
subplot(211),plot(ns01_p13_a3(:,8:10)), grid, subplot(212),plot(ns03_p13_a3(:,8:10)), grid
subplot(211),plot(ns01_p14_a3(:,8:10)), grid, subplot(212),plot(ns03_p14_a3(:,8:10)), grid
subplot(211),plot(ns01_p15_a3(:,8:10)), grid, subplot(212),plot(ns03_p15_a3(:,8:10)), grid
[x] subplot(211),plot(ns01_p16_a3(:,8:10)), grid, subplot(212),plot(ns03_p16_a3(:,8:10)), grid
subplot(211),plot(ns01_p17_a3(:,8:10)), grid, subplot(212),plot(ns03_p17_a3(:,8:10)), grid
subplot(211),plot(ns01_p18_a3(:,8:10)), grid, subplot(212),plot(ns03_p18_a3(:,8:10)), grid
subplot(211),plot(ns01_p19_a3(:,8:10)), grid, subplot(212),plot(ns03_p19_a3(:,8:10)), grid
subplot(211),plot(ns01_p20_a3(:,8:10)), grid, subplot(212),plot(ns03_p20_a3(:,8:10)), grid
subplot(211),plot(ns01_p21_a3(:,8:10)), grid, subplot(212),plot(ns03_p21_a3(:,8:10)), grid
subplot(211),plot(ns01_p22_a3(:,8:10)), grid, subplot(212),plot(ns03_p22_a3(:,8:10)), grid
```
[x] No syncrohised data



 Plotting data for activity 04
```
octave --no-gui
RawData_TO_TimeAlignedDataForSeparateActivities15_p01_to_p22_octave_linux


subplot(211),plot(ns01_p01_a4(:,8:10)), grid, subplot(212),plot(ns03_p01_a4(:,8:10)), grid
subplot(211),plot(ns01_p02_a4(:,8:10)), grid, subplot(212),plot(ns03_p02_a4(:,8:10)), grid
subplot(211),plot(ns01_p03_a4(:,8:10)), grid, subplot(212),plot(ns03_p03_a4(:,8:10)), grid
subplot(211),plot(ns01_p04_a4(:,8:10)), grid, subplot(212),plot(ns03_p04_a4(:,8:10)), grid
subplot(211),plot(ns01_p05_a4(:,8:10)), grid, subplot(212),plot(ns03_p05_a4(:,8:10)), grid
subplot(211),plot(ns01_p06_a4(:,8:10)), grid, subplot(212),plot(ns03_p06_a4(:,8:10)), grid

subplot(211),plot(ns01_p07_a4(:,8:10)), grid, subplot(212),plot(ns03_p07_a4(:,8:10)), grid
subplot(211),plot(ns01_p08_a4(:,8:10)), grid, subplot(212),plot(ns03_p08_a4(:,8:10)), grid
subplot(211),plot(ns01_p09_a4(:,8:10)), grid, subplot(212),plot(ns03_p09_a4(:,8:10)), grid
subplot(211),plot(ns01_p10_a4(:,8:10)), grid, subplot(212),plot(ns03_p10_a4(:,8:10)), grid
subplot(211),plot(ns01_p11_a4(:,8:10)), grid, subplot(212),plot(ns03_p11_a4(:,8:10)), grid
subplot(211),plot(ns01_p12_a4(:,8:10)), grid, subplot(212),plot(ns03_p12_a4(:,8:10)), grid


subplot(211),plot(ns01_p13_a4(:,8:10)), grid, subplot(212),plot(ns03_p13_a4(:,8:10)), grid
[x] subplot(211),plot(ns01_p14_a4(:,8:10)), grid, subplot(212),plot(ns03_p14_a4(:,8:10)), grid
subplot(211),plot(ns01_p15_a4(:,8:10)), grid, subplot(212),plot(ns03_p15_a4(:,8:10)), grid
[x] subplot(211),plot(ns01_p16_a4(:,8:10)), grid, subplot(212),plot(ns03_p16_a4(:,8:10)), grid
subplot(211),plot(ns01_p17_a4(:,8:10)), grid, subplot(212),plot(ns03_p17_a4(:,8:10)), grid
subplot(211),plot(ns01_p18_a4(:,8:10)), grid, subplot(212),plot(ns03_p18_a4(:,8:10)), grid

subplot(211),plot(ns01_p19_a4(:,8:10)), grid, subplot(212),plot(ns03_p19_a4(:,8:10)), grid
subplot(211),plot(ns01_p20_a4(:,8:10)), grid, subplot(212),plot(ns03_p20_a4(:,8:10)), grid
subplot(211),plot(ns01_p21_a4(:,8:10)), grid, subplot(212),plot(ns03_p22_a4(:,8:10)), grid
subplot(211),plot(ns01_p22_a4(:,8:10)), grid, subplot(212),plot(ns03_p22_a4(:,8:10)), grid


```
[x] p14 a04 is not synchronised  
[x] p16 a04 is not synchronised  





## 4. outcome data path
tmpdatapath='/tmp/phdtmpdata';
outcomes_path = strcat(user_path, tmpdatapath, '/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux','/');



```
/home/map479/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux 
```







# HII


testing labels
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












