library(tidyverse)
library(ggplot2)
library(scatterplot3d)


data <- read.csv("my_newton_data.txt")

scatterplot3d(x=data$earth_x, y = data$earth_y, z = data$earth_z)
data %>% ggplot(aes(x = earth_x, y = earth_y, color = force_factor)) +
  geom_point(size = 0.05) +
  scale_color_gradient(low = "blue", high = "red") + # Define color gradient
  theme_minimal()
