
##read data from txt file
  data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  
##Convert Date to System date format
  formatDate <- as.Date(strptime(data$Date, '%d/%m/%Y'))
  data$formatDate <- formatDate
  
##Filter out data to create subset_data, containing data for 2007-02-01 or 2007-02-02
  subset_data <- subset(data, subset=(formatDate >= "2007-02-01" & formatDate <= "2007-02-02"))
  rm(data)

##Creating histogram 
  hist(subset_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
##copy histogram into png files
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
  
  