#R code
library(data.table)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(reshape)
library(scales)
library(stringr)

Neu_table <- read_tsv('data/neut.tsv')
Ab_levels <- rev(Neu_table$Antibody)
setDT(Neu_table)
Neu_table <- melt(Neu_table,id='Antibody') %>%
               mutate(Antibody=factor(Antibody, levels=Ab_levels))
textsize <- 7
p <- ggplot(data=Neu_table, aes(x=variable, y=Antibody, fill=log10(value))) +
	    geom_tile() + 
	    scale_fill_gradientn(colours=c("red", "yellow", "white"),
                limits=c(-3,2),
                values=rescale(c(-3, -0.5, 2)),
                breaks=c(-3,-2,-1,0,1,2),
                labels=c('0.001','0.01','0.1','1','10','100'),
		guide="colorbar",
		na.value="grey") +
	    theme_classic() +
            theme(plot.background = element_rect(fill = "white"),
                axis.text=element_text(size=textsize,face="bold",colour = 'black'),
                axis.text.x=element_text(angle=90,hjust=1,vjust=0.5,colour = 'black'),
                axis.text.y=element_text(hjust=1,vjust=0.5,colour = 'black'),
                axis.title=element_text(size=7,face="bold"),
                axis.line = element_line(colour = 'black', size = 0),
                legend.title=element_blank(),
                legend.text=element_text(size=textsize,face="bold"),
                legend.position='none',
                panel.border = element_rect(colour = "black", fill=NA, size=1)) +
            xlab("") +
            ylab("")
ggsave('graph/neut_heatmap.png',p, height=1.8, width=1.9, bg='white', dpi=600)
