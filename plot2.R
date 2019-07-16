#Load data
Power <- read.table(file = "household_power_consumption.txt",
                    sep =";",
                    header = TRUE,
                    na.strings = "?",
                    stringsAsFactors = FALSE)

library(tidyverse)

#Subset data
Power_subset <- Power %>% filter(Date == '1/2/2007' | Date == '2/2/2007')

#Convert Date and Time variables
date_time <- strptime(paste(Power_subset$Date, Power_subset$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S") 

#Change language to English
Sys.setlocale("LC_ALL","English")

#Make plot
plot2 <- plot(date_time, 
              as.numeric(Power_subset$Global_active_power), 
              type="l", 
              xlab="", 
              ylab="Global Active Power (kilowatts)")

#Save plot
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()





