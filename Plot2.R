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
#plot data
library(datasets)
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
par(mar=c(5,5,2,2))
plot(mydata$formatTime,mydata$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
#make PNG file
dev.copy(png,file="plot2.png",width=480, height=480, units="px")
dev.off()

