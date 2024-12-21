
#M1B2T4_1_AI1_ApellidoNombreAlumno
#Archivo de pruebas para lograr los resultados, luego se arma el markdown

library(datos)
suppressPackageStartupMessages(library(tidyverse))

?millas


millas


#1.1

ggplot(millas, mapping = aes(x = cilindros, y = autopista)) + 
  geom_point() +
  labs(x = "Cilindros", y = "Millas por galon de combustible en autopista"
       , title ="Comparacion de Consumo en autopista VS cantidad de cilindros")


#1.2

ggplot(millas, mapping = aes(x = cilindros, y = autopista, size = autopista, color = cilindros, shape = factor(cilindros))) + 
  scale_colour_gradient(low = "green",high = "red") + 
  scale_shape_manual(values = c(15:24)) +
  geom_point() +
  labs(x = "Cilindros", y = "Millas por galon de combustible en autopista"
       , title ="Comparacion de Consumo en autopista VS cantidad de cilindros")


#1.3

vec <- factor(c("8","5","9","8","1","7"))
print(vec) # valor mostrado

as.numeric(vec)
as.numeric(as.character(vec))

#1.4

class(millas)

class(millas$cilindrada)
class(millas$cilindros)
class(cbind(millas$cilindrada,millas$cilindros))


#1.5

vec <- c(1L,2L,3L,4L,5L,6L,7L,8L,9L,10L)
vec <- c(1L,2L,3L,4L,5L,6L,7L,8L,9L,10L,NA,11L)
class(vec)
typeof(vec)

tail(vec,1)
seq(1:length(vec))
vec[which(seq(1:length(vec))%%2 != 0)]
vec2 <- vec[which(seq(1:length(vec))%%2 != 0)]
vec2[which(!is.na(vec2))]

vec[2:length(vec)]


func_ej1_5 <- function(data) {

  if(class(vec) == "integer" ) {
    
    ultimo <- tail(data,1)
    posiciones_impares <- data[which(seq(1:length(data))%%2 != 0)]
    sin_el_primero <- data[2:length(data)]
    posiciones_impares_sinNA <- posiciones_impares
    posiciones_impares_sinNA <- posiciones_impares_sinNA[which(!is.na(posiciones_impares))]
    
    return(list(ultimo,posiciones_impares,sin_el_primero,posiciones_impares_sinNA))
  }
  else{
    print("Valor ingresado no es un integer")
  }
  
  
}

resultado <- func_ej1_5(vec)
resultado
