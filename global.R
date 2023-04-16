

library(shiny) 
library(shinydashboard) 
library(dplyr)  
library(plotly)  
library(ggplot2) 
library(ggtext) 
library(shinycssloaders) 


data=read.csv("C:/Users/Arun/Downloads/R-Shiny-Dashboards-main/R-Shiny-Dashboards-main/Juvenilecrime.csv")

data

states = rownames(data)

my_data <- data %>% 
  mutate(State = Sales) 

c1 = my_data %>% 
  select(-"State") %>% 
  names()


c2 = my_data %>% 
  select(-"State", -"Profit") %>% 
  names()












