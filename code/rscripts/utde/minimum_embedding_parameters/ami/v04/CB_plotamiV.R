###############################################################################	
#
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

###############################################################################	
	# TABLE OF CONTENT:
 	# (0) Definifing paths 
	# (1) Loading libraries and functions
	# (2) Reading data
	
	# (4) Filtering data.table variables
		# (4.1) Windowing data
		# (4.2) Filtering variables
			# (4.2.1) Sensor Selection
			# (4.2.2) Activities Selection
			# (4.2.3) Participant Selection
			# (4.2.4) Axis Selection

	# (5) Average Mutual Information 
		# (5.1) Plot Avarage Mutual Information 
		# (5.2) Creating and Changing to Preprosseced Data Path



#################
# Start the clock!
start.time <- Sys.time()




################################################################################
# (0) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()

setwd("../../../../../../")
github_repo_path <- getwd()
setwd("../")
github_path <- getwd()


##VERSION 
version <- '04'
feature_path <- '/utde/minimum_embedding_parameters/ami'

## Outcomes Plot Path
#outcomes_plot_path <- paste(github_path,'/hwum-manuscript/figures/results', feature_path, '/v', version, sep="")
outcomes_plot_path <- paste(github_path,"/phd-thesis/figs/results", feature_path, '/v', version,sep="")

## Data Path
data_path <- paste(github_repo_path,'/data-outputs', feature_path, '/v', version, sep="")
setwd(file.path(data_path))





################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data

library(ggplot2)
library(RColorBrewer) #for brewer.pal


################################################################################
# (2) Reading data


noparticipants <- 20


AMI <- fread('AMI-w2.dt', header=TRUE)
MTD <- fread('MTD-w2.dt', header=TRUE)
windowl<-'w2'


#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#

#AMI <- fread('AMI-w10.dt', header=TRUE)
#MTD <- fread('MTD-w10.dt', header=TRUE)
#windowl<-'w10'
#
##
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
#

mainaxis <- 'GyroY'
selaXX <- c(	
	paste('sg0zmuv',mainaxis,sep=''),
	paste('sg1zmuv',mainaxis,sep=''),
	paste('sg2zmuv',mainaxis,sep='')
	)

AMI <-  AMI[  axis %in% selaXX ]
MTD <-  MTD[  axis %in% selaXX ]





################################################################################
### (5.2) Creating and Changing to Preprosseced Data Path

if (file.exists(outcomes_plot_path)){
    setwd(file.path(outcomes_plot_path))
} else {
  dir.create(outcomes_plot_path, recursive=TRUE)
  setwd(file.path(outcomes_plot_path))
}

plotlinewidth <- 0.9
basesizefont <- 18

VNAMI <- AMI[Activity=='VN', .SDcols=cols  ]
HS01VNAMI <- VNAMI[sensor=='HS01', .SDcols=cols  ]
pHS01VNAMI <- ggplot(HS01VNAMI, aes(x=tau) ) + 
	geom_line( aes(y=ami ),lwd = plotlinewidth, alpha=0.7 ) + 
	facet_grid(participant~axis) + 
	ylab('AMI') + xlab('Tau') + 
	theme_bw(base_size=basesizefont) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )

RS01VNAMI <- VNAMI[sensor=='RS01', .SDcols=cols  ]
pRS01VNAMI <- ggplot(RS01VNAMI, aes(x=tau) ) + 
	geom_line( aes(y=ami ),lwd = plotlinewidth, alpha=0.7 ) + 
	facet_grid(participant~axis) + 
	ylab('AMI') + xlab('Tau') + 
	theme_bw(base_size=basesizefont) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )




VFAMI <- AMI[Activity=='VF', .SDcols=cols  ]
HS01VFAMI <- VFAMI[sensor=='HS01', .SDcols=cols  ]
pHS01VFAMI <- ggplot(HS01VFAMI, aes(x=tau) ) + 
	geom_line( aes(y=ami ),lwd = plotlinewidth, alpha=0.7 ) + 
	facet_grid(participant~axis) + 
	ylab('AMI') + xlab('Tau') + 
	theme_bw(base_size=basesizefont) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )

RS01VFAMI <- VFAMI[sensor=='RS01', .SDcols=cols  ]
pRS01VFAMI <- ggplot(RS01VFAMI, aes(x=tau) ) + 
	geom_line( aes(y=ami ),lwd = plotlinewidth, alpha=0.7 ) + 
	facet_grid(participant~axis) + 
	ylab('AMI') + xlab('Tau') + 
	theme_bw(base_size=basesizefont) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )






### Save Picture
width = 1500
height = 2000
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


tagim <- paste( '-window-', windowl, sep='')

filenameimage <- paste("ami_HS01_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01VNAMI)

filenameimage <- paste("ami_RS01_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pRS01VNAMI)



filenameimage <- paste("ami_HS01_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01VFAMI)

filenameimage <- paste("ami_RS01_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pRS01VFAMI)








###################################################################
### Miminum Embedding Plots


yminmax <- c(0,20)
plotlinewidth <- 0.9
basesizefont <- 18

VNMTD <- MTD[Activity=='VN', .SDcols=cols  ]
HS01VNMTD <- VNMTD[sensor=='HS01', .SDcols=cols  ]
pHS01VNMTD <- ggplot(HS01VNMTD, aes(x=participant) ) + 
		geom_point( aes( y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
	
		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
    		scale_shape_manual(values= 1:(noparticipants))+

		facet_grid(.~axis) + 
		xlab('Participant') + 
		ylab('1st min AMI') +
		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
		theme_bw(base_size=basesizefont) +
		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
		theme(legend.position = 'none' )


RS01VNMTD <- VNMTD[sensor=='RS01', .SDcols=cols  ]
pRS01VNMTD <- ggplot(RS01VNMTD, aes(x=participant) ) + 
		geom_point( aes( y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
	
		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
    		scale_shape_manual(values= 1:(noparticipants))+

		facet_grid(.~axis) + 
		xlab('Participant') + 
		ylab('1st min AMI') +
		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
		theme_bw(base_size=basesizefont) +
		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
		theme(legend.position = 'none' )







VFMTD <- MTD[Activity=='VF', .SDcols=cols  ]
HS01VFMTD <- VFMTD[sensor=='HS01', .SDcols=cols  ]
pHS01VFMTD <- ggplot(HS01VFMTD, aes(x=participant) ) + 
		geom_point( aes(y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
		
		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
    		scale_shape_manual(values= 1:(noparticipants))+

		facet_grid(.~axis) + 
		xlab('Participant') + 
		ylab('1st min AMI') +
		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
		theme_bw(base_size=basesizefont) +
		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )  + 
		theme(legend.position = 'none' )



RS01VFMTD <- VFMTD[sensor=='RS01', .SDcols=cols  ]
pRS01VFMTD <- ggplot(RS01VFMTD, aes(x=participant) ) + 
		geom_point( aes(y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
		
		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
    		scale_shape_manual(values= 1:(noparticipants))+

		facet_grid(.~axis) + 
		xlab('Participant') + 
		ylab('1st min AMI') +
		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
		theme_bw(base_size=basesizefont) +
		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )  + 
		theme(legend.position = 'none' )















### Save Picture
width = 1200
height = 300
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


tagim <- paste( '-window-', windowl, sep='')
tagfile <- 'mindelaysi_'

filenameimage <- paste(tagfile, "HS01_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01VNMTD
	)


filenameimage <- paste(tagfile, "RS01_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pRS01VNMTD
	)


filenameimage <- paste(tagfile, "HS01_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01VFMTD
	)


filenameimage <- paste(tagfile, "RS01_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pRS01VFMTD
	)




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
