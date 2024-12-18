print("Hello World!")

install.packages("cowplot")


library(datos)
library(dplyr)

paises07 <- as.data.frame(paises %>% filter(anio == 2007))

paises07 %>% head(10)
