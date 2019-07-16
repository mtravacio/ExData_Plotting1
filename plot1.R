Power <- read.table(file = "household_power_consumption.txt",
                    sep =";",
                    header = TRUE,
                    na.strings = "?",
                    stringsAsFactors = FALSE)

library(tidyverse)

Power_subset <- Power %>% filter(Date == '1/2/2007' | Date == '2/2/2007')

plot1 <- hist(as.numeric(as.character(Power_subset$Global_active_power)),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
