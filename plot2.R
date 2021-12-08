# Plots examine how household energy usage varies over a 2-day period in February, 2007. Plot is meant for exploratory data analysis. 

# Read data table 
dataset <- read.table("household_power_consumption.txt", skip=1, sep=";")

# Assign column names 
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subset data based on specifications
subdataset <- subset(dataset, dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

# Extracting Date and Time data for plotting active power against time 
subdataset$Date <- as.Date(subdataset$Date, format="%d/%m/%Y")
subdataset$Time <- strptime(subdataset$Time, format="%H:%M:%S")

# Time series is expressed in minutes. 1440 minutes in a day 
subdataset[1:1440,"Time"] <- format(subdataset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdataset[1441:2880,"Time"] <- format(subdataset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plotting active power against time, type "l" for line plot 
plot(subdataset$Time,as.numeric(subdataset$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)", main="Global Active Power Vs Time")
dev.copy(png,'Plot2.png')
dev.off()


