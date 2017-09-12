## Plot 2
plot(mydata$Global_active_power~mydata$dataTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save file
#dev.copy(png,"plot2.png", width=480, height=480)
#dev.off()