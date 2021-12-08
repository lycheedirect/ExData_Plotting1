
#Plots examine how household energy usage varies over a 2-day period in February, 2007. Plot is meant for exploratory data analysis. 

#Read data table 
dataset <- read.table("household_power_consumption.txt", skip=1, sep=";")

#Assign column names 
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset data based on specifications
subdataset <- subset(dataset, dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

#calling the basic plot function & make png file 

hist(as.numeric(subdataset$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png,'Plot1.png')
dev.off()


