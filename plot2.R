plot2 <- function(dat) {
  
  data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  part1 <- subset(data, data$Date=="2007-02-01")
  part2 <- subset(data, data$Date=="2007-02-02")
  new_data <- rbind(part1, part2)
  new_data <- new_data[complete.cases(new_data),]
  new_data$Date <- as.POSIXct(paste(new_data$Date,new_data$Time), "%d/%m/%Y %H:%M:%S")
  new_data$Global_active_power <- as.character(new_data$Global_active_power)
  new_data$Global_active_power <- as.numeric(new_data$Global_active_power)
  plot(new_data$Date, new_data$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type = "l")
  
  dev.copy(png, file = "./plot2.png") 
  dev.off() 
}