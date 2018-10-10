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
aMED <- fread('aMED-V-w10.dt', header=TRUE)
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




noparticipants <- 6
selpNN <- c('p01', 'p04', 'p05', 'p10', 'p11', 'p15')


#noparticipants <- 20
#selpNN <- c('p01', 'p02', 'p03', 'p04', 'p05', 'p06', 'p07', 'p08', 'p09', 'p10',
#	    'p11', 'p12', 'p13', 'p14', 'p15', 'p16', 'p17', 'p18', 'p19', 'p20')	



mainaxis <- 'GyroY'
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
movement_variables <- c('VNnb', 'VNwb', 'VFnb', 'VFwb')

#########################################################
for (movement_k in 1:length(movement_variables) ) {

EE <- NULL # contains E1E2 values for partiicpants, axis, sensor
MED <- NULL # contains minembdimvals for movement, part, axis, sensor


movement_variable <- movement_variables[movement_k]
message(movement_variable)

mem <- me
aeem <- aee

###
amed<- aMED



if (movement_variable == 'VNnb' ) {
setkey(mem, Activity)
mem <- mem[.(c('VNnb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('VNnb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('VNnb'))]



} else if (movement_variable == 'VNwb' ) {
setkey(mem, Activity)
mem <- mem[.(c('VNwb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('VNwb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('VNwb'))]



} else if (movement_variable == 'VFnb') {
setkey(mem, Activity)
mem <- mem[.(c('VFnb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('VFnb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('VFnb'))]



} else if (movement_variable == 'VFwb') {
setkey(mem, Activity)
mem <- mem[.(c('VFwb'))]
setkey(aeem, Activity)
aeem <- aeem[.(c('VFwb'))]
#####
setkey(amed, Activity)
amed <- amed[.(c('VFwb'))]



} else {
message('no valid movement_variable')
}












amedh <- amed[Sensor=='HS01', .SDcols=cols  ]

yminmax <- c(0,10)
basesizefont <- 18

pamedh <- ggplot(amedh, aes(x=Participant) ) + 
		geom_point( aes( y=aMED, colour=factor(Participant), shape=factor(Participant)  ), size=5 ) +
	
		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
    		scale_shape_manual(values= 1:(noparticipants))+

		facet_grid(.~Axis) + 
		xlab('Participant') + 
		ylab('min Emb Dim') +
		coord_cartesian(xlim=NULL, ylim= yminmax ) + 
		theme_bw(base_size=basesizefont) +
		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
		theme(legend.position = 'none' )


amedr <- amed[Sensor=='HS02', .SDcols=cols  ]

pamedr <- ggplot(amedr, aes(x=Participant) ) + 
		geom_point( aes( y=aMED, colour=factor(Participant), shape=factor(Participant)  ), size=5 ) +
	
		scale_color_manual(values = colorRampPalette(brewer.pal(n = 9, name="Reds"))(2*noparticipants)[(noparticipants+1):(2*noparticipants)]  ) +
    		scale_shape_manual(values= 1:(noparticipants))+

		facet_grid(.~Axis) + 
		xlab('Participant') + 
		ylab('min Emb Dim') +
		coord_cartesian(xlim=NULL, ylim= yminmax ) + 
		theme_bw(base_size=basesizefont) +
		theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  ) +
		theme(legend.position = 'none' )





### Save Picture
width = 1200
height = 300
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi



tagfilename <- paste('-', windowl, '-', movement_variable, sep='') 
filenameimage <- paste('avMED-HS01', tagfilename, '.png',sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pamedh)



tagfilename <- paste('-', windowl, '-', movement_variable, sep='') 
filenameimage <- paste('avMED-HS02', tagfilename, '.png',sep='')
ggsave(filename = filenameimage,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pamedr)




}##end##for (movement_k in 1:length(movement_variables) ) {







#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
