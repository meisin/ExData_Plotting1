
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

##Plot graph
  plot(subset_data$Global_active_power~subset_data$Datetime, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
  
##Copy into png file
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()