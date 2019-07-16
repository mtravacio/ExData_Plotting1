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

#Make plot
plot(date_time, 
              Power_subset$Sub_metering_1, 
              type = "l", 
              xlab = "", 
              ylab = "Energy sub metering")
              
lines(date_time,
      Power_subset$Sub_metering_2,
      type = "l", 
      col = "red")
              
lines(date_time,
      Power_subset$Sub_metering_3,
      type = "l",
      col = "blue")
                    
legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save plot
dev.copy(png, file = 'plot3.png', width = 480, height = 480)
dev.off()


