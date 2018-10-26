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
version <- '01'
feature_path <- '/utde/minimum_embedding_parameters-hii/ami'

## Outcomes Plot Path
outcomes_plot_path <- paste(github_path,"/phd-thesis/figs/results", feature_path, '/v', version,sep="")

## Data Path
data_path <- paste(github_repo_path,'/data-outputs', feature_path, '/v', version, sep="")
setwd(file.path(data_path))




################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data

library(ggplot2)
library(RColorBrewer) #for brewer.pal


###############################################################################
## (2) Reading data


noparticipants <- 6


#AMI <- fread('AMI-w2.dt', header=TRUE)
#MTD <- fread('MTD-w2.dt', header=TRUE)
#windowl<-'w2'
#

#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#
#
AMI <- fread('AMI-w10.dt', header=TRUE)
MTD <- fread('MTD-w10.dt', header=TRUE)
windowl<-'w10'

#
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#





mainaxis <- 'GyroY'
selaXX <- c(	
	paste('sg0zmuv',mainaxis,sep=''),
	paste('sg1zmuv',mainaxis,sep=''),
	paste('sg2zmuv',mainaxis,sep='')
	)

AMI <-  AMI[  axis %in% selaXX ]
MTD <-  MTD[  axis %in% selaXX ]


# Substitute axis to make shorter names for the plots
MTD$axis <- gsub('sg0zmuvGyroY', 'sg0', MTD$axis) 
MTD$axis <- gsub('sg1zmuvGyroY', 'sg1', MTD$axis) 
MTD$axis <- gsub('sg2zmuvGyroY', 'sg2', MTD$axis) 






################################################################################
### (5.2) Creating and Changing to Preprosseced Data Path

if (file.exists(outcomes_plot_path)){
    setwd(file.path(outcomes_plot_path))
} else {
  dir.create(outcomes_plot_path, recursive=TRUE)
  setwd(file.path(outcomes_plot_path))
}




#yminmax <- c(0,30)
#plotlinewidth <- 0.9
#basesizefont <- 18
#
#
#####no BEAT
#HNMTD <- MTD[Activity=='VNnb', .SDcols=cols  ]
#HS01HNMTD <- HNMTD[sensor=='HS01', .SDcols=cols  ]
#pHS01HNMTD <- ggplot(HS01HNMTD, aes(x=participant) ) + 
#		geom_point( aes( y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#	
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
#		theme(legend.position = 'none' )
#
#
#HS02HNMTD <- HNMTD[sensor=='HS02', .SDcols=cols  ]
#pHS02HNMTD <- ggplot(HS02HNMTD, aes(x=participant) ) + 
#		geom_point( aes( y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#	
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
#		theme(legend.position = 'none' )
#
#
#
#
#
#
#
#HFMTD <- MTD[Activity=='VFnb', .SDcols=cols  ]
#HS01HFMTD <- HFMTD[sensor=='HS01', .SDcols=cols  ]
#pHS01HFMTD <- ggplot(HS01HFMTD, aes(x=participant) ) + 
#		geom_point( aes(y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#		
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )  + 
#		theme(legend.position = 'none' )
#
#
#
#HS02HFMTD <- HFMTD[sensor=='HS02', .SDcols=cols  ]
#pHS02HFMTD <- ggplot(HS02HFMTD, aes(x=participant) ) + 
#		geom_point( aes(y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#		
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )  + 
#		theme(legend.position = 'none' )
#
#
#
#
#
#
#
#
#
#### Save Pictures
#width = 1200
#height = 300
#text.factor = 1
#dpi <- text.factor * 100
#width.calc <- width / dpi
#height.calc <- height / dpi
#
#
#tagim <- paste( '-window-', windowl, sep='')
#tagfile <- 'mindelaysi_'
#
#filenameimage <- paste(tagfile, "HS01_VNnb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS01HNMTD
#	)
#
#
#filenameimage <- paste(tagfile, "HS02_VNnb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS02HNMTD
#	)
#
#
#filenameimage <- paste(tagfile, "HS01_VFnb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS01HFMTD
#	)
#
#
#filenameimage <- paste(tagfile, "HS02_VFnb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS02HFMTD
#	)
#
#
#
#
###### with BEAT
#HNMTD <- MTD[Activity=='VNwb', .SDcols=cols  ]
#HS01HNMTD <- HNMTD[sensor=='HS01', .SDcols=cols  ]
#pHS01HNMTD <- ggplot(HS01HNMTD, aes(x=participant) ) + 
#		geom_point( aes( y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#	
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
#		theme(legend.position = 'none' )
#
#
#HS02HNMTD <- HNMTD[sensor=='HS02', .SDcols=cols  ]
#pHS02HNMTD <- ggplot(HS02HNMTD, aes(x=participant) ) + 
#		geom_point( aes( y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#	
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
#		theme(legend.position = 'none' )
#
#
#
#
#
#
#
#HFMTD <- MTD[Activity=='VFwb', .SDcols=cols  ]
#HS01HFMTD <- HFMTD[sensor=='HS01', .SDcols=cols  ]
#pHS01HFMTD <- ggplot(HS01HFMTD, aes(x=participant) ) + 
#		geom_point( aes(y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#		
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )  + 
#		theme(legend.position = 'none' )
#
#
#
#HS02HFMTD <- HFMTD[sensor=='HS02', .SDcols=cols  ]
#pHS02HFMTD <- ggplot(HS02HFMTD, aes(x=participant) ) + 
#		geom_point( aes(y=timedelays, colour=factor(participant), shape=factor(participant)  ), size=5 ) +
#		
#		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
#    		scale_shape_manual(values= 1:(noparticipants))+
#
#		facet_grid(.~axis) + 
#		xlab('Participant') + 
#		ylab('1st min AMI') +
#		coord_cartesian(xlim=NULL, ylim=yminmax ) + 
#		theme_bw(base_size=basesizefont) +
#		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )  + 
#		theme(legend.position = 'none' )
#
#
#
#
#### Save Pictures
#width = 1200
#height = 300
#text.factor = 1
#dpi <- text.factor * 100
#width.calc <- width / dpi
#height.calc <- height / dpi
#
#
#tagim <- paste( '-window-', windowl, sep='')
#tagfile <- 'mindelaysi_'
#
#filenameimage <- paste(tagfile, "HS01_VNwb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS01HNMTD
#	)
#
#
#filenameimage <- paste(tagfile, "HS02_VNwb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS02HNMTD
#	)
#
#
#filenameimage <- paste(tagfile, "HS01_VFwb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS01HFMTD
#	)
#
#
#filenameimage <- paste(tagfile, "HS02_VFwb", tagim, ".png",sep="")
#ggsave(filename = filenameimage,
#        dpi = dpi,
#        width = width.calc,
#        height = height.calc,
#        units = 'in',
#        bg = "transparent",
#        device = "png",
#	pHS02HFMTD
#	)
#
#
#
#



###################################################################
### Miminum Embedding Plots


yminmax <- c(0,30)
plotlinewidth <- 0.9
basesizefont <- 18


#### no BEAT
HNMTD <- MTD[Activity=='VNnb', .SDcols=cols  ]
HS01HNMTD <- HNMTD[sensor=='HS01', .SDcols=cols  ]


pHS01HNMTD <-  ggplot(HS01HNMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


HS02HNMTD <- HNMTD[sensor=='HS02', .SDcols=cols  ]
pHS02HNMTD <- ggplot(HS02HNMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


HFMTD <- MTD[Activity=='VFnb', .SDcols=cols  ]
HS01HFMTD <- HFMTD[sensor=='HS01', .SDcols=cols  ]
pHS01HFMTD <- ggplot(HS01HFMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


HS02HFMTD <- HFMTD[sensor=='HS02', .SDcols=cols  ]
pHS02HFMTD <- ggplot(HS02HFMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")



### Save Pictures
width = 300
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


tagim <- paste( 'nb','-window-', windowl, sep='')
tagfile <- 'boxplots_'

filenameimage <- paste(tagfile, "HS01_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01HNMTD
	)


filenameimage <- paste(tagfile, "HS02_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS02HNMTD
	)


filenameimage <- paste(tagfile, "HS01_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01HFMTD
	)


filenameimage <- paste(tagfile, "HS02_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS02HFMTD
	)




####        WITH BEAT
HNMTD <- MTD[Activity=='VNwb', .SDcols=cols  ]

HS01HNMTD <- HNMTD[sensor=='HS01', .SDcols=cols  ]
pHS01HNMTD <-  ggplot(HS01HNMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


HS02HNMTD <- HNMTD[sensor=='HS02', .SDcols=cols  ]
pHS02HNMTD <- ggplot(HS02HNMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


HFMTD <- MTD[Activity=='VFwb', .SDcols=cols  ]
HS01HFMTD <- HFMTD[sensor=='HS01', .SDcols=cols  ]
pHS01HFMTD <- ggplot(HS01HFMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


HS02HFMTD <- HFMTD[sensor=='HS02', .SDcols=cols  ]
pHS02HFMTD <- ggplot(HS02HFMTD, aes(x=axis, y=timedelays) )+
          geom_point(aes(fill=axis),
                    alpha=0.8,
                    size=4,
                    shape=21,
                    position=position_jitter(width=0.15, height=0)  )+
        geom_boxplot(lwd=1,outlier.colour=NA, fill=NA)+
        # geom_boxplot(lwd=1,outlier.colour = c("grey40") , outlier.size=4)+
        labs(x= "Axis", y="1st min AMI")+
         theme_bw(15)+
         theme(panel.grid.minor= element_blank(),
               panel.border=element_rect(color="black"),
               legend.position="none")+
	coord_cartesian(ylim= yminmax)+
	theme_bw(base_size=basesizefont) +
	theme(legend.position = 'none' ) +
	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
  	stat_summary(fun.y = mean, geom = "point", shape = 23, size = 4, fill = "gray")


### Save Pictures
width = 300
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


tagim <- paste( 'wb','-window-', windowl, sep='')
tagfile <- 'boxplots_'

filenameimage <- paste(tagfile, "HS01_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01HNMTD
	)


filenameimage <- paste(tagfile, "HS02_VN", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS02HNMTD
	)



filenameimage <- paste(tagfile, "HS01_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS01HFMTD
	)


filenameimage <- paste(tagfile, "HS02_VF", tagim, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pHS02HFMTD
	)





#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
