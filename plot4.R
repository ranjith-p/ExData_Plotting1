## Reading the file
data <- read.csv("household_power_consumption.txt",sep = ";")

## Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
data$Date <- strptime(x$Date, "%d/%m/%Y")
data$Date <- as.Date(x$Date)

## Sub setting the 2 days required for plotting
subdata <- subset(data, Date == "2007-02-01"| Date =="2007-02-02")

subdata$Time <- strptime(subdata$Time,"%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Plot
par(mfrow=c(2,2))

with(subdata,plot(Time,as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)"))

with(subdata,plot(Time,as.numeric(Voltage),type="l",xlab="datetime",ylab = 'Voltage'))

plot(subdata$Time,subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subdata,lines(Time,Sub_metering_1))
with(ysub,lines(Time,Sub_metering_2,col="red"))
with(subdata,lines(Time,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),cex=0.6)

with(subdata,plot(Time,as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab = 'Voltage'))

#Save as png file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()