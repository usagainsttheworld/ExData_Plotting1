#read data
data_ori<-read.table("household_power_consumption.txt",header = FALSE, sep=";",stringsAsFactors=FALSE, na.strings="?")
#clange column names 
colnames(data_ori)<-c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#extract data only from the dates 2007-02-01 and 2007-02-02
library(dplyr)
mydata<-filter(data_ori,Date=="1/2/2007" | Date=="2/2/2007")
#convert the Time variables to Time class
mydata$formatTime<-strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S")
#convert the Date variables to Date class
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
#convert other variables to numeric class
library(datasets)
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)
mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)
mydata$Voltage<-as.numeric(mydata$Voltage)
#plot data
par(mar=c(5,5,2,2))
par(mfrow=c(2,2))
#plot1
plot(mydata$formatTime,mydata$Global_active_power,type="l", ylab="Global Active Power", xlab="")
#plot2
with(mydata,plot(formatTime, Voltage, type="l", xlab="datetime",  ylab="Voltage"))
#plot3
with(mydata,plot(formatTime,Sub_metering_1, type="l", xlab="",  ylab="Energy sub metering"))
lines(mydata$formatTime,mydata$Sub_metering_2, col="red")
lines(mydata$formatTime,mydata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"), lty=c(1,1), bty="n", cex=.5)
#plot4
with(mydata,plot(formatTime, Global_reactive_power, type="l", xlab="datetime",  ylab="Global_reactive_power"))
#make PNG file
dev.copy(png,file="plot4.png",width=480, height=480, units="px")
dev.off()

