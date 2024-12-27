

knitr::opts_chunk$set(echo = TRUE)
library(knitr)
library(pander)
library(kableExtra)
options(knitr.kable.NA = '')


library(datos)
suppressPackageStartupMessages(library(tidyverse))




millas
str(millas)

#Ejercicio 2.1

millas2 <- NA
millas2 <- as.data.frame(millas2)
millas2


for(i in 1:ncol(millas)){
  print(class(millas[[i]]))
  if(class(millas[[i]]) == "integer" | class(millas[[i]]) == "numeric"){
    print("Es numero!")
    
    millas2$aux_name <- mean(millas[[i]])
    colnames(millas2)[which(names(millas2) == "aux_name")] <- names(millas[i])
    print(millas2)
  }
}

rm(i)

millas2 <- millas2 %>% select(-c(names(millas2[1])))
millas2


#Ejercicio 2.2


millas3 <- sapply(millas, function(x) mean(x))
millas3 <- as.data.frame(millas3)
millas3 <- millas3 %>% filter(!is.na(millas3))

headers <- row.names(millas3)
millas3 <- millas3[,1]

millas3 <- as.data.frame.list(millas3)
names(millas3) <- headers

millas3
rm(headers)


#Ejercicio 2.3

millas4 <- millas %>% filter(fabricante=="audi") %>% select(fabricante,modelo,cilindrada,cilindros)

millas4$categoria <- ifelse(millas4$cilindros > 4,"alta","media")

millas4$cilindros[1]

if(millas4$cilindros[5] > 4){
  millas4$categoria[5] = "ALTA2"
}


#Ejercicio 2.4


write(paste0("audi    a4  ","\n","audi    a6  ","\n","audi    a8  "),"einthamoussu_prueba_ej_2_4.txt")

read.fwf("einthamoussu_prueba_ej_2_4.txt",c(8,4))
read.fwf("einthamoussu_prueba_ej_2_4.txt",c(4,8))


#Ejercicio 2.5
mpg_autopista_por_clase_2_5 <- aggregate(millas$autopista, list(millas$clase), FUN=mean) 
names(mpg_autopista_por_clase_2_5) <- c("clase","autopista_clase")

kable(mpg_autopista_por_clase_2_5)


## EJERCICIO 2.6.
millas7 <- merge(millas,mpg_autopista_por_clase_2_5)
names(millas7["avg_mpg_autopista_por_clase"]) <- "autopista_clase"
millas7

summary(merge(millas,mpg_autopista_por_clase_2_5))

## EJERCICIO 2.7.

summary(millas %>% group_by(clase) %>% mutate(avg_mpg_autopista_por_clase=mean(autopista)))

## EJERCICIO 2.8
millas9 <- millas
millas9$duplicados <- ifelse(duplicated(millas9),"TRUE","FALSE")

millas9 %>% group_by(duplicados) %>% summarize(cantidad = n())

millas9 <- millas9 %>% filter(duplicados == "FALSE") %>% select(-duplicados)

str(millas9)
duplicated(millas9)


## EJERCICIO 2.9

edad <- function(fecha_nacimiento){

  #se valida que el parametro ingresado es de tipo Date  
  stopifnot(is.Date(fecha_nacimiento))

  #se devuelven los años.
  #   la resta de today - fecha_nacimiento da la cantidad de días
  #   con as.duration, se calculan los segundos transcurridos
  #   con as.period se obtiene una clase Period donde se puede extraer facilmente los años con
  #   year()
  return(paste0("Tienes ",as.duration(today()-fecha_nacimiento) %>% as.period() %>% year(), " años."))
  
}


fecha <- as.Date("1981-07-26")
fecha_hoy <- today()
fecha_hoy - fecha #15860 days
as.duration(fecha_hoy - fecha) #1370304000s (~43.42 years)"
as.duration(fecha_hoy - fecha) %>% as.period() # "43y 0m 154d 6H 0M 0S"
as.duration(fecha_hoy - fecha) %>% as.period(unit = "year") %>% year() # 43

edad(fecha)

## EJERCICIO 2.10

hours(24)
dhours(24)


fechahora <- ymd_hms("2020-03-28 15:11:23", tz = "Europe/Madrid")
fechahora
fechahora + dhours(12)
fechahora + hours(12)

print(fechahora_1)
print(fechahora_2)
