### Tarefa do grafico de barra




#cargar estilos y caminhos ----------------------------------------------------

source("set_up.R")
source("R/styles.R")


#importar nossos datos

raw_data = import(file.path(dir_data,"Link.xls"))
        

#limpiar
clean_data <- raw_data %>%
        mutate(Sexo <- factor(Sexo),
               Cidade <- factor(Cohort)) 

names(clean_data)

#transformar data para facer grafico
data_grafico_cohort = clean_data %>%
        group_by(Cidade, Sexo) %>%
        summarise(Total = n())



#facer grafica

ggplot(data =  data_grafico_cohort,
       aes(x = Total,
           y = Cidade,
           fill = Sexo
           )
       ) +
geom_bar(position =  'dodge',
         stat = 'identity'
         ) +
geom_text(aes(label = Total),
          position = position_dodge(width = 1),
          hjust = 0,
          color = purple_MUVA
          ) +
scale_fill_manual(values = c(agua_MUVA, orange_MUVA)) +

labs(title = "My first graph!",
     caption = "Data from MIS",
     y = "Nome do Cohort",
     x = "Pessoas registradas")
        

view(data_grafico)

## Carrengando ficheiro do xlsx

view(clean_data)
