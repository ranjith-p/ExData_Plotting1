## Reading the file
data <- read.csv("household_power_consumption.txt",sep = ";")

##Transforming the Date characters into objects of type Date 
data$Date <- strptime(x$Date, "%d/%m/%Y")
data$Date <- as.Date(x$Date)

## Sub setting the 2 days required for plotting
subdata <- subset(data, Date == "2007-02-01"| Date =="2007-02-02")

##Plot
hist(as.numeric(subdata$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

##Save as png file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()