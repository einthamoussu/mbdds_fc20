print("Bye bye cruel world!")

library(ggplot2)

ggplot(data = pressure) + 
  geom_point(mapping = aes(x = temperature, y = pressure))


p1 <- ggplot(data = pressure, mapping = aes(x = temperature, y = pressure, color = temperature)) + 
  geom_point()

p1 <- p1 + geom_line()
p1 <- p1 + labs( title = "Presión de vapor del mercurio"
                 , x = "Temperatura (°C)"
                 , y = "Presión (mm de Hg)")
p1


paises
paises_3VAR <- paises %>% 
  select(anio, pib_per_capita, esperanza_de_vida)
paises_2VAR <- paises %>% 
  select(pib_per_capita, esperanza_de_vida)


ggplot(paises_3VAR, mapping = aes(x = pib_per_capita, y = esperanza_de_vida, color = pib_per_capita)) + 
  geom_point() +
  facet_wrap(vars(anio)) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1)) + 
  labs(x = "PIB per capita (USD)", y = "Esperanza de vida (años)",
         title ="Evolucion del PIB y la esperanza de vida desde el año 1952")

describir <- function(data, ...) {
  p1 <- ggplot(paises_3VAR, mapping = aes(x = pib_per_capita, y = esperanza_de_vida, color = pib_per_capita)) + 
    geom_point() +
    facet_wrap(vars(anio)) + 
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1)) + 
    labs(x = "PIB per capita (USD)", y = "Esperanza de vida (años)",
         title ="Evolucion del PIB y la esperanza de vida desde el año 1952")
  print(p1)
  return(summary(data))
}

describir(paises_3VAR)

a <- c(2,4,6)
class(b)
typeof(b)
unclass(b)

b <- as.Date(a)
b

class(c(Sys.Date(),Sys.Date()+1,Sys.Date()+2))

head(paises[,c(F,F,F,F,F,T)])

paises_local[paises_local$continente == "Americas",]
paises_local <- paises
paises_local
paises_local$continente <- as.character(paises_local$continente)
Encoding(paises_local$continente) <- "UTF-8"

a <- 1:6
a
a[1]<-10
a[c(3,5)] <- c(300,500)
a
a[4:6] <- a[4:6] +1
a
a[7]<- 7
a
paises_local$poblacion <- NULL
paises_local

sort(a)

