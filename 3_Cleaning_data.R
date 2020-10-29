#The Dplyr Package

library(tidyverse)

view(my.house)

#filter(data, criterion) - subsets data according to criteria

filter(my.house, Majority_votes == "Republican")
voteDiff <- filter(my.house, Majority_seats == "Republican" | Majority_votes == "Republican")
mean(voteDiff$Total_vote)


#select(data) - keeps the variables you mention

select(my.house, Majority_seats, Vote_difference, Seat_difference)
seatDiff <- select(my.house, Seat_difference, Total_vote:Democrat_vote)
summary(seatDiff)


#mutate(...) - adds a new variable and preserves the rest

my.house <- mutate(my.house, Seat_diff = Republican_seats - Democrat_seats)
my.house

#transmutate(...) adds a new variable and drops the rest

my.house <- transmute(my.house, Seat_diff = Republican_seats - Democrat_seats)
my.house

#arrage(...)

arrange(my.house, desc(Republican_seats))
arrange(my.house, +Republican_seats)

#summarize(...) summarizes a data frame in a single result
summarize(my.house, avg.Democrat_seat_win = mean(Democrat_seats))
summarize(my.house, avg.Republican_seat_win = median(Republican_seats))

my.house

#group_by(...) - splits the dataset into groups

house.vote <- group_by(my.house, Majority_votes)
house.vote
summarize(house.vote, avg.vote = mean(Seat_difference))

#Sampling Data

#sample(...)

#sample_n(...) extracts a random sample of a fixed number of rows
sample_n(my.house, 10, replace = T)

#sample_fract(...) extracts a random sample of a fixed percentage of rows
sample_frac(my.house, .2, replace = T)

my.house.sample <- sample_n(my.house, 10, replace = T)
my.house.sample
mean(my.house.sample$Vote_difference)

#Pipe Operator  %>%

#place between individual operations to both separate and unite the operations
house.vote <- group_by(my.house, Majority_votes)
house.smr <- summarize(house.vote, count = n(), avg.vote = mean(Seat_difference))
house.smr
filter(house.smr, count >1)

#=

#data %>% operation A %>% operation B


my.house %>%
  group_by(Majority_votes) %>%
  summarise(count = n(), avg.vote = mean(Seat_difference, na.rm = T)) %>%
  filter(count >1)


#Tidying data in R with tidyr

#gather(...)  
#spread(...)
#unite(...)
#seperate(...)

library(tidyverse)

#gather(...) is the function that reorganizes data that have values as column names

covid19.us <- read.csv("time_series_covid19_confirmed_US.csv", stringsAsFactors = F)
covid19.us <- as_tibble(covid19.us)
covid19.us

#gather(data, col.m:col.n, key, value)
#key is the name of the new variable that will hold the values that are currently column names
#value is the name of the new variable that will hold the values previously help by the columns


covid.gathered <- covid19.us %>% gather(January.22..2020:October.19..2020, key = "Date", value = "Cases", na.rm = T) %>%
  arrange(-Cases)

covid.gathered


#separate(column name, sep ="", into = "") breaks values in one column into multiple columns

covid.separate <- covid.gathered %>% separate(Combined_Key, sep = ", ", into = c("City", "State", "Country"))
covid.separate

covid.separate.month <- covid.separate %>% separate(Date, sep = "[.]", into = c("Month", "Date"), )
covid.separate.month

covid.separate.month$Date <- as.Date(covid.separate.month$Date, "%d") 
covid.separate.month

select(covid.separate.month, -Month)


covid.state <- group_by(covid.separate.month, State)
covid.state

bar.covid.state <- ggplot(covid.state, aes(State), (x=factor(trunc(runif(10000, 0, 100)), ordered=T)))
bar.covid.state

bar.covid.state + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 


#unite(...) combine two or more columns
covid.united <- covid.separate %>% unite("Location", sep = ", ", c("City", "State", 'Country'))
covid.united

#spread(...) help to tidy data of one observation in multiple rows

weather <- read.csv("weather.csv")
weather <- as_tibble(weather)
weather

weather.spread <- spread(weather, key = element, value = value)
weather.spread

