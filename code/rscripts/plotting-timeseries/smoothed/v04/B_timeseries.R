###############################################################################	
#
# 
#
#
#
#
# Written by Miguel P Xochicale [http://mxochicale.github.io]
#
# If you see any errors or have any questions
# please create an issue at https://github.com/mxochicale/hwum-dataset/issues
#
###############################################################################	
	# OUTLINE:
 	# (0) Definifing paths 
	# (1) Loading libraries and functions
	# (2) Reading 
	# (3) Creating paths
	# (4) Selecting Variables in data.table
		# (4.1)	Selecting Participants
	# (5) Adding vectors
		# (5.1) Deleting some Magnetomer and quaternion data
		# (5.2) zero mean and unit variance
		# (5.3) Savitzky-Golay filter
	# (6) Selecting Axis after postprocessing
	# (7) Creating preprocessed data path
	# (8) Writing data.table object to a file



#################
# Start the clock!
start.time <- Sys.time()




################################################################################
# (0) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()
setwd("../../../../../")
github_repo_path <- getwd()

setwd("../")
github_path <- getwd()


##VERSION 
version <- '04'
feature_path <- '/smoothed-timeseries'


## Outcomes Plot Path
outcomes_plot_path <- paste(github_path,"/phd-thesis/figs/results/smoothed-timeseries/v", version,sep="")


## Data Path
data_path <-  paste(github_repo_path,'/data-outputs', feature_path, '/v', version, sep="")
setwd(file.path(data_path))



################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(signal)# for butterworth filter and sgolay
library(ggplot2)

################################################################################
# (2) Reading data
file_ext <- paste('xdata_v', version, '.dt',sep='')
data <- fread( file_ext, header=TRUE)










################################################################################
################################################################################
################################################################################
################################################################################
### (4.1) Windowing Data [xdata[,.SD[1:2],by=.(Participant,Activity,Sensor)]]


#########################
#### one window lenght
windowsl <- c(500)
windowsn <- c('w10')


############################
###### four window lenghts
#windowsl <- c(100,250,500,750)
#windowsn <- c('w2', 'w5', 'w10', 'w15')
########################################
#### w2, 2-second window (100 samples) ## 100 to 200
########################################
#### w5, 5-second window (250 samples) # 100 to 350
#######################################
#### w10, 10-second window (500 samples) ## 100 to 600
########################################
#### w15, 15-second window (750 samples) ## 100 to 850






for ( wk in 1:(length(windowsl)) ) {

xdata <- data
windowlengthnumber <- windowsl[wk]
windowksams <- paste('w', windowlengthnumber, sep='')
windowksecs <- windowsn[wk]

message('****************')
message('****************')
message('****************')
message('****************')
message('*** window:', windowksams)



# general variables for window legnth
wstar=100
wend=wstar+windowlengthnumber
windowlength=wend-wstar
windowframe =wstar:wend
wkdata <- xdata[,.SD[windowframe],by=.(Participant,Activity,Sensor)];





###########################
### (4.2.3) Activities Selection
#

###HORIZONTAL
#movementtag <- 'H' 
#setkey(wkdata, Activity)
#awkdata <- wkdata[.(c('HN', 'HF'))]

##VERTICAL
movementtag <- 'V' 
setkey(wkdata, Activity)
awkdata <- wkdata[.(c('VN', 'VF'))]


################# Reorder Factor:
awkdata$Activity <- factor(awkdata$Activity)
awkdata$Activity <- factor(awkdata$Activity, levels= levels (awkdata$Activity)[c(2,1)] )




#################################################################################
#################################################################################
#################################################################################
#################################################################################
				### (4.2.4) Axis Selection
			
	
		################################################################################
		# (3) Outcomes Plot Path
		if (file.exists(outcomes_plot_path)){
		  setwd(file.path(outcomes_plot_path))
		} else {
		  dir.create(outcomes_plot_path, recursive=TRUE)
		  setwd(file.path(outcomes_plot_path))
		}

	
				axis <- names(awkdata)[5: (  length(awkdata))  ]
				####### Axisk
				for (axis_k in c(1:length(axis)  )){ #for (axis_k in c(1:length(axis))){
				
				
				axisk<- axis[axis_k]
				message('#### axis:' , axisk )
	


	plotlinewidtg <- 1.5
	basefontsize <- 18
	p <- ggplot(awkdata)+ geom_line( aes(x=Sample,y=get(axisk), color=Sensor), size=plotlinewidtg )+
   	facet_grid(Participant~Activity)+
   	scale_y_continuous()+
	#geom_segment(aes(x = 100, y = -125, xend = 100, yend = 125)) +
   	coord_cartesian(xlim=c(wstar,wend), ylim=c(-7,7)) +
	theme_bw(base_size=basefontsize)+
	theme(legend.position='none')+
	labs(y=axisk, x='Sample')


	### Save Picture
	width = 600
	height = 800
	text.factor = 1
	dpi <- text.factor * 100
	width.calc <- width / dpi
	height.calc <- height / dpi

	file_ext <- paste(axisk,'-', windowksams, '-m', movementtag, '.png', sep='')
	ggsave(filename = file_ext,
		dpi = dpi,
		width = width.calc,
		height = height.calc,
		units = 'in',
		bg = "transparent",
		device = "png",
		p)







				}##end##for (axis_k in c(1:length(axis)  )){ 
#################################################################################
#################################################################################
#################################################################################
#################################################################################



} ##end## for ( wk in 1:(length(windowsl)) ) { 
################################################################################
################################################################################
################################################################################
################################################################################




	plotlinewidtg <- 1.5
	basefontsize <- 18
	p <- ggplot(awkdata)+ geom_line( aes(x=Sample,y=get(axisk), color=Sensor), size=plotlinewidtg )+
   	facet_grid(Participant~Activity)+
   	scale_y_continuous()+
	#geom_segment(aes(x = 100, y = -125, xend = 100, yend = 125)) +
   	coord_cartesian(xlim=c(wstar,wend), ylim=c(-7,7)) +
	theme_bw(base_size=basefontsize)+
	#	theme(legend.position='none')+
	labs(y=axisk, x='Sample')


	### Save Picture
	width = 600
	height = 800
	text.factor = 1
	dpi <- text.factor * 100
	width.calc <- width / dpi
	height.calc <- height / dpi

	file_ext <- paste('labels-', windowksams, '.png', sep='')
	ggsave(filename = file_ext,
		dpi = dpi,
		width = width.calc,
		height = height.calc,
		units = 'in',
		bg = "transparent",
		device = "png",
		p)




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
