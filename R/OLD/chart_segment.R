## Clean and prepare data to use in the charts
source("R/set_up.R")
source("R/style.R")


#DATA FOR SEGMENT 



data_segment_raw = import(file.path(dir_data, "data_for_segment.xlsx")) %>%
  ## calculate mean of all numeric variables
  summarise(across(where(is.numeric), ~mean(.x,na.rm = T))) %>%
  select(-ID_Number) %>%
  ## Make the table longer
  pivot_longer(cols = names(.),
               names_to = "indicador",
               values_to = "mean") %>%
  mutate(round = factor(if_else(str_detect(indicador,"_1"), "Endline", "Base line")),
         indicador = factor(case_when(str_detect(indicador, "Argumenta") ~ "Argumentação Lógica" ,
                                      str_detect(indicador, "Linguagem") ~ "Linguagem Corporal",
                                      str_detect(indicador, "Boas") ~ "Boas Maneiras",
                                      str_detect(indicador, "Auto") ~ "Auto confianza"
                                      
         )),
         mean = round(mean, digits = 2)
         
  ) %>%
  pivot_wider(id_cols= c("indicador","mean"),
              names_from = "round",
              values_from = "mean") %>%
  rename(Baseline = `Base line`) 





## Create chart

plot_segment = ggplot(data = data_segment_raw,
                      aes(x = Baseline,
                          xend = Endline,
                          y = indicador))+
  geom_point(aes(x = Baseline,
                 color = "Baseline"),
             size = 3.5) +
  geom_point(aes(x = Endline,
                 color = "Endline")) +
  geom_segment(aes(x=Baseline,
                   xend=Endline,
                   y=indicador,
                   yend=indicador),
               color=aqua_MUVA, size=1.5) +
  geom_dumbbell(color=aqua_MUVA, 
                size_x=3.5, 
                size_xend = 3.5,
                #Note: there is no US:'color' for UK:'colour' 
                # in geom_dumbbel unlike standard geoms in ggplot()
                colour_x=purple_MUVA, 
                colour_xend = orange_MUVA) +
  geom_text(color="black", size=3.5, nudge_x = -.23,
            aes(x=Baseline, label=Baseline))+
  geom_text(aes(x=Endline, label=Endline), 
            color=darkblue, size=3.5,
            nudge_x = .23) +
  xlim(1,5) +
  labs(y = "",
       x = "Score")+
  scale_color_manual(name = "", values = c(purple_MUVA, orange_MUVA))+
  tema




ggsave(file.path(dir_charts,"segment.png"),plot_segment )
