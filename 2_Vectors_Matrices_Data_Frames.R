# A Vector is a sequence of data elements that are of the same type.

  # There are 6 Types of Classes of Values in R. A vector can only contain one class of values.

      #	Integer; whole number with nothing after the decimal
	        # add L after number
          # R defaults to double because double is more commonly used
          
            int <- 4L
            typeof(int)
      
      # Double; stores regular numbers (large small, positive, negative, with digits after the decimal, or without)
            
            double <- 5 + 5
            typeof(double)
            
      # Character; store text data
          # can be a single character of a longer string
          # characters are denoted using “”
              
            char2 <- c("the answer to life", "the universe", 'and everything is', "42")
            typeof(char2)
            
            char2 <- c("the answer to life", "the universe", 'and everything is', 42) #even if one of the values is not consistent in a string sequence, R will revert it to a character
            char2
            typeof(char2)

      # Logical; store Boolean data (TRUE & FALSE values)
          #T = true
          #F = false

            spock <- c(FALSE, TRUE, F, F, T, FALSE)
            typeof(spock)

      # Complex
      # Raw

# Vectors can be combining a series of expressions
          
            vec <- c(1,2,3)
            vic <- c(11, 12, 13)
            vec + vic
            vec - vic
          
            blackJackDeck <- c("ace", "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", "four", "three", "two")
            sample(blackJackDeck, 2)
              
# Vector Recycling – two vectors that are unmatched in length, R will repeat the shorter vector until the two vectors are equal in length

            vec <- c(1,2,3)
            vic <- c(11, 12, 13, 14, 15)
            vec + vic
            vec - vic

#Vector Attributes
            
            #Vectors can be given attributes including values labels using the names(...) function
            
            lakersAge <- c(26, 27, 33, 27, 35)
            names(lakersAge) <- c("Alex Caruso", "Anthony Davis", "Danny Green", "Kentavious Caldwell-Pope", "LeBron James")
            age
            typeof(lakersAge)
            sample(lakersAge, 4)
            names(lakersAge) <- NULL #You can also remove attributes using NULL            

#Functions are statements organized together to perform a specific task. R performs functions on an Element to Element basis.
            
            #Arguments 
            
            args(round)
            round(2.741, digits = 2)
            round(2.741, 2)
            
            #Bear in mind that when you enter arguments they must be in order that R requires. You can see the order when you start typing the argument
            
            
            
            #The syntax for a functions is
            #function_name <- function(arg_1, arg_2, ...) { Function body }
            
            #function without an argument
            
            draw <- function () {
              deck <- c("ace", "king", "queen", "jack", "ten", "nine")
              hand <- sample(deck, size = 5, replace=T)
              print(hand)
            }
            
            
            draw()
            
            #function with an argument
            
            fahrenheit_to_celsius <- function(temp_F) {
              temp_C <- (temp_F - 32) * 5 / 9
              return(temp_C)
            }
            
            fahrenheit_to_celsius(90)

          
              
# Matrices are two-dimensional vectors. Like vectors they can only contain one class of value.
            
    # They can created using the following commands
            # matrix(data = , nrow = , ncol = , …) 
            # rbind(…) – row bind
            # cbind(…) – column bind
            
            mtrx <- matrix(1:12, nrow=3)
            mtrx # matrices default is to fill in the values by columns. You can change that using the byrow=T
            mtrx <- matrix(1:12, nrow = 3 , byrow=T)
            mtrx

   # CBIND and RBIND
            
            usa <- c(1.3, 1.5, 1.2, 1.4, 1.5)
            de <- c(0.2, 0.4, 0.7, 0.8, 0.8)
            
            ngo <- cbind(usa, de)
            ngo
    
    # Naming Columns and Rows
            
            #You can rename the columns and rows using
              #colnames(...)
              #rownames(...)
            
            pressElection <- c(304, 227, 206, 332, 173, 365, 286, 251, 271, 266, 159, 379, 168, 370, 426, 111, 525, 14, 489, 49) #create a vector of electoral college returns
            pressElection
            
            ec.mat <- matrix(pressElection, ncol = 2, byrow = T)
            ec.mat
            
            colnames(ec.mat) <- c("Republican", "Democrat")
            rownames(ec.mat) <- c("2016", "2012", "2008", "2004", "2000", "1996", "1992", "1988", "1984", "1980")
            ec.mat
            typeof(ec.mat)
            
#Slicing and Indexing
            
            # Slicing and Indexing in vectors and matrices allows you to select specific values or slice out a chunk of values.
            
            # Indexing - selecting specific values
            pressElection[6] # grab the 6th number
            ec.mat[6, 2] #[x, y] - x is the row and y is column
            ec.mat[ , 2] #[blank, y] - grabs the rows
            ec.mat[5, ] # grabs the columns
            ec.mat["1984", ]
            
            
#Arithmetic
            
            starWarsDisney <- c(936.7, 2068.2, 620.2, 1332.5, 515.2, 1074.1)
            sw.mat <- matrix(starWarsDisney, ncol=2, byrow = T,
                             dimnames = list(c("Force Awakens", "The Last Jedi", "Rise of Skywalker"),  #dimnames is a another way to add column and row names
                                             c("USA", "Worldwide")))
            
            sw.mat
            
            #These numbers are in Millions. What if we wanted it in Billions
            
            sw.scaled <- sw.mat/1000
            sw.scaled
            
            #What if we wanted to see what the net gross was by factoring in the budget

            swBudget <- matrix(c(245, 317, 275), ncol = 2, nrow = 3)
            margin <- sw.mat - swBudget
            margin
            
        #You can also do sums and means operations on a matrix
            
            #colSums(data) returns the sums for each column in your data structure or rolSums(data) returns sums of the rows
            colSums(sw.mat)

            
            #colMeans(data) returns the averages for each column or rowMeans(data) returns averages of the rows
            colMeans(sw.mat)
            
            #You can then add them to your initial matrix with rbind and cbind
            Total <- colSums(sw.mat)
            Average <- colMeans(sw.mat)
            sw.prelim <- rbind(sw.mat, Average, Total)
            sw.prelim
           
#Factors are categorical variables in R that take on a limited number of variables
            
            is.factor(starWarsDisney)
            
            agency.status <- c("DOD", "GAO", "FCC", "ED", "HUD", "DOD", "FCC" )
            str(agency.status) #structure of the vector
            is.factor(agency.status)
            
            #What is happening here is that R is not realizing that this vector is a factor, however we can R that it is indeed a factor using factor(...)
            
            agency.status <- factor(agency.status)
            agency.status
            str(agency.status)
            
            #What if the data is ordinal where there is value between the ranges
            
            ordinal.factor <- factor(agency.status, 
                                     levels = c("FCC", "GAO", "HUD", "DOD", "ED"))
            str(ordinal.factor)
            
            
            
#Data Frames are two dimensional vectors that can multiple classes of values.

#Create vectors for the data set

title <- c("Star Wars", "The Empire Strikes Back", "Return of the Jedi", "The Phantom Menace", "Attack of the Clones", "Revenge of the Sith", "Force Awakens", "The Last Jedi", "Rise of Skywalker")
year <- c(1977, 1980, 1983, 1999, 2002, 2005, 2015, 2017, 2019)
length.min <- c(121, 124, 133, 133, 142, 140, 135, 152, 141)
box.office.mil <- c(787, 534, 572, 1027, 657, 849, 2059, 1333, 1074)

#Creates the Data set, if you do not use the rename option (i.e. Title = title), R will default the column name to the name of the vector. You can also use the names function to rename the columns

#names(starWars.data)

#data.frame(...)

starWars.data <- data.frame(Title = title, Year = year, Length = length.min, Gross = box.office.mil)

starWars.data


str(starWars.data)

starWars.data <- data.frame(Title = title, Year = year, Length = length.min, Gross = box.office.mil, stringsAsFactors = F)

#Strings are being stored by default as factors. If you do not want your String to be factors then use data.frame(..., stringsAsFactors = F)

starWars.data <- data.frame(Title = title, Year = year, Length = length.min, Gross = box.office.mil, stringsAsFactors = F)

str(starWars.data)

#Tidyverse is a collection of packages for data analysis and data visualizations

install.packages("tidyverse")
library(tidyverse)

  #ggplot2 - data visualization - https://ggplot2.tidyverse.org/
  
  #tibble - lighter and more user-friendly version of data.frame() - https://tibble.tidyverse.org/
  
  #tidyr - create tidy and meaningfully arranged data - https://tidyr.tidyverse.org/
  
  #readr - sidesteps the limitations of the R functions when importing data into R - https://readr.tidyverse.org/
  
  #purrr - better functional programming = https://purrr.tidyverse.org/
  
  #dplyr - data manipulation tools - https://dplyr.tidyverse.org/


#Import Data into R

#Make sure your working directory is set to where you want it to be. YOu can do so with the code listed below or by using Session in the R menu

getwd()
setwd("insert your wd")


#For example if I was to set my dirctory to my desktop it would be 
#setwd("C:/Users/Matt/Desktop")

  #read.table("file.name", sep = , header = , stringsAsFactors = )
  #sep - what separates your data values (i.e. comma, tab, space)
  #header= does it have a header row or not
  #stringsAsFactors = should R encode your string variables as factors

my.house <- read.table("house_2018_bystate.csv", 
                       sep = ',',
                       header = T,
                       stringsAsFactors = F)
my.house

  #read.csv is a shortcut for csv files that defaults to comma separated and first row headers 
  #read.csv("file.name", stringAsFactors =  )
  
  #read.delim similarly is a shortcut for tab delimited files ?read.delim for more information
  
  #if there are multiple rows of text before the header use the read.table(..., skip = n)
  
  #if you only want to read a particular number of rows use the read.table(..., nrows = n)

#Exporting Data

#write.csv(data, file = , row.names = )

starWars.data

write.csv(starWars.data, file = "StarWarsBoxOfficeTotals.csv", row.names = F)

#we set the row.names to False because R can be a bit buggy when exporting row names


#Getting a Sense of Your Data

  #nrow(...) - number of columns
  #ncol(...) - number of rows
  #colnames (...) - names of the columns 
  #rownames(...) - names of the rows
  #str(...) - stucture of the dataset
  #summary(...) - descriptive statistics of the objects in the dataset

    my.house
    
    nrow(my.house)
    colnames(my.house)
    
    summary(my.house)

#Subsetting Data Frames

  my.house

#head(data) - returns the first part of the object

  head(my.house)

#Index an element data[row, column]

  my.house [5 , 5]
  my.house [5 , "Vote_difference"]
  my.house [5, ]

#$ - subsets the column name

  my.house$Total_vote

#Multiple columns and rows

  my.house[c(30:40), c("Vote_difference", "Seat_difference")]

#Adding Observations

  starWars.data

#What if we wanted to add observations about Mark Hamill and Carie Fisher's screen time in each film

  mark <- c(37.5, 34.75, 34.25, 0, 0, .75, 0, 25.75, 7.5)
  carrie <- c(13.5, 22.75, 21.25, 0, 0, .5, 5.75, 12.75, 19.5)

  starWars.data$MarkScreenTime <- mark
  starWars.data$CarrieScreenTime <- carrie

  starWars.data

#Can also use double parentheses or cbind()

#Adding a new row

  rogueOne <- data.frame(Title = "Rogue One", Year = 2016, Length = 133, Gross = 1051, MarkScreenTime = 0, CarrieScreenTime = .25)
  rbind(starWars.data, rogueOne)

#Missing Data

#na.rm = T

  eg.na <- c(NA, 1:10)
  eg.na
  mean(eg.na)


  mean(eg.na, na.rm = T)


#Where are my NAs?

  starwars
  
  is.na(starwars)
  
  any(is.na(starwars))
  

#That does it for working with vectors, matrices, and data frames. Next we will work on cleaning our data. Open up the script 3_Cleaning_data.R
