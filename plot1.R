library(sqldf)
plot1 <- function() {
  dat <- read.csv.sql("./data/household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
  hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power") 
  
  dev.copy(png, file = "./plot1.png") 
  dev.off() 
}