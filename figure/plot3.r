
##read data from txt file
  data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

##Convert Date to System date format
  formatDate <- as.Date(strptime(data$Date, '%d/%m/%Y'))
  data$formatDate <- formatDate
  
##Filter out data to create subset_data, containing data for 2007-02-01 or 2007-02-02
  subset_data <- subset(data, subset=(formatDate >= "2007-02-01" & formatDate <= "2007-02-02"))
  rm(data)

##Create an column datetime that combines both date and time into POSIXct format
  datetime <- paste(subset_data$formatDate, subset_data$Time)
  subset_data$Datetime <- as.POSIXct(datetime)

  png(filename = "plot3.png", width = 480, height = 480)
##plot graph
  with(subset_data, {
    plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
  })

  legend("topright", col = c("black", "blue", "red"), lty=1, lwd=2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
## Close the connection  
##  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()