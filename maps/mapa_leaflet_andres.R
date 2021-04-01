library(pacman)

p_load(rio, tidyverse, janitor, leaflet, sf)

list.files("maps/Data")

dir_data_maps = "maps/Data"

#importar kml

bairro_boundaries = st_read(file.path(dir_data_maps, "Bairro 25 de junho.kml"))
test = st_transform(bairro_boundaries, 4326)
st_bbox(test)
#importar dados -----------------------------------------

susamati_points_raw = import(file.path(dir_data_maps, "Cópia de Susamati.xlsx"))
susamati_points = susamati_points_raw %>% 
  select(nome,bairro, Longitude, Latitude, tipo_latrina) %>%
  filter(tipo_latrina != ".a") %>%
  filter(!nome %in% c("PEDRO FELIZARDA", "PINTO JOSINE", "ALFREDO ANTÓNIO",
                      "FERNANDO GUAMBE", "FATIMA JOÃO BOA", "FERNANDO LOPES")) %>%
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
 domain = susamati_points$tipo_latrina
)

susamati_points %>%
  janitor::tabyl(tipo_latrina)
  
view(susamati_points_raw)

leaflet(data = susamati_points) %>%
  addTiles() %>%
  leaflet::addCircleMarkers(label = ~tipo_latrina,
                            radius = 3,
                            color = ~pal(tipo_latrina)) %>%
  addLegend("topright", pal = pal, values =~tipo_latrina, title = "Tipo de Latrina")%>%
 
leaflet::addPolygons(data = test)


leaflet() %>%
  addPolygons(data = bairro_boundaries,
              color = "#444444", weight = 1, smoothFactor = 0.5)

geterrmessage()
st_crs(bairro_boundaries)
ggplot(data = bairro_boundaries)+
  geom_sf()
