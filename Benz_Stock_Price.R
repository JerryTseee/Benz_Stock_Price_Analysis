install.packages("tidyverse") #"tidyverse" is an R package that helps to analyze data
library(tidyverse)


#get the data from CSV file
file_path <- "C:/Users/admin/Desktop/MBG.DE.csv"
data <- read.csv(file_path)


#convert date column to date format, so better for the following manipulation
data$Date <- as.Date(data$Date)
#to check the content of data
str(data)
#view the first few rows of data
head(data)


#start to perform the data manipulation and analysis

#First:
#calculate the daily return
#it adds a new column called daily return
data <- data %>%
  mutate(daily_return = (Close - lag(Close)) / lag(Close))#lag() means previous values
#draw the graph
ggplot(data, aes(x = Date, y = daily_return))+
  geom_line()+
  labs(title = "Benz Daily Return", x = "Date", y = "Daily Return")



#Second:
#visualize the closing price data using ggplot2
#geom_line() function adds a line to the plot
#labs() function adds the title and labels
ggplot(data, aes(x = Date, y = Close))+
  geom_line() + 
  labs(title = "Benz Stock Price", x = "Date", y = "Closing Price")
