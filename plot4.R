#Load data
Power <- read.table(file = "household_power_consumption.txt",
                    sep =";",
                    header = TRUE,
                    na.strings = "?",
                    dec = ".",
                    stringsAsFactors = FALSE)

library(tidyverse)

#Subset data
Power_subset <- Power %>% filter(Date == '1/2/2007' | Date == '2/2/2007')

#Convert Date and Time variables
date_time <- strptime(paste(Power_subset$Date, Power_subset$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S") 

#Set 2 plots per row and 2 rows
par(mfrow = c(2,2))

#Make plots
plot(date_time, 
     Power_subset$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(date_time,
     Power_subset$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(date_time, 
     Power_subset$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")

lines(date_time, 
      Power_subset$Sub_metering_2, 
      type = "l", 
      col = "red")

lines(date_time, 
      Power_subset$Sub_metering_3, 
      type = "l", 
      col = "blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "red", "blue"),
       bty = "n",
       cex = 0.3)

plot(date_time, 
     Power_subset$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

#Save plot
dev.copy(png, file = 'plot4.png', width = 480, height = 480)
dev.off()









