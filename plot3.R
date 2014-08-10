plot3 <- function(data) {
  
  data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  part1 <- subset(data, data$Date=="2007-02-01")
  part2 <- subset(data, data$Date=="2007-02-02")
  new_data <- rbind(part1, part2)
  new_data <- new_data[complete.cases(new_data),]
  new_data$Date <- as.POSIXct(paste(new_data$Date,new_data$Time), "%d/%m/%Y %H:%M:%S")
  new_data$Global_active_power <- as.character(new_data$Global_active_power)
  new_data$Global_active_power <- as.numeric(new_data$Global_active_power)
  new_data$Sub_metering_2 <- as.character(new_data$Sub_metering_2)
  new_data$Sub_metering_2 <- as.numeric(new_data$Sub_metering_2)
  new_data$Sub_metering_1 <- as.character(new_data$Sub_metering_1)
  new_data$Sub_metering_1 <- as.numeric(new_data$Sub_metering_1)
  
  plot(new_data$Date, new_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
  lines(new_data$Date, new_data$Sub_metering_2, type="l", col="red")
  lines(new_data$Date, new_data$Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, text.width = 60000) 
  dev.copy(png, file = "./plot3.png") 
  dev.off() 
}