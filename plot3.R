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