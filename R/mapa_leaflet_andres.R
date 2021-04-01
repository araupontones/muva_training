library(pacman)

p_load(rio, tidyverse, janitor, leaflet, sf)

list.files("Data/trenamento_mapas")

dir_data_maps = "Data/trenamento_mapas"


#importar dados -----------------------------------------

susamati_points_raw = import(file.path(dir_data_maps, "Base de dados 15 de Agosto.xlsx"))
susamati_points = susamati_points_raw %>% 
        
mutate(tipo_latrina = factor(tipo_latrina))
# %>%
#mutate(tipo_latrina = str_remove(tipo_latrina," ligad[a-z] a um buraco no chão" ))
str(susamati_points)


unique(susamati_points$tipo_latrina)


######Cores do MUVA
#####agua_MUVA = "#5DD4C7"
#####purple_MUVA = "#9D57D2"
#####orange_MUVA = "#F77333"
#####darkblue = "#1F2136"
#####grey = "#cccccc"
pal <- colorFactor(c("#5DD4C7", "#F77333", 'green', "maroon", 'orange', "black", "red", 'purple'),
 domain = susamati_points$tipo_latrina)

susamati_points %>%
  janitor::tabyl(tipo_latrina)
  
view(susamati_points_raw)

leaflet(data = susamati_points) %>%
  addTiles() %>%
  leaflet::addCircleMarkers(label = ~nome,
                            radius = 3,
                            color = ~pal(tipo_latrina)) %>%
  addLegend("topright", pal = pal, values =~tipo_latrina, title = "Tipo de Latrina")
  
 


 
