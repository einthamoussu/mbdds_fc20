print("Hello World!")

install.packages("cowplot")


library(datos)
library(dplyr)

paises07 <- as.data.frame(paises %>% filter(anio == 2007))

paises07 %>% head(10)

6 / (4-1)

a <- 0
a
b <- a + 1
b
ls()
rm(list=ls())

describir <- function() {
  plot(pressure)
}

describir()
describir

?plot

describir <- function(data, type, col = 'red', ...) {
  plot(data, type = type, col = col, ...)
  return(summary(data))
}


resumen <- describir(pressure, type = 'l', main = "Presión de vapor de mercurio", xlab = "Temperatura (°C)", ylab = "Presión (mm de Hg)", cex.min = 1)
resumen
resumen <- describir(paises07_2VAR, type = 'p')
