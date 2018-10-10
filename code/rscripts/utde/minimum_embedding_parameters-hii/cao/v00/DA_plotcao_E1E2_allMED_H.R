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
# please create an issue at https://github.com/mxochicale/phd-thesis-code-data/issues

###############################################################################	
	# TABLE OF CONTENT:
 	# (0) Definifing paths 
	# (1) Loading libraries and functions
	# (2) Reading data

	# (6) Plot E values
		# (6.1) main if for:
			# (6.1.0) Creating paths for plots
			# (6.1.1) E1 and E2 values
			# (6.1.2) Minimum Embedding Dimensions Plots


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
version <- '00'
feature_path <- '/utde/minimum_embedding_parameters-hii/cao'

## Outcomes Plot Path
outcomes_plot_path <- paste(github_path,"/phd-thesis/figs/results", feature_path, '/v', version,sep="")
## Data Path
data_path <- paste(github_repo_path,'/data-outputs', feature_path, '/v', version, sep="")
setwd(file.path(data_path))


################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(ggplot2)
library(data.table) # for manipulating data
library(RColorBrewer) #for brewer.pal

################################################################################
# (2) Reading data




windowl<-'w10'
aMED <- fread('aMED-H-w10.dt', header=TRUE)
MED <- fread('MED-w10.dt', header=TRUE)
EE <- fread('EE-w10.dt', header=TRUE)









#################################################################################
#### (6) Plot E values


# (6.1.1)  Creating paths for plots
if (file.exists(outcomes_plot_path)){
    setwd(file.path(outcomes_plot_path))
} else {
  dir.create(outcomes_plot_path, recursive=TRUE)
  setwd(file.path(outcomes_plot_path))
}








#################################
# () filtering participants/axis/ etc

#taus <- c('1') 
#taus <- c('1', '2', '3', '4', '5') 
#selpNN <- c('p01','p02', 'p03') 
#selaXX <- c('AccX','AccY', 'AccZ') 
#aee <-  eHw10[ tau %in% taus &  participant %in% selpNN & axis %in% selaXX ]



noparticipants <- 3
selpNN <- c('p04', 'p05', 'p10')
#selpNN <- c('p01', 'p02', 'p03')
#selpNN <- c('p01', 'p02', 'p03', 'p04', 'p05')
#selpNN <- c('p01', 'p02', 'p03', 'p04', 'p05', 'p06', 'p07', 'p08', 'p09', 'p10')

#noparticipants <- 20
#selpNN <- c('p01', 'p02', 'p03', 'p04', 'p05', 'p06', 'p07', 'p08', 'p09', 'p10',
#	    'p11', 'p12', 'p13', 'p14', 'p15', 'p16', 'p17', 'p18', 'p19', 'p20')	
#


mainaxis <- 'GyroZ'
selaXX <- c(	
	paste('sg0zmuv',mainaxis,sep=''),
	paste('sg1zmuv',mainaxis,sep=''),
	paste('sg2zmuv',mainaxis,sep='')
	)

aee <-  EE[ Participant %in% selpNN & axis %in% selaXX ]
me <-  MED[ Participant %in% selpNN & axis %in% selaXX ]

##### Reorder Factor for axis sensors in the ggplot data.table
me$axis <- factor(me$axis)
me$axis <- factor(me$axis, levels= levels (me$axis)[c(5,1,2,3,4)] )

##### Reorder Factor for axis sensors in the ggplot data.table
aee$axis <- factor(aee$axis)
aee$axis <- factor(aee$axis, levels= levels (aee$axis)[c(5,1,2,3,4)] )














##########################
## (4.2.1) Activities Selection
movement_variables <- c('HNnb', 'HNwb', 'HFnb', 'HFwb')

###########################################################
###########################################################
###########################################################
###########################################################
for (movement_k in 1:length(movement_variables) ) {

EE <- NULL # contains E1E2 values for partiicpants, axis, sensor
MED <- NULL # contains minembdimvals for movement, part, axis, sensor


movement_variable <- movement_variables[movement_k]
message(movement_variable)

mem <- me
aeem <- aee

###
amed<- aMED



if (movement_variable == 'HNnb' ) {
setkey(mem, Activity)
mem <- mem[.(c('HNnb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('HNnb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('HNnb'))]



} else if (movement_variable == 'HNwb' ) {
setkey(mem, Activity)
mem <- mem[.(c('HNwb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('HNwb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('HNwb'))]



} else if (movement_variable == 'HFnb') {
setkey(mem, Activity)
mem <- mem[.(c('HFnb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('HFnb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('HFnb'))]



} else if (movement_variable == 'HFwb') {
setkey(mem, Activity)
mem <- mem[.(c('HFwb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('HFwb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('HFwb'))]



} else {
message('no valid movement_variable')
}









####() E1 and E2 values  Plots



delta_ee<-0.1
maxtau <- 10
maxdim <- 10

plotlinewidth <- 1.2
ylim_max <- 1.5
basesizefont <- 18

tagfilename <- paste('-', windowl, '-', movement_variable, sep='') 


hEE <- aeem[Sensor=='HS01', .SDcols=cols  ]
he1 <- ggplot(hEE, aes(x=dim) ) + 
	geom_line( aes(y=E1, colour=factor(tau) ),lwd = plotlinewidth, alpha=0.5 ) + 	
    	geom_point( aes(y=E1, shape=factor(tau), colour=factor(tau)  ), size=5, stroke =1 )+
	geom_hline(yintercept = 1+delta_ee) + 
	geom_hline(yintercept = 1-delta_ee) +
	annotate("text", 0, 1, vjust = -1, label = paste( '1 +/- ', delta_ee, sep='') )+

     	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*maxtau)[(maxtau+1):(2*maxtau)]  ) +
    	scale_shape_manual(values= 1:(maxtau))+

    	coord_cartesian(xlim = c(0, (maxdim-1) ), ylim = c(0, ylim_max ) )+
	facet_grid(Participant~axis) + 
	theme_bw(base_size=basesizefont) +
	ylab('E1') + 
	xlab('Dimension, m') 
	#theme(legend.position = c(0.9, 0.3) )

he2 <- ggplot(hEE, aes(x=dim) ) + 
	geom_line( aes(y=E2, colour=factor(tau) ),lwd = plotlinewidth, alpha=0.5 ) + 
    	geom_point( aes(y=E2, shape=factor(tau), colour=factor(tau)  ), size=5, stroke =1 )+
	geom_hline(yintercept = 1) + 
    	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*maxtau)[(maxtau+1):(2*maxtau)]  ) +
    	scale_shape_manual(values= 1:(maxtau))+

    	coord_cartesian(xlim = c(0, (maxdim-1) ), ylim = c(0, ylim_max ) )+
	facet_grid(Participant~axis) + 
	theme_bw(base_size=basesizefont) +
	theme_bw(20)+	
	ylab('E2') + 
	xlab('Dimension, m')


### Save Picture
width = 2500
height = 1000
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi



filenameimage <- paste("e1-HS01-", tagfilename, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	he1)


filenameimage <- paste("e2-HS01-", tagfilename, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	he2)

hEE <- aeem[Sensor=='HS02', .SDcols=cols  ]
he1 <- ggplot(hEE, aes(x=dim) ) + 
	geom_line( aes(y=E1, colour=factor(tau) ),lwd = plotlinewidth, alpha=0.5 ) + 	
    	geom_point( aes(y=E1, shape=factor(tau), colour=factor(tau)  ), size=5, stroke =1 )+
	geom_hline(yintercept = 1+delta_ee) + 
	geom_hline(yintercept = 1-delta_ee) +
	annotate("text", 0, 1, vjust = -1, label = paste( '1 +/- ', delta_ee, sep='') )+

     	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*maxtau)[(maxtau+1):(2*maxtau)]  ) +
    	scale_shape_manual(values= 1:(maxtau))+

    	coord_cartesian(xlim = c(0, (maxdim-1) ), ylim = c(0, ylim_max ) )+
	facet_grid(Participant~axis) + 
	theme_bw(base_size=basesizefont) +
	ylab('E1') + 
	xlab('Dimension, m') 
	#theme(legend.position = c(0.9, 0.3) )

he2 <- ggplot(hEE, aes(x=dim) ) + 
	geom_line( aes(y=E2, colour=factor(tau) ),lwd = plotlinewidth, alpha=0.5 ) + 
    	geom_point( aes(y=E2, shape=factor(tau), colour=factor(tau)  ), size=5, stroke =1 )+
	geom_hline(yintercept = 1) + 
    	
	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*maxtau)[(maxtau+1):(2*maxtau)]  ) +
    	scale_shape_manual(values= 1:(maxtau))+

    	coord_cartesian(xlim = c(0, (maxdim-1) ), ylim = c(0, ylim_max ) )+
	facet_grid(Participant~axis) + 
	theme_bw(base_size=basesizefont) +
	theme_bw(20)+	
	ylab('E2') + 
	xlab('Dimension, m')


### Save Picture
width = 2500
height = 1000
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi



filenameimage <- paste("e1-HS02-", tagfilename, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	he1)


filenameimage <- paste("e2-HS02-", tagfilename, ".png",sep="")
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	he2)





#####() Minimum Embedding Dimensions Plots

noparticipants <- 3
#noparticipants <- 6
#noparticipants <- 20
basesizefont <- 18
#plotlinewidth <- 1.2
#ylim_max <- 1.5


meh <- mem[Sensor=='HS01', .SDcols=cols  ]
mih <- ggplot(meh, aes(x=tau, y=minEmdDim) ) + 
	geom_point( aes(  colour= factor(Participant), shape= factor(Participant) ), size=5 ) + 

	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	facet_grid(Participant~axis) + ylab("Minimum Embedding Dimensions") + 
	coord_cartesian(xlim=NULL, ylim=c(0,10)  ) +
	theme_bw(base_size=basesizefont) +
       	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )



mer <- mem[Sensor=='HS02', .SDcols=cols  ]
mir <- ggplot(mer, aes(x=tau, y=minEmdDim) ) + 
	geom_point( aes(  colour= factor(Participant), shape= factor(Participant) ), size=5 ) + 

	scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Blues"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
	scale_shape_manual(values= 1:(noparticipants))+

	facet_grid(Participant~axis) + ylab("Minimum Embedding Dimensions") + 
	coord_cartesian(xlim=NULL, ylim=c(0,10)  ) +
	theme_bw(base_size=basesizefont) +
       	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )





### Save Picture
width = 1000
height = 1500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


tagfilename <- paste('-', windowl, '-', movement_variable, sep='') 
filenameimage <- paste('mindimHS01', tagfilename, '.png',sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	mih)



tagfilename <- paste('-', windowl, '-', movement_variable, sep='') 
filenameimage <- paste('mindimHS02', tagfilename, '.png',sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	mir)








}##end##for (movement_k in 1:length(movement_variables) ) {
###########################################################
###########################################################
###########################################################
###########################################################






#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
