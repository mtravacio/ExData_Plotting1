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

#Make plot
plot1 <- hist(as.numeric(Power_subset$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Save plot as png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
