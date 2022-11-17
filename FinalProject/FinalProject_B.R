# Diana Salinas
rm(list = ls())
pacman::p_load(tidyverse, RColorBrewer, productplots,reshape2, rvest, robotstxt, xml2, dplyr)

paths_allowed("https://www.wikipedia.org/")
page <- read_html("https://en.wikipedia.org/wiki/List_of_largest_cities_of_U.S._states_and_territories_by_population")
xml_structure(page)

states <- page %>% 
  html_nodes(".flagicon+ a") %>%
  html_text()

cities <- page %>% 
  html_nodes("td:nth-child(3) > a") %>%
  html_text()

mostPopulated <- tibble(states = states,cities = cities)
write_csv(mostPopulated, "data/mostPopulated.csv")
