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
genero1<-c("FEMININO", "MASCULINO")
Percet<- paste(percentagem)
Percet <- paste(genero, "%", sep = "")
#genero

table(clean_data$Sexo)


#fazer graficos
#graf<-pie(percentagem, genero,
 #   main = "Total Inscritos Muva Link",
    #sub = "Actor: Dércio Nhanombe-05/04/2021",
  #  col = c(purple_MUVA,orange_MUVA))

# Create Data em formato de frame
data <- data.frame(
  group=genero1,
  value=percentagem)

# Basic piechart e remover rótulos numéricos inúteis & remover grade e fundo cinza

ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)+ theme_void()+

   



##Legenda
 legend(1, 95, legend=c(genero),
       col=c(purple_MUVA,orange_MUVA), lty=1:2, cex=0.8,
       title="Line types", text.font=4, bg='lightblue')
