###############################################################################	
#
# Recurrence plot for periodic (super-posited harmonic oscillations)
# 
#
#
#
#
#
#
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
 	# (1) Definifing paths
	# (2) Lorez Time Series
	# (3) Plotting State Spaces
	# (4) Computing Recurrence Quantification Parameters
	# (5) Plotting Recurrence Plot




#################
# Start the clock!
start.time <- Sys.time()

################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()
setwd("../")
main_path <- getwd()
figures_path <- paste(main_path,'/src',sep="")
setwd("../../../")
github_path <- getwd()




################################################################################
# (0) Loading Functions and Libraries
library(data.table)
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)

################################################################################
# (1) SineWaves
## `emailing-authors/exrps.m` L39
##N=400;X=crp(sin(.2*[1:N]').*sin(.05*[1:N]'),1,31,.4,'sil');

N <- 400
tn <- 0:N
tsn <- sin ( (1/5)*tn ) * sin ( (5/100)*tn  )
tsn <- as.data.table(tsn)

tsn [,n:= 0:(.N-1),]
setcolorder(tsn, c(2,1))
names(tsn) <- c('tn', 'ftn')


#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- tsn$ftn
rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
                radius=0.4,lmin=2,vmin=2,do.plot=FALSE, distanceToBorder=2)


#################################################################################
## (3) Plotting Recurrence Plot
##
plot_path <- paste(figures_path, sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}



### Calling `extra_rqa`
source( paste(github_path,'/code/rfunctions/extra_rqa.R',sep='') )

rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]

RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )

filenametag <- paste('B-',N,'.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


#rplot <- plotRecurrencePlot(RM,maxsamplerp)
#savePlot(filename_extension,width,height,rplot)

rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
saveRP(filename_extension,width,height,rplot2)




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
