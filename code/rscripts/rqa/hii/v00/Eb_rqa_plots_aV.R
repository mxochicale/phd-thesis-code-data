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
# please create an issue at https://github.com/mxochicale/phd-thesis-code-data/issues
#
###############################################################################	
	# OUTLINE:
 	# (0) Definifing paths 
	# (1) Loading libraries and functions
	# (2) Reading 


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
version <- '00'
feature_path <- '/rqa/hii'

## Outcomes Plot Path
outcomes_plot_path <- paste(github_path,"/phd-thesis/figs/results", feature_path, '/v', version,sep="")

## RQA Path
data_path <- paste(github_repo_path,'/data-outputs', feature_path, '/v', version, sep="")
#rqa_path <- paste(data_path, '/rqa', sep="")
setwd(file.path(data_path))



################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(signal)# for butterworth filter and sgolay
library(ggplot2)
library(RColorBrewer)

library(devtools)
load_all( paste(github_path, '/nonlinearTseries', sep='' ))

source( paste(github_repo_path,'/code/rfunctions/extra_rqa.R',sep='') )




################################################################################
# (2) Reading data

#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')


file_ext <- paste('rqa_', windowksecs, '.dt',sep='')
W <- fread( file_ext, header=TRUE)


activitytag <- 'V'

mainaxis <- 'GyroY'
selectAxisXX <- c(	
	paste('sg0zmuv',mainaxis,sep=''),
	paste('sg1zmuv',mainaxis,sep=''),
	paste('sg2zmuv',mainaxis,sep='')
	)
W <-  W[ Axis %in% selectAxisXX ]

selectActivityXX <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')
W <-  W[ Activity %in% selectActivityXX ]



################################################################################
# () Recurrence Quantification Analysis Plots



################### Reorder Factor for axis sensors in the ggplot data.table
W$Activity <- factor(W$Activity)
W$Activity <- factor(W$Activity, levels= levels (W$Activity)[c(3,4,1,2)] )


noparticipants <- 6
basesizefont <- 18


#################################################################################
#################################################################################
#################################################################################
#################################################################################

sensors <- c('HS01','HS02')# HumanSensor01  and HumanSensor02

			for (sensor_k in 1:length(sensors) ) {

			sensork <- sensors[sensor_k]
			message(sensork)

			if (sensork == 'HS01' ) {
			setkey(W, Sensor)
			Ws <- W[.(c('HS01'))]

			} else if (sensork == 'HS02' ) {
			setkey(W, Sensor)
			Ws <- W[.(c('HS02'))]

			} else {
			message('no valid movement_variable')
			}




#####################################################
#		'REC', 'RATIO', 'DET', 'DIV', 

yminmax <- c(0,1)
prec <- ggplot(Ws, aes(x=Participant) ) + 
 	geom_point( aes(y=REC, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	coord_cartesian(xlim=NULL, ylim=yminmax ) + 
	facet_grid(Axis~Activity) +    
	theme_bw(base_size=basesizefont)+	
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
	theme(legend.position = 'none' )

yminmax <- c(0.75,1.25)
pdet <- ggplot(Ws, aes(x=Participant) ) + 
 	geom_point( aes(y=DET, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	coord_cartesian(xlim=NULL, ylim=yminmax ) + 
	facet_grid(Axis~Activity) +    
	theme_bw(base_size=basesizefont)+	
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
	theme(legend.position = 'none' )

yminmax <- c(0,50)
pratio <- ggplot(Ws, aes(x=Participant) ) + 
 	geom_point( aes(y=RATIO, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	coord_cartesian(xlim=NULL, ylim=yminmax ) + 
	facet_grid(Axis~Activity) +    
	theme_bw(base_size=basesizefont)+	
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
	theme(legend.position = 'none' )


yminmax <- c(0.5,1.5)
plam <- ggplot(Ws, aes(x=Participant) ) + 
 	geom_point( aes(y=LAM, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	coord_cartesian(xlim=NULL, ylim=yminmax ) + 
	facet_grid(Axis~Activity) +    
	theme_bw(base_size=basesizefont)+	
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
	theme(legend.position = 'none' )


yminmax <- c(0, 5)
pentr <- ggplot(Ws, aes(x=Participant) ) + 
 	geom_point( aes(y=ENTR, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	coord_cartesian(xlim=NULL, ylim=yminmax ) + 
	facet_grid(Axis~Activity) +    
	theme_bw(base_size=basesizefont)+	
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
	theme(legend.position = 'none' )




#plmax <- ggplot(Ws, aes(x=Participant) ) + 
# 	geom_point( aes(y=Lmax, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
#	
#	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Greens"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#	scale_shape_manual(values= 1:(noparticipants))+
#
#	facet_grid(Axis~Activity) +    
#	theme_bw(base_size=basesizefont)+	
#	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
#	theme(legend.position = 'none' )
#

######################################################


#pdiv <- ggplot(W, aes(x=Participant) ) + 
# 	geom_point( aes(y=DIV, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
#	facet_grid(Axis~Activity) +    
#	theme_bw(base_size=basesizefont)+	
#	theme(legend.position = 'none' )
#
######################################################
## 'Lmax', 'Lmean', 'LmeanWithoutMain',

#plmean <- ggplot(W, aes(x=Participant) ) + 
# 	geom_point( aes(y=Lmean, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
#	facet_grid(Axis~Activity) +    
#	theme_bw(base_size=basesizefont)+	
#	theme(legend.position = 'none' )
#
#plmwm <- ggplot(W, aes(x=Participant) ) + 
# 	geom_point( aes(y=LmeanWithoutMain, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+
#	facet_grid(Axis~Activity) +    
#	theme_bw(base_size=basesizefont)+	
#	theme(legend.position = 'none' )
#
#

######################################################
## 'Vmax', 'Vmean'
#pvmax <- ggplot(W, aes(x=Participant) ) + 
# 	geom_point( aes(y=Vmax, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
#	facet_grid(Axis~Activity) +    
#	theme_bw(base_size=basesizefont)+	
#	theme(legend.position = 'none' )
#
#pvmean <- ggplot(W, aes(x=Participant) ) + 
# 	geom_point( aes(y=Vmean, shape=factor(Participant), colour=factor(Participant)  ), size=5, stroke =1 )+	
#	facet_grid(Axis~Activity) +    
#	theme_bw(base_size=basesizefont)+	
#	theme(legend.position = 'none' )
#
#
#
#



### Save Picture
################################################################################
# (5.0) Creating  and Changing to PlotPath
plot_path <- paste(outcomes_plot_path, '/rqa_plots', '/', activitytag, sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}

## Picture parameters
width = 1000
height = 600
#width = 2000
#height = 1000



text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


fext <- paste('_', windowksecs, '_', sensork ,  '_', activitytag, '.png', sep='')

#REC
filenameimage <- paste('rec', fext, sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	prec)



##DET
filenameimage <- paste('det', fext, sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pdet)



##RATIO
filenameimage <- paste('ratio', fext, sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pratio)

##LAM
filenameimage <- paste('lam', fext, sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	plam)




##ENTR
filenameimage <- paste('entr', fext, sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pentr)


##', 'DIV',  'Lmax', 'Lmean', 'LmeanWithoutMain',
## Vmax', 'Vmean'


}##end##for (sensor_k in 1:length(sensors) ) {
#################################################################################
#################################################################################
#################################################################################
#################################################################################



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
