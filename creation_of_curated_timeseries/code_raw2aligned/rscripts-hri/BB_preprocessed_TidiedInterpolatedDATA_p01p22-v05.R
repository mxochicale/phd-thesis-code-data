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
 	# (0) Definifing paths 
	# (1) Loading libraries and functions
	# (2) Reading raw tidied interpolated data
	# (3) Creating paths
	# (4) Selecting Variables in data.table
		# (4.1)	Selecting Participants
	# (5) Adding vectors
		# (5.1) Deleting some Magnetomer and quaternion data
		# (5.2) zero mean and unit variance
		# (5.3) Savitzky-Golay filter
	# (6) Creating preprocessed data path
	# (7) Writing data.table object to a file



#################
# Start the clock!
start.time <- Sys.time()




################################################################################
# (0) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()

setwd("../")
main_repository_path <- getwd()
setwd("../")
github_path <- getwd()
main_path <- getwd()

outcomes_path <- paste(main_path,"/DataSets/hwum_repository/outcomes",sep="")

preprossededata_path <- paste(outcomes_path,"/preProcessedDataTable_p01_to_p22",sep="")
setwd(file.path(preprossededata_path))
# feature_path <- "xxxxxxxxxxxxxx"




################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(signal)# for butterworth filter and sgolay
source( paste(github_path,'/tavand/functions/ollin_cencah.R',sep='') )



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
xdata$Sensor <- gsub('s01', 'HS01', xdata$Sensor)
xdata$Sensor <- gsub('s02', 'HS02', xdata$Sensor)
xdata$Sensor <- gsub('s03', 'RS01', xdata$Sensor)
xdata$Sensor <- gsub('s04', 'RS02', xdata$Sensor)


################################################################################
### (4.1) Selecting Participants
setkey(xdata, Participant)

### One Participants
#xdata <- xdata[.(c('p01'))]
#
### Two Participants
#xdata <- xdata[.(c('p01','p02'))]

### Three Participant
#xdata <- xdata[.(c('p01', 'p02', 'p03'))]

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
### (5) Adding postprocessing vectors

### (5.1) Deleting some Magnetomer and quaternion data
xdata <- xdata[, !c('MagnX', 'MagnY', 'MagnZ', 'qW', 'qX', 'qY', 'qZ') , with=FALSE]


################################################################################
### (5.2) Zero mean and unit Variance
###
xdata[,c('zmuvAccX', 'zmuvAccY', 'zmuvAccZ','zmuvGyroX', 'zmuvGyroY', 'zmuvGyroZ'
	) :=
       lapply(.(
		AccX, AccY, AccZ, GyroX, GyroY, GyroZ
		), 
	function(x) ( zeromean_unitvariance(x)  ) )]





################################################################################
### (5.3) Smoothing data with Savitzky-Golay Filter
###

### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}

polynomial_degree <- 5
SavitzkyGolayCoeffs1 <- sgolay(p=polynomial_degree, n=29 ,m=0)
SavitzkyGolayCoeffs2 <- sgolay(p=polynomial_degree, n=99 ,m=0)
SavitzkyGolayCoeffs3 <- sgolay(p=polynomial_degree, n=129 ,m=0)
SavitzkyGolayCoeffs4 <- sgolay(p=polynomial_degree, n=159 ,m=0)


xdata[,c('sg1AccX', 'sg1AccY', 'sg1AccZ', 'sg1GyroX', 'sg1GyroY', 'sg1GyroZ',
	 'sg1zmuvAccX', 'sg1zmuvAccY', 'sg1zmuvAccZ', 'sg1zmuvGyroX', 'sg1zmuvGyroY', 'sg1zmuvGyroZ'
	) :=
	lapply(.(
		AccX, AccY, AccZ, GyroX, GyroY, GyroZ,
		zmuvAccX, zmuvAccY, zmuvAccZ, zmuvGyroX, zmuvGyroY, zmuvGyroZ
		), 
	function(x) ( SGolay(x,SavitzkyGolayCoeffs1)  ))
	]

xdata[,c('sg2AccX', 'sg2AccY', 'sg2AccZ', 'sg2GyroX', 'sg2GyroY', 'sg2GyroZ',
	 'sg2zmuvAccX', 'sg2zmuvAccY', 'sg2zmuvAccZ', 'sg2zmuvGyroX', 'sg2zmuvGyroY', 'sg2zmuvGyroZ'
	) :=
	lapply(.(
		AccX, AccY, AccZ, GyroX, GyroY, GyroZ,
		zmuvAccX, zmuvAccY, zmuvAccZ, zmuvGyroX, zmuvGyroY, zmuvGyroZ
		), 
	function(x) ( SGolay(x,SavitzkyGolayCoeffs2)  ))
	]

xdata[,c('sg3AccX', 'sg3AccY', 'sg3AccZ', 'sg3GyroX', 'sg3GyroY', 'sg3GyroZ',
	 'sg3zmuvAccX', 'sg3zmuvAccY', 'sg3zmuvAccZ', 'sg3zmuvGyroX', 'sg3zmuvGyroY', 'sg3zmuvGyroZ'
	) :=
	lapply(.(
		AccX, AccY, AccZ, GyroX, GyroY, GyroZ,
		zmuvAccX, zmuvAccY, zmuvAccZ, zmuvGyroX, zmuvGyroY, zmuvGyroZ
		), 
	function(x) ( SGolay(x,SavitzkyGolayCoeffs3)  ))
	]

xdata[,c('sg4AccX', 'sg4AccY', 'sg4AccZ', 'sg4GyroX', 'sg4GyroY', 'sg4GyroZ',
	 'sg4zmuvAccX', 'sg4zmuvAccY', 'sg4zmuvAccZ', 'sg4zmuvGyroX', 'sg4zmuvGyroY', 'sg4zmuvGyroZ'
	) :=
	lapply(.(
		AccX, AccY, AccZ, GyroX, GyroY, GyroZ,
		zmuvAccX, zmuvAccY, zmuvAccZ, zmuvGyroX, zmuvGyroY, zmuvGyroZ
		), 
	function(x) ( SGolay(x,SavitzkyGolayCoeffs4)  ))
	]

## Checking visually the smoothness of the signals
#psg1 <- ggplot(xdata)+ geom_line( aes(x=Sample,y=sg1GyroY, color=Sensor), size=1)+
#   	facet_grid(Participant~Activity)+
#   	scale_y_continuous()+
#	coord_cartesian( ylim=c(-120,120) ) +
#	theme_bw(base_size=18)
#
#
#psg2 <- ggplot(xdata)+ geom_line( aes(x=Sample,y=sg2GyroY, color=Sensor), size=1)+
#   	facet_grid(Participant~Activity)+
#   	scale_y_continuous()+
#	coord_cartesian( ylim=c(-120,120) ) +
#	theme_bw(base_size=18)
#
#
#psg3 <- ggplot(xdata)+ geom_line( aes(x=Sample,y=sg3GyroY, color=Sensor), size=1)+
#   	facet_grid(Participant~Activity)+
#   	scale_y_continuous()+
#	coord_cartesian( ylim=c(-120,120) ) +
#	theme_bw(base_size=18)
#
#psg4 <- ggplot(xdata)+ geom_line( aes(x=Sample,y=sg4GyroY, color=Sensor), size=1)+
#   	facet_grid(Participant~Activity)+
#   	scale_y_continuous()+
#	coord_cartesian( ylim=c(-120,120) ) +
#	theme_bw(base_size=18)
#
#




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
write.table(xdata, "TidiedInterpolatedTHENpreprocessedData-v05.datatable", row.name=FALSE)

message('datatable file has been created at '  )
message (preProssecedData_path)







#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
