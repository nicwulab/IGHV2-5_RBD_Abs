library(ggplot2)
library(RColorBrewer)
library(readxl)
library(dplyr)
require(cowplot)
library(stringr)

plot_error_bar <- function(data,graphname){
  palette  <- c(brewer.pal(3,"Accent"))
  textsize <- 7
  p <-  ggplot() +
          geom_bar(data=data, aes(x=V_gene, y=mean*100, fill=type), stat='identity', width=0.6, position=position_dodge()) +
          scale_fill_manual(values=palette,drop=FALSE) +
          geom_errorbar(data = data,aes(x=V_gene,ymin=(mean-SD)*100, ymax=(mean+SD)*100,group=type),
                        size=0.25, width=0.5,position=position_dodge(), color='gray30') +
          theme_cowplot(12) +
          theme(axis.text=element_text(size=textsize,face="bold",colour = 'black'),
                axis.text.x=element_text(angle=45,hjust=0.5,vjust=0.5,colour = 'black'),
                axis.text.y=element_text(hjust=0.5,vjust=0.5,colour = 'black'),
                axis.title.x=element_blank(),
                axis.title.y=element_text(size=textsize,face="bold"),
                axis.line = element_line(colour = 'black', size = 0),
                panel.border = element_rect(colour = "black", fill=NA, size=1),
                legend.position = "right",
                legend.title    = element_text(size=textsize,face="bold"),
                legend.text=element_text(size=textsize,face="bold"),
                legend.justification='center',
                legend.key.size = unit(0.3,"line")) +
          ylab("frequency (%)")
  ggsave(graphname,p,width=3, height=3, bg='white', dpi=1200)
}
VH_baseline_df <- read_excel('data/HV_2-5_freq.xlsx')%>%
  select(V_gene,mean,SD)%>%
  mutate(type='healthy donors')

# VH_baseline_df$V_gene <- str_replace(VH_baseline_df$V_gene, "IGHV", "HV")

plot_error_bar(VH_baseline_df, 'graph/Vgene2-5_baseline.png')
