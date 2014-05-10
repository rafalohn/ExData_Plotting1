Sys.setlocale(locale = "C")
##Read Data
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings='?',colClasses = c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Filter only 2007-02-01 and 2007-02-02
data<-data[as.Date(data$Date, format="%d/%m/%Y")>=as.Date('01/02/2007', format="%d/%m/%Y") & as.Date(data$Date, format="%d/%m/%Y")<=as.Date('02/02/2007', format="%d/%m/%Y"),]

#Create DateTime
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

#Plot the Graph
png(file = "plot2.png")
plot(data$DateTime,data$Global_active_power,ylim=c(0,6),ylab='Global Active Power (kilowatts)',xlab='',type="l")
dev.off()