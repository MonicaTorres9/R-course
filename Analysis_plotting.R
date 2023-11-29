#Manage version control with renv

library(renv)
renv::init()

#install (using renv:: install()) and upload packages. Save
renv::install("tidyverse")
library(tidyverse)
renv::snapshot()

#load & explore data
data("iris")

head(iris)
summary(iris)
str(iris)

#data manipulation
iris <- as_tibble(iris)
iris %>% summarise_if(is.numeric,mean)
filter(iris, Sepal.Length > 2)
summarise(iris, mean(iris$Sepal.Length))

#visualization
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() + 
  xlab ("Sepal Length") +
  ylab ("Sepal Width") +
  ggtitle ("Iris base")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_boxplot(aes(fill = Species)) +
  xlab ("Sepal Length") +
  ylab ("Sepal Width") +
  ggtitle ("Iris boxplot")

ggplot(iris, aes(x = Sepal.Length, color = Species)) +
  geom_histogram(aes(fill = Species),bins = 20, color = "black", position = "stack") +
  xlab ("Sepal Length") +
  ylab ("Frequency") +
  ggtitle ("Iris histogram")

renv::snapshot()
