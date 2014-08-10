plot4 <- function() {
  data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  part1 <- subset(data, data$Date=="2007-02-01")
  part2 <- subset(data, data$Date=="2007-02-02")
  new_data <- rbind(part1, part2)
  new_data <- new_data[complete.cases(new_data),]
  new_data$Date <- as.POSIXct(paste(new_data$Date,new_data$Time), "%d/%m/%Y %H:%M:%S")
  new_data$Global_active_power <- as.character(new_data$Global_active_power)
  new_data$Global_active_power <- as.numeric(new_data$Global_active_power)
  new_data$Global_reactive_power <- as.character(new_data$Global_reactive_power)
  new_data$Global_reactive_power <- as.numeric(new_data$Global_reactive_power)
  new_data$Voltage <- as.character(new_data$Voltage)
  new_data$Voltage <- as.numeric(new_data$Voltage)
  new_data$Sub_metering_2 <- as.character(new_data$Sub_metering_2)
  new_data$Sub_metering_2 <- as.numeric(new_data$Sub_metering_2)
  new_data$Sub_metering_1 <- as.character(new_data$Sub_metering_1)
  new_data$Sub_metering_1 <- as.numeric(new_data$Sub_metering_1)
  
  par(mfrow = c(2, 2))
  with(data, {
    hist(new_data$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power") 
    plot(new_data$Date, new_data$Voltage, xlab="Voltage", ylab="Global Active Power(kilowatts)", type = "l")
    plot(new_data$Date, new_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
    lines(new_data$Date, new_data$Sub_metering_2, type="l", col="red")
    lines(new_data$Date, new_data$Sub_metering_3, type="l", col="blue")
    legend("topright", border = "white", col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n", text.width = 60000, lwd=2)
    plot(new_data$Date, new_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")
    
  })  
  
  dev.copy(png, file = "./plot4.png") 
  dev.off() 
}