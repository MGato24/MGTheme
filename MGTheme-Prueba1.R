library(datos)
data = datos::flores

library(dplyr)
data |> filter(Largo.Petalo >= 1.6) |> select(Especie) |> table()


library(ggplot2)

g = ggplot(data |> filter(Largo.Petalo >= 1.6) ) +
  aes(x = Especie) +
  geom_bar(aes(fill = Especie), width = 0.5)


g + labs(title = "TÍTULO DEL GRÁFICO",
         subtitle = "Subtítulo del gráfico de ser requerido",
         x = "Especie",
         y = "Cantidad",
         caption = "Fuente: Paquete datos - 11/09/2022") +
  geom_text(aes(x = 1, y = 50,
                label = "Algún texto que pueda
servir como indicativo"),
                stat = "unique", size = 4, hjust = 0.5, vjust = 1) +
  theme(legend.position = "right", #Posición de la leyenda
        legend.title = element_blank(), #Eliminar título de la leyenda
        plot.margin = margin(t = 0.5,  # Margen superior
                             r = 1,  # Margen derecho
                             b = 0.3,  # Margen inferior
                             l = 0.8,  # Margen izquierdo
                             unit = "cm"),
        axis.title.y = element_text(size = 13, vjust = 4))
