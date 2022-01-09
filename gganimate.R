BBall <- read.csv("C:\\Users\\Migue\\Documents\\SMU\\Spring 2022\\6306 - Doing Data Science\\Unit2\\PlayersBBall.csv", header = TRUE, colClasses = c("position" = "factor", "height" = "numeric","college" = "factor", "weight" = "numeric"))
BBall
summary(BBall$college)

library(ggplot2)
library(dplyr)
library(gganimate)
library(ggthemes)
summary(BBall$college)
BBall[BBall$college %in% c("University of Kentucky", "University of California, Los Angeles", "University of North Carolina", "University of Kansas", "Duke University","Indiana Unversity", "University of Notre Dame") & BBall$year_end >2000,] %>% ggplot(aes(x = college), frame = year_start) + geom_bar()+ggtitle(BBall$year_start)

c("University of Kentucky", "University of California, Los Angeles", "University of North Carolina", "University of Kansas", "Duke University","Indiana Unversity", "University of Notre Dame")

gganimate(g, 0.2)

mtcars
schools = c("Duke","UCLA", "Kansas", "Kentucky", "UNC", "Notre Dame")
BBall[BBall$college %in% c("University of Kentucky", 
                           "University of California, Los Angeles", 
                           "University of North Carolina", 
                           "University of Kansas", 
                           "Duke University",
                           "Indiana Unversity", 
                           "University of Notre Dame"),] %>% 
  ggplot(aes(x = college, fill = college)) + 
  geom_bar()+ scale_x_discrete(labels = schools) +
  theme_stata()+
  labs(title = 'Year: {frame_time}') +
  transition_time(year_start) +
  enter_fade() + 
  enter_grow() +
  ease_aes('sine-in-out')

library(gifski)
last_animation()
gifski(last_animation())
gapminder


ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')
