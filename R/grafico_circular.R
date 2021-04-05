### Tarefa do grafico de Circular 

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

## Calculando percentagem e ferramentas para o grafico circular
percentagem <- as.numeric(round(((prop.table(table(clean_data$Sexo)))*100),2))
percentagem
genero<-c("FEMININO", "MASCULINO")
genero<- paste(percentagem)
genero <- paste(genero, "%", sep = "")
genero

table(clean_data$Sexo)
graf<-pie(percentagem, genero,
    main = "Total Inscritos Muva Link",
    sub = "Grafico de treinamento",
    col = c(purple_MUVA,orange_MUVA))

##Legenda
 
 legend(1, 95, legend=c(genero),
       col=c(purple_MUVA,orange_MUVA), lty=1:2, cex=0.8,
       title="Line types", text.font=4, bg='lightblue')
#fazer graficos