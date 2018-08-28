#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# BB_preprocessed_TidiedInterpolatedDATA_p01p22.R
#
# FileDescription:
# Execution Time:39.9252369403839
#
#
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#################
# Start the clock!
start.time <- Sys.time()


################################################################################
# Loading Functions and Libraries and Setting up digits
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
# (2) Reading data
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
### (4.1) Filtering Participants
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
### (4.1) Defining more time series
setkey(xdata, Participant)



xdata<-xdata[,Amag:=sqrt(AccX^2 + AccY^2 + AccZ^2),by=Sensor]
xdata<-xdata[,Gmag:=sqrt(GyroX^2 + GyroY^2 + GyroZ^2),by=Sensor]
xdata<-xdata[,Mmag:=sqrt(MagnX^2 + MagnY^2 + MagnZ^2),by=Sensor]



# xdata[, .(AccX, AccY, AccX),by=c('Participant', 'Activity','Sensor')]
# principal components
pc <- prcomp(  xdata[, .(AccX, AccY, AccX) ] , center = T, scale. = T)
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
### (4.2) Smoothing data with Savitzky-Golay Filter
###
SavitzkyGolayCoeffs <- sgolay(p=5,n=155 ,m=0)

### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}


xdata[,c('sgAccX', 'sgAccY', 'sgAccZ', 'sgMagnX', 'sgMagnY', 'sgMagnZ' ,'sgGyroX', 'sgGyroY', 'sgGyroZ',
'sgqW', 'sgqX', 'sgqY', 'sgqZ', 'sgAmag','sgGmag','sgMmag', 'sgpc1_Acc', 'sgpc2_Acc', 'sgpc3_Acc') :=
       lapply(.(AccX, AccY, AccZ, MagnX, MagnY, MagnZ, GyroX, GyroY, GyroZ, qW, qX, qY, qZ,
         Amag, Gmag, Mmag, pc1_Acc, pc2_Acc, pc3_Acc), function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))]


# xdata<-xdata[,sgAccX:=SGolay(AccX,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgAccY:=SGolay(AccY,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgAccZ:=SGolay(AccZ,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgMagnX:=SGolay(MagnX,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgMagnY:=SGolay(MagnY,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgMagnZ:=SGolay(MagnZ,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgGyroX:=SGolay(GyroX,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgGyroY:=SGolay(GyroY,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,sgGyroZ:=SGolay(GyroZ,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,qW:=SGolay(qW,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,qX:=SGolay(qX,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,qY:=SGolay(qY,SavitzkyGolayCoeffs),by=Sensor]
# xdata<-xdata[,qZ:=SGolay(qZ,SavitzkyGolayCoeffs),by=Sensor]








# Lowpass and highpass filtering
cutoffHZ <- 6
sampleHz <- 50
nyqHZ = sampleHz/2 #nyquist
f <- butter(9, cutoffHZ/nyqHZ)
#create lowfreq components
xdata[,c('lAccX', 'lAccY', 'lAccZ', 'lMagnX', 'lMagnY', 'lMagnZ' ,'lGyroX', 'lGyroY', 'lGyroZ',
'lqW', 'lqX', 'lqY', 'lqZ', 'lAmag','lGmag','lMmag', 'lpc1_Acc', 'lpc2_Acc', 'lpc3_Acc',
'lsgAccX', 'lsgAccY', 'lsgAccZ', 'lsgMagnX', 'lsgMagnY', 'lsgMagnZ' ,'lsgGyroX', 'lsgGyroY', 'lsgGyroZ',
'lsgqW', 'lsgqX', 'lsgqY', 'lsgqZ', 'lsgAmag','lsgGmag','lsgMmag', 'lsgpc1_Acc', 'lsgpc2_Acc', 'lsgpc3_Acc')
:=lapply(.(AccX, AccY, AccZ, MagnX, MagnY, MagnZ, GyroX, GyroY, GyroZ, qW, qX, qY, qZ,
         Amag, Gmag, Mmag, pc1_Acc, pc2_Acc, pc3_Acc,
         sgAccX, sgAccY, sgAccZ, sgMagnX, sgMagnY, sgMagnZ, sgGyroX, sgGyroY, sgGyroZ,
         sgqW, sgqX, sgqY, sgqZ, sgAmag, sgGmag, sgMmag, sgpc1_Acc, sgpc2_Acc, sgpc3_Acc),
         function(x) (filtfilt(f, x)))]




#create hf components
xdata[, hAccX := AccX - lAccX]
xdata[, hAccY := AccY - lAccY]
xdata[, hAccZ := AccZ - lAccZ]

xdata[, hMangX := MagnX - lMagnX]
xdata[, hMangY := MagnY - lMagnY]
xdata[, hMangZ := MagnZ - lMagnZ]

xdata[, hGyroX := GyroX - lGyroX]
xdata[, hGyroY := GyroY - lGyroY]
xdata[, hGyroZ := GyroZ - lGyroZ]

xdata[, hqW := qW - lqW]
xdata[, hqX := qX - lqX]
xdata[, hqY := qY - lqY]
xdata[, hqZ := qZ - lqZ]

xdata[, hAmag := Amag - lAmag]
xdata[, hGmag := Gmag - lGmag]
xdata[, hMmag := Mmag - lMmag]

xdata[, hpc1_Acc := pc1_Acc - lpc1_Acc]
xdata[, hpc2_Acc := pc2_Acc - lpc2_Acc]
xdata[, hpc3_Acc := pc3_Acc - lpc3_Acc]

xdata[, hsgAccX := sgAccX - lsgAccX]
xdata[, hsgAccY := sgAccY - lsgAccY]
xdata[, hsgAccZ := sgAccZ - lsgAccZ]

xdata[, hsgMagnX := sgMagnX - lsgMagnX]
xdata[, hsgMagnY := sgMagnY - lsgMagnY]
xdata[, hsgMagnZ := sgMagnZ - lsgMagnZ]

xdata[, hsgGyroX := sgGyroX - lsgGyroX]
xdata[, hsgGyroY := sgGyroY - lsgGyroY]
xdata[, hsgGyroZ := sgGyroZ - lsgGyroZ]

xdata[, hsgqW := sgqW - lsgqW]
xdata[, hsgqX := sgqX - lsgqX]
xdata[, hsgqY := sgqY - lsgqY]
xdata[, hsgqZ := sgqZ - lsgqZ]

xdata[, hsgAmag := sgAmag - lsgAmag]
xdata[, hsgGmag := sgGmag - lsgGmag]
xdata[, hsgMmag := sgMmag - lsgMmag]

xdata[, hsgpc1_Acc := sgpc1_Acc - lsgpc1_Acc]
xdata[, hsgpc2_Acc := sgpc2_Acc - lsgpc2_Acc]
xdata[, hsgpc3_Acc := sgpc3_Acc - lsgpc3_Acc]



################################################################################
# (5) Creating Preprossed Data Path
preProssecedData_path <- paste(outcomes_path,"/preProcessedDataTable_p01_to_p22",sep="")
if (file.exists(preProssecedData_path)){
  setwd(file.path(preProssecedData_path))
} else {
  dir.create(preProssecedData_path, recursive=TRUE)
  setwd(file.path(preProssecedData_path))
}




################################################################################
####  (6)  Writing Data
write.table(xdata, "TidiedInterpolatedTHENpreprocessedData.datatable", row.name=FALSE)

message('TidiedInterpolatedTHENpreprocessedData.datatable ', 'has been created at '  )
message (preProssecedData_path)






#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
