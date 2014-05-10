Sys.setlocale(locale = "C")
##Read Data
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings='?',colClasses = c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Filter only 2007-02-01 and 2007-02-02
data<-data[as.Date(data$Date, format="%d/%m/%Y")>=as.Date('01/02/2007', format="%d/%m/%Y") & as.Date(data$Date, format="%d/%m/%Y")<=as.Date('02/02/2007', format="%d/%m/%Y"),]

#Create DateTime
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

#Plot the Graph
png(file = "plot3.png")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab='Energy Sub Metering',xlab='')
lines(data$DateTime,data$Sub_metering_2,type="l",col='red',lwd=2.5)
lines(data$DateTime,data$Sub_metering_3,type="l",col='blue',lwd=2.5)
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),lwd=c(2.5,2.5,2.5))
dev.off()