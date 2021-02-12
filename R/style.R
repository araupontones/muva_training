
agua_MUVA = "#5DD4C7"
purple_MUVA = "#9D57D2"
orange_MUVA = "#F77333"
darkblue = "#1F2136"
grey = "#cccccc"


tema = theme(panel.background = element_blank(),
             panel.grid.major.y = element_blank(),
             panel.grid = element_line(linetype = 3, color = grey),
             text = element_text(family = "Verdana"),
             plot.caption = element_text(15),
             axis.title = element_text(size = 14, face = "bold", margin = margin(0,0,0,0), colour = darkblue),
             axis.text = element_text(size = 12, color = darkblue),
             axis.ticks = element_blank(),
             legend.key = element_rect(fill = "white") ,
             axis.line = element_line(color=darkblue, size = 1)
             
) 
