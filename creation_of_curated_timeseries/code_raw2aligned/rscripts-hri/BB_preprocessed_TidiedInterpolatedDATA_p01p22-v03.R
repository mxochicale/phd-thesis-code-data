###############################################################################	
#
# Create TidiedInterpolatedTHENpreprocessedData-v03.datatable
# 
#
#
#
#
# Written by Miguel P Xochicale [http://mxochicale.github.io]
# email:perez.xochicale@gmail.com
# please email me directly if you see any errors or have any questions
# last update: 15 February 2018
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
 	# (1) Definifing paths 
	# (2) Reading raw tidied interpolated data
	# (3) Creating paths
	# (4) Selecting Variables in data.table
		# (4.1)	Selecting Participants
	# (5) Adding vectors
		# (5.1) Magnitude vectors
		# (5.2) zero mean and unit variance
		# (5.3) Savitzky-Golay filter
		# (5.4) Low Frequencies
		# (5.5) High Frequencies
	# (6) Creating preprocessed data path
	# (7) Writing data.table object to a file



#################
# Start the clock!
start.time <- Sys.time()


################################################################################
# (0) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(signal)# for butterworth filter and sgolay
options(digits=15)
source('~/mxochicale/github/r-code_repository/functions/ollin_cencah.R')





################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()

setwd("../")
main_repository_path <- getwd()
setwd("../")
main_path <- getwd()

outcomes_path <- paste(main_path,"/DataSets/hwum_repository/outcomes",sep="")

preprossededata_path <- paste(outcomes_path,"/preProcessedDataTable_p01_to_p22",sep="")
setwd(file.path(preprossededata_path))
# feature_path <- "xxxxxxxxxxxxxx"



################################################################################
# (2) Reading raw tidied  interpolated data
data <- fread("TidiedInterpolatedData.datatable", header=TRUE)



################################################################################
# (3) Creating and Changing to Preprosseced Data Path
#
preProssecedData_path <- paste(outcomes_path,"/preProcessedDataTable_p01_to_p22",sep="")
if (file.exists(preProssecedData_path)){
  setwd(file.path(preProssecedData_path))
} else {
  dir.create(preProssecedData_path, recursive=TRUE)
  setwd(file.path(preProssecedData_path))
}


################################################################################
# (4) Filtering out variables from the data.table
xdata <- data

### Renaming Activity Variables
xdata$Activity <- gsub('a01', 'HN', xdata$Activity)
xdata$Activity <- gsub('a02', 'VN', xdata$Activity)
xdata$Activity <- gsub('a03', 'HF', xdata$Activity)
xdata$Activity <- gsub('a04', 'VF', xdata$Activity)

## Renaming Sensor Variables
xdata$Sensor <- gsub('s01', 'HumanSen1', xdata$Sensor)
xdata$Sensor <- gsub('s02', 'HumanSen2', xdata$Sensor)
xdata$Sensor <- gsub('s03', 'RobotSen1', xdata$Sensor)
xdata$Sensor <- gsub('s04', 'RobotSen2', xdata$Sensor)











################################################################################
### (4.1) Selecting Participants
setkey(xdata, Participant)

# ## Two Participants
# xdata <- xdata[.(c('p01','p22'))]


# ################################################################################
# ## Six Participants
# xdata <- xdata[.(c('p01','p02', 'p03', 'p04', 'p05', 'p06'
#                    ))]



################################################################################
## Twelve Participants
# xdata <- xdata[.(c('p01','p02', 'p03', 'p04', 'p05', 'p06','p07','p08', 'p09', 'p10', 'p11', 'p12'))]




###############################################################################
## Twenty Participants
xdata <- xdata[.(c('p01','p02', 'p03', 'p04', 'p05', 'p06', 'p07', 'p08', 'p09', 'p10',
                   'p11','p12', 'p14', 'p15', 'p17', 'p18', 'p19', 'p20', 'p21', 'p22'
                   ))]
## Renaming Participant Names  p14p22 to p13p20 [http://stackoverflow.com/questions/24536771/]
xdata[, Participant := as.character(Participant)][Participant == 'p14', Participant := 'p13']
xdata[, Participant := as.character(Participant)][Participant == 'p15', Participant := 'p14']
xdata[, Participant := as.character(Participant)][Participant == 'p17', Participant := 'p15']
xdata[, Participant := as.character(Participant)][Participant == 'p18', Participant := 'p16']
xdata[, Participant := as.character(Participant)][Participant == 'p19', Participant := 'p17']
xdata[, Participant := as.character(Participant)][Participant == 'p20', Participant := 'p18']
xdata[, Participant := as.character(Participant)][Participant == 'p21', Participant := 'p19']
xdata[, Participant := as.character(Participant)][Participant == 'p22', Participant := 'p20']


################################################################################
## Twentytwo Participants
# xdata <- xdata[.(c('p01','p02', 'p03', 'p04', 'p05', 'p06','p07','p08', 'p09', 'p10',
#                    'p11','p12', 'p13', 'p14', 'p15', 'p16','p17','p18', 'p19', 'p20',
#                    'p21', 'p22'))]




################################################################################
### (5) Adding vectors

################################################################################
### (5.1) Magnitude Vectors

setkey(xdata, Participant)
xdata<-xdata[,Amag:=sqrt(AccX^2 + AccY^2 + AccZ^2),by=Sensor]
xdata<-xdata[,Gmag:=sqrt(GyroX^2 + GyroY^2 + GyroZ^2),by=Sensor]
xdata<-xdata[,Mmag:=sqrt(MagnX^2 + MagnY^2 + MagnZ^2),by=Sensor]



# xdata[, .(AccX, AccY, AccX),by=c('Participant', 'Activity','Sensor')]
# principal components
pc <- prcomp(  xdata[, .(AccX, AccY, AccZ) ] , center = T, scale. = T)
xdata[, `:=`(pc1_Acc, pc$x[, 1])]
xdata[, `:=`(pc2_Acc, pc$x[, 2])]
xdata[, `:=`(pc3_Acc, pc$x[, 3])]

# TODO
# test only one particpant with one sensor with one activity
# and comperate results with
# one particpant with two sensors with one activity
# and so on
# in order to test the consistency of the pca






################################################################################
### (5.2) Zero mean and unit Variance
###
xdata[,c('zmuvAccX', 'zmuvAccY', 'zmuvAccZ', 'zmuvMagnX', 'zmuvMagnY', 'zmuvMagnZ' ,'zmuvGyroX', 'zmuvGyroY', 'zmuvGyroZ',
'zmuvqW', 'zmuvqX', 'zmuvqY', 'zmuvqZ', 'zmuvAmag','zmuvGmag','zmuvMmag') :=
       lapply(.(AccX, AccY, AccZ, MagnX, MagnY, MagnZ, GyroX, GyroY, GyroZ, qW, qX, qY, qZ,
         Amag, Gmag, Mmag), function(x) ( zeromean_unitvariance(x)  ) )]





################################################################################
### (5.3) Smoothing data with Savitzky-Golay Filter
###
SavitzkyGolayCoeffs <- sgolay(p=5,n=155 ,m=0)

### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}


xdata[,c('sgAccX', 'sgAccY', 'sgAccZ', 'sgMagnX', 'sgMagnY', 'sgMagnZ' ,'sgGyroX', 'sgGyroY', 'sgGyroZ',
	'sgqW', 'sgqX', 'sgqY', 'sgqZ', 
	'sgAmag','sgGmag','sgMmag', 'sgpc1_Acc', 'sgpc2_Acc', 'sgpc3_Acc',
	'sgzmuvAccX', 'sgzmuvAccY', 'sgzmuvAccZ', 'sgzmuvMagnX', 'sgzmuvMagnY', 'sgzmuvMagnZ' ,'sgzmuvGyroX', 'sgzmuvGyroY', 'sgzmuvGyroZ',
	'sgzmuvqW', 'sgzmuvqX', 'sgzmuvqY', 'sgzmuvqZ', 
	'sgzmuvAmag','sgzmuvGmag','sgzmuvMmag'
	) 
:=lapply(
	.(AccX, AccY, AccZ, MagnX, MagnY, MagnZ, GyroX, GyroY, GyroZ, qW, qX, qY, qZ,
        Amag, Gmag, Mmag, pc1_Acc, pc2_Acc, pc3_Acc,
	zmuvAccX, zmuvAccY, zmuvAccZ, zmuvMagnX, zmuvMagnY, zmuvMagnZ ,zmuvGyroX, zmuvGyroY, zmuvGyroZ,
	zmuvqW, zmuvqX, zmuvqY, zmuvqZ, 
	zmuvAmag,zmuvGmag,zmuvMmag
	), 
	function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))
	]







################################################################################
### (5.4) Creating Low Frequency Components 
###
cutoffHZ <- 6
sampleHz <- 50
nyqHZ = sampleHz/2 #nyquist
f <- butter(9, cutoffHZ/nyqHZ)
#create lowfreq components
xdata[,c('lfAccX', 'lfAccY', 'lfAccZ', 'lfMagnX', 'lfMagnY', 'lfMagnZ' ,'lfGyroX', 'lfGyroY', 'lfGyroZ','lfqW', 'lfqX', 'lfqY', 'lfqZ', 
	'lfAmag','lfGmag','lfMmag', 'lfpc1_Acc', 'lfpc2_Acc', 'lfpc3_Acc',
	'lfsgAccX', 'lfsgAccY', 'lfsgAccZ', 'lfsgMagnX', 'lfsgMagnY', 'lfsgMagnZ' ,'lfsgGyroX', 'lfsgGyroY', 'lfsgGyroZ',
	'lfsgqW', 'lfsgqX', 'lfsgqY', 'lfsgqZ', 'lfsgAmag','lfsgGmag','lfsgMmag', 'lfsgpc1_Acc', 'lfsgpc2_Acc', 'lfsgpc3_Acc',
	'lfzmuvAccX', 'lfzmuvAccY', 'lfzmuvAccZ', 'lfzmuvMagnX', 'lfzmuvMagnY', 'lfzmuvMagnZ' ,'lfzmuvGyroX', 'lfzmuvGyroY', 'lfzmuvGyroZ',
	'lfsgzmuvAccX', 'lfsgzmuvAccY', 'lfsgzmuvAccZ', 'lfsgzmuvMagnX', 'lfsgzmuvMagnY', 'lfsgzmuvMagnZ', 'lfsgzmuvGyroX', 'lfsgzmuvGyroY', 'lfsgzmuvGyroZ'
	)
:=lapply(
	.(AccX, AccY, AccZ, MagnX, MagnY, MagnZ, GyroX, GyroY, GyroZ, qW, qX, qY, qZ,
        Amag, Gmag, Mmag, pc1_Acc, pc2_Acc, pc3_Acc,
        sgAccX, sgAccY, sgAccZ, sgMagnX, sgMagnY, sgMagnZ, sgGyroX, sgGyroY, sgGyroZ,
        sgqW, sgqX, sgqY, sgqZ, sgAmag, sgGmag, sgMmag, sgpc1_Acc, sgpc2_Acc, sgpc3_Acc,
	zmuvAccX, zmuvAccY, zmuvAccZ, zmuvMagnX, zmuvMagnY, zmuvMagnZ ,zmuvGyroX, zmuvGyroY, zmuvGyroZ,
	sgzmuvAccX,     sgzmuvAccY,     sgzmuvAccZ,     sgzmuvMagnX,     sgzmuvMagnY,     sgzmuvMagnZ,     sgzmuvGyroX,     sgzmuvGyroY,     sgzmuvGyroZ
	),
	function(x) ( filtfilt(f, x)) )
	]




	


################################################################################
### (5.5) Creating Hight Frequency Components
###
xdata[, hfAccX := AccX - lfAccX]
xdata[, hfAccY := AccY - lfAccY]
xdata[, hfAccZ := AccZ - lfAccZ]

xdata[, hfMangX := MagnX - lfMagnX]
xdata[, hfMangY := MagnY - lfMagnY]
xdata[, hfMangZ := MagnZ - lfMagnZ]

xdata[, hfGyroX := GyroX - lfGyroX]
xdata[, hfGyroY := GyroY - lfGyroY]
xdata[, hfGyroZ := GyroZ - lfGyroZ]

xdata[, hfqW := qW - lfqW]
xdata[, hfqX := qX - lfqX]
xdata[, hfqY := qY - lfqY]
xdata[, hfqZ := qZ - lfqZ]

xdata[, hfAmag := Amag - lfAmag]
xdata[, hfGmag := Gmag - lfGmag]
xdata[, hfMmag := Mmag - lfMmag]

xdata[, hfpc1_Acc := pc1_Acc - lfpc1_Acc]
xdata[, hfpc2_Acc := pc2_Acc - lfpc2_Acc]
xdata[, hfpc3_Acc := pc3_Acc - lfpc3_Acc]

xdata[, hfsgAccX := sgAccX - lfsgAccX]
xdata[, hfsgAccY := sgAccY - lfsgAccY]
xdata[, hfsgAccZ := sgAccZ - lfsgAccZ]

xdata[, hfsgMagnX := sgMagnX - lfsgMagnX]
xdata[, hfsgMagnY := sgMagnY - lfsgMagnY]
xdata[, hfsgMagnZ := sgMagnZ - lfsgMagnZ]

xdata[, hfsgGyroX := sgGyroX - lfsgGyroX]
xdata[, hfsgGyroY := sgGyroY - lfsgGyroY]
xdata[, hfsgGyroZ := sgGyroZ - lfsgGyroZ]

xdata[, hfsgqW := sgqW - lfsgqW]
xdata[, hfsgqX := sgqX - lfsgqX]
xdata[, hfsgqY := sgqY - lfsgqY]
xdata[, hfsgqZ := sgqZ - lfsgqZ]

xdata[, hfsgAmag := sgAmag - lfsgAmag]
xdata[, hfsgGmag := sgGmag - lfsgGmag]
xdata[, hfsgMmag := sgMmag - lfsgMmag]

xdata[, hfsgpc1_Acc := sgpc1_Acc - lfsgpc1_Acc]
xdata[, hfsgpc2_Acc := sgpc2_Acc - lfsgpc2_Acc]
xdata[, hfsgpc3_Acc := sgpc3_Acc - lfsgpc3_Acc]




xdata[, hfzmuvAccX:= zmuvAccX- lfzmuvAccX]
xdata[, hfzmuvAccY := zmuvAccY  - lfzmuvAccY ]
xdata[, hfzmuvAccZ := zmuvAccZ  - lfzmuvAccZ ]

xdata[, hfzmuvMagnX := zmuvMagnX  - lfzmuvMagnX ]
xdata[, hfzmuvMagnY := zmuvMagnY  - lfzmuvMagnY ]
xdata[, hfzmuvMagnZ := zmuvMagnZ  - lfzmuvMagnZ ]

xdata[, hfzmuvGyroX := zmuvGyroX - lfzmuvGyroX ]
xdata[, hfzmuvGyroY := zmuvGyroY - lfzmuvGyroY ]
xdata[, hfzmuvGyroZ := zmuvGyroZ - lfzmuvGyroZ ]

xdata[, hfsgzmuvAccX := sgzmuvAccX  - lfsgzmuvAccX ]
xdata[, hfsgzmuvAccY := sgzmuvAccY  - lfsgzmuvAccY ]
xdata[, hfsgzmuvAccZ := sgzmuvAccZ  - lfsgzmuvAccZ ]

xdata[, hfsgzmuvMagnX :=  sgzmuvMagnX - lfsgzmuvMagnX ]
xdata[, hfsgzmuvMagnY := sgzmuvMagnY  - lfsgzmuvMagnY ]
xdata[, hfsgzmuvMagnZ := sgzmuvMagnZ  - lfsgzmuvMagnZ ]

xdata[, hfsgzmuvGyroX :=  sgzmuvGyroX - lfsgzmuvGyroX]
xdata[, hfsgzmuvGyroY := sgzmuvGyroY  - lfsgzmuvGyroY ]
xdata[, hfsgzmuvGyroZ := sgzmuvGyroZ  - lfsgzmuvGyroZ ]





################################################################################
# (6) Creating Preprossed Data Path
preProssecedData_path <- paste(outcomes_path,"/preProcessedDataTable_p01_to_p22",sep="")
if (file.exists(preProssecedData_path)){
  setwd(file.path(preProssecedData_path))
} else {
  dir.create(preProssecedData_path, recursive=TRUE)
  setwd(file.path(preProssecedData_path))
}




################################################################################
####  (7)  Writing Data
write.table(xdata, "TidiedInterpolatedTHENpreprocessedData-v03.datatable", row.name=FALSE)

message('datatable file has been created at '  )
message (preProssecedData_path)






#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
