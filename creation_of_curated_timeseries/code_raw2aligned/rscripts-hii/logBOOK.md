logBOOK
---

# todo


# sorted



* [x] tweat `BB_preprocessed_TidiedInterpolatedDATA_p01p22.R`
	to generate the right datatable object for analysis
	
	


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





	added: Tue 28 Aug 20:13:34 BST 2018   
	sorted: Sat 22 Sep 16:53:33 BST 2018


* [x] change paths


BA
```
setwd("../../../../../")
home_path <- getwd()
setwd(home_path)

#home_path <- '/home/map479'
#setwd(home_path)
```


BB

```
setwd("../../")
home_path <- getwd()
setwd(home_path)
feature_path <- '/data/timeseries/hii'
```


sorted: Wed 29 Aug 14:41:10 BST 2018



