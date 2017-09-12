
# Assignment1
# DongKai Fang
# Exploratory Data Analysis

mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header = TRUE, na.strings = "?",
                     colClasses = c("character","character", rep("numeric",7)))

# check
head(mydata)

# Now, we convert first variable from character to Date
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

# check
str(mydata$Date)

# Subsetting data from 2007-02-01 and 2007-02-02
mydata <- subset(mydata, Date >= "2007-2-1" & Date <= "2007-2-2")

# Convert the Date and Time variables to Date/Time classes 
dataTime <- paste(mydata$Date, mydata$Time)

# remove columns (date and time) and combine a new "Date/Time" column
mydata <- mydata[ ,!(names(mydata) %in% c("Date","Time"))]
mydata <- cbind(dataTime, mydata)

#removing NA values
mydata <- mydata[complete.cases(mydata),]

## Format dateTime Column
mydata$dataTime <- as.POSIXct(dataTime)
# check
head(mydata)

# Plotting
# histogram
hist(mydata$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")

## Save file
#dev.copy(png,"plot1.png", width=480, height=480)
#dev.off()

## Plot 2
plot(mydata$Global_active_power~mydata$dataTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save file
#dev.copy(png,"plot2.png", width=480, height=480)
#dev.off()

## Plot 3
with(mydata, {
      plot(Sub_metering_1~dataTime, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
      lines(Sub_metering_2~dataTime,col='Red')
      lines(Sub_metering_3~dataTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save file
#dev.copy(png,"plot3.png", width=480, height=480)
#dev.off()

## Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(mydata, {
      # top right
      plot(Global_active_power~dataTime, type="l", 
           ylab="Global Active Power (kilowatts)", xlab="")
      # top left
      plot(Voltage~dataTime, type="l", 
           ylab="Voltage (volt)", xlab="")
      # bottom right
      plot(Sub_metering_1~dataTime, type="l", 
           ylab="Global Active Power (kilowatts)", xlab="")
      lines(Sub_metering_2~dataTime,col='Red')
      lines(Sub_metering_3~dataTime,col='Blue')
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      # bottom left
      plot(Global_reactive_power~dataTime, type="l", 
           ylab="Global Rective Power (kilowatts)",xlab="")
})

## Save file
#dev.copy(png,"plot4.png", width=480, height=480)
#dev.off()



