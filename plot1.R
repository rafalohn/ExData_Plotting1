setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

##Read Data
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings='?',colClasses = c("myDate","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Filter only 2007-02-01 and 2007-02-02
data<-data[data$Date>=as.Date('01/02/2007', format="%d/%m/%Y") & data$Date<=as.Date('02/02/2007', format="%d/%m/%Y"),]

#Plot the Graph
png(file = "plot1.png")
hist(data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power(kilowatts)')
dev.off()