
#Example of fetching feautres from openstreet maps


#install.packages("osmdata")
#https://github.com/ropensci/osmdata
#https://wiki.openstreetmap.org/wiki/Map_features#Highway

library(osmdata)
library(tidyverse)

#streets 

trunk <- opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'highway', value = "trunk") %>%
  osmdata_sf()

primary <- opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'highway', value = "primary") %>%
  osmdata_sf()

secodary <- opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'highway', value = "secondary") %>%
  osmdata_sf()

tertiary = opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'highway', value = "tertiary") %>%
  osmdata_sf()


residential = opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'highway', value = "residential") %>%
  osmdata_sf()

#river 

river =opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'name', value = "River Thames") %>%
  osmdata_sf()

#park 

park = river =opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'leisure', value = "nature_reserve") %>%
  osmdata_sf()

#pubs 

pubs = iver =opq(bbox = c(-0.27, 51.47, -0.20, 51.50)) %>% # Chiswick Eyot in London, U.K.
  add_osm_feature(key = 'amenity', value = "pub") %>%
  osmdata_sf()

ggplot(  )+
  geom_sf(data = primary$osm_lines,
          size = 2,
          color = "#FCD6A4")+
  geom_sf(data = secodary$osm_lines,
          size = 1) +
  geom_sf(data = tertiary$osm_lines) +
  geom_sf(data= residential$osm_lines) +
  geom_sf(data = trunk$osm_lines,
          size = 3,
          color = "#FBC0AC") +
  geom_sf(data = park$osm_polygons,
          fill = '#C8D7AB') +
  geom_sf(data = pubs$osm_points,
          aes(color = "Pubs")
          ) +
  scale_color_manual(values = c('purple')) +
  theme(
    legend.title = element_blank()
    
  )
  # geom_sf(data = river$osm_multipolygons,
  #         fill = "blue")
  


river



tertiary  
