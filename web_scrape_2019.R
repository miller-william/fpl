#Code to scrape Fantasy Premier League API for team data

setwd("~/Documents/FPL/2019")

#Loading packages
library('rvest')
library("jsonlite")

#Player_lookup
name <- c('Zac','Tom','Josh','Scot','Paddy','Luke','Alex')
code <- c('29649','345408','4871937','555634','172179','3136901','3528506')
#player_lookup <- tibble(name,history.entry)
#write.csv(player_lookup,"player_lookup.csv")

j <- 1

#Get first user data to initialise csv file
test <- '638'
json_file <- paste0('https://fantasy.premierleague.com/api/entry/', test, '/history/', sep='')
data <- fromJSON(json_file)
current <- data.frame(data[1])
current$player_id <- 638
current$player_name <- 'Will'
write.csv(current, "data.csv")

#loop through code array to append subsequent user data
for (i in code) {
  test <- i
  json_file_app <- paste0('https://fantasy.premierleague.com/api/entry/', test, '/history/', sep='')
  data_app <- fromJSON(json_file_app)
  current <- data.frame(data_app[1])
  current$player_id <- i
  current$player_name <- name[j]
  write.table(current, "data.csv", sep = ",", col.names = F, append = T)
  j <- j+1
  
}





