v05
---




# `source(  paste( getwd(), '/A_dataset.R', sep=''), echo=TRUE )`

```
xpa <- xdata[,.(
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]
```


```
> end.time - start.time
Time difference of 6.059159 secs
```

```
42M Oct 17 10:53 xdata_v05.dt
```

at `/home/ai/github/phd-thesis-code-data/data-outputs/rqa/v05`








# `source(  paste( getwd(), '/Ba_timeseries_aH.R', sep=''), echo=TRUE )`



```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```

> end.time - start.time
Time difference of 9.531469 secs


# `source(  paste( getwd(), '/Bb_timeseries_aV.R', sep=''), echo=TRUE )`

```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```



> end.time - start.time
Time difference of 7.474365 secs





3015875 -rw-rw-r-- 1 ai ai 196K Oct 17 11:22 aH-sg0zmuvGyroZ-HS01-w100.png
3015872 -rw-rw-r-- 1 ai ai 239K Oct 17 11:22 aH-sg0zmuvGyroZ-RS01-w100.png
3015876 -rw-rw-r-- 1 ai ai 192K Oct 17 11:22 aH-sg1zmuvGyroZ-HS01-w100.png
3015873 -rw-rw-r-- 1 ai ai 191K Oct 17 11:22 aH-sg1zmuvGyroZ-RS01-w100.png
3015877 -rw-rw-r-- 1 ai ai 174K Oct 17 11:22 aH-sg2zmuvGyroZ-HS01-w100.png
3015874 -rw-rw-r-- 1 ai ai 172K Oct 17 11:22 aH-sg2zmuvGyroZ-RS01-w100.png
3015881 -rw-rw-r-- 1 ai ai 188K Oct 17 11:20 aV-sg0zmuvGyroY-HS01-w100.png
3015878 -rw-rw-r-- 1 ai ai 195K Oct 17 11:20 aV-sg0zmuvGyroY-RS01-w100.png
3015882 -rw-rw-r-- 1 ai ai 178K Oct 17 11:20 aV-sg1zmuvGyroY-HS01-w100.png
3015879 -rw-rw-r-- 1 ai ai 178K Oct 17 11:20 aV-sg1zmuvGyroY-RS01-w100.png
3015883 -rw-rw-r-- 1 ai ai 173K Oct 17 11:20 aV-sg2zmuvGyroY-HS01-w100.png
3015880 -rw-rw-r-- 1 ai ai 174K Oct 17 11:20 aV-sg2zmuvGyroY-RS01-w100.png


at: 
`/home/ai/github/phd-thesis/figs/results/rqa/hri/v05/timeseries_plots` 








# `source(  paste( getwd(), '/Ca_rp_aH.R', sep=''), echo=TRUE )`

```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```



```
#number_of_participants <- 1
number_of_participants <- 3
#number_of_participants <- 12
#number_of_participants <- 20
```

Time difference of 4.164965 mins
for all the participants




```

##########################
##### one window lenght
windowsl <- c(500)
windowsn <- c('w10')
```




> end.time - start.time
Time difference of 20.71266 secs



at: `/home/ai/github/phd-thesis/figs/results/rqa/hri/v05/rp_plots/H`







# `source(  paste( getwd(), '/Cb_rp_aV.R', sep=''), echo=TRUE )`

tart.time
Time difference of 22.44884 secs
``
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```




```
#number_of_participants <- 1
number_of_participants <- 3
#number_of_participants <- 12
#number_of_participants <- 20
```



Time difference of 36.97325 secs
for only three particpants





```
##########################
##### one window lenght
windowsl <- c(500)
windowsn <- c('w10')
```



> end.time - start.time
Time difference of 21.6059 secs



at `/home/ai/github/phd-thesis/figs/results/rqa/hri/v05/rp_plots/V`












# `source(  paste( getwd(), '/D_rqa.R', sep=''), echo=TRUE )`


```

##########################
##### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
dimensions <- c(4)
delays <- c(5)
```

```
> end.time - start.time
Time difference of 5.450736 secs
```



```
##########################
##### one window lenght
windowsl <- c(500)
windowsn <- c('w10')
dimensions <- c(6)
delays <- c(8)
```




```
> end.time - start.time
Time difference of 36.66901 secs
```

176K Oct 17 12:09 rqa_w10.dt


at `/home/ai/github/phd-thesis-code-data/data-outputs/rqa/hri/v05/rqa`









# `> source(  paste( getwd(), '/Ea_rqa_plots_aH.R', sep=''), echo=TRUE )`

```
#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')
```






> end.time - start.time
Time difference of 3.093402 secs


```
16K Oct 18 14:17 det_bp_HF_HS01.png
17K Oct 18 14:17 det_bp_HF_RS01.png
15K Oct 18 14:17 det_bp_HN_HS01.png
15K Oct 18 14:17 det_bp_HN_RS01.png
21K Oct 18 14:17 entr_bp_HF_HS01.png
19K Oct 18 14:17 entr_bp_HF_RS01.png
21K Oct 18 14:17 entr_bp_HN_HS01.png
17K Oct 18 14:17 entr_bp_HN_RS01.png
30K Oct 18 14:17 ratio_bp_HF_HS01.png
20K Oct 18 14:17 ratio_bp_HF_RS01.png
21K Oct 18 14:17 ratio_bp_HN_HS01.png
17K Oct 18 14:17 ratio_bp_HN_RS01.png
21K Oct 18 14:17 rec_bp_HF_HS01.png
16K Oct 18 14:17 rec_bp_HF_RS01.png
28K Oct 18 14:17 rec_bp_HN_HS01.png
17K Oct 18 14:17 rec_bp_HN_RS01.png
```


at `/home/ai/github/phd-thesis/figs/results/rqa/hri/v05/rqa_plots/H 





# `> source(  paste( getwd(), '/Eb_rqa_plots_aV.R', sep=''), echo=TRUE )`

```
#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')
```



```
> end.time - start.time
Time difference of 2.996256 secs
```


```
17K Oct 18 14:14 det_bp_VF_HS01.png
15K Oct 18 14:14 det_bp_VF_RS01.png
15K Oct 18 14:14 det_bp_VN_HS01.png
15K Oct 18 14:14 det_bp_VN_RS01.png
22K Oct 18 14:14 entr_bp_VF_HS01.png
19K Oct 18 14:14 entr_bp_VF_RS01.png
24K Oct 18 14:14 entr_bp_VN_HS01.png
18K Oct 18 14:14 entr_bp_VN_RS01.png
26K Oct 18 14:14 ratio_bp_VF_HS01.png
18K Oct 18 14:14 ratio_bp_VF_RS01.png
18K Oct 18 14:14 ratio_bp_VN_HS01.png
16K Oct 18 14:14 ratio_bp_VN_RS01.png
19K Oct 18 14:14 rec_bp_VF_HS01.png
16K Oct 18 14:14 rec_bp_VF_RS01.png
26K Oct 18 14:14 rec_bp_VN_HS01.png
17K Oct 18 14:14 rec_bp_VN_RS01.png
```

at `/home/ai/github/phd-thesis/figs/results/rqa/hri/v05/rqa_plots/V`


































