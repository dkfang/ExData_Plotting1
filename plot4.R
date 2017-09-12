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