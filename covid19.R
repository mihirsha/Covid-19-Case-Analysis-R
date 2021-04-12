library(dslabs)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggthemes)
library(plotly)
library(gganimate)
library(gapminder)
data(covid_dataset)      
covid_dataset <- read_csv("~/Downloads/complete.csv")
covid <- select(covid_dataset , -Latitude, -Longitude, -
                  `Total Confirmed cases (Indian National)`,
                -`Total Confirmed cases ( Foreign National )`)
data_set <- filter(covid , Date < as.Date("2020-03-30") )
#dataset4 <- split(data_set, data_set$`Name of State / UT`)

p <- data_set %>% ggplot(aes( x = Date, y = `Total Confirmed cases`,
           size = `Total Confirmed cases`,col = `Name of State / UT`,
           frame = `Name of State / UT`))+
  geom_point(alpha = 0.3)+
  
  scale_size(range = c(0.1, 15))+
  scale_x_date(breaks = ("14 day"))+
  theme(legend.position = 'none')+
  theme(axis.text = element_text(size = 10),
        axis.title = element_text(size = 13),
        strip.text = element_text(size = 10))
ggplotly(p)
animate(p, nframes=120)

p + transition_time(Date) +
  labs(title = "Year: {frame_time}") +
  shadow_mark(alpha = 0.3, size = 0.5)

animate(p, nframes=120)








