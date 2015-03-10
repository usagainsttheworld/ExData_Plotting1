#read data
data_ori<-read.table("household_power_consumption.txt",header = FALSE, sep=";",stringsAsFactors=FALSE, na.strings="?")
#clange column names 
colnames(data_ori)<-c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#extract data only from the dates 2007-02-01 and 2007-02-02
library(dplyr)
mydata<-filter(data_ori,Date=="1/2/2007" | Date=="2/2/2007")
#plot data
library(datasets)
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
par(mar=c(5,5,2,2))
hist(mydata$Global_active_power,xlab="Global Active Power (kilowatts)",col="red", main="Global Active Power")
#make PNG file
dev.copy(png,file="plot1.png",width=480, height=480, units="px")
dev.off()

