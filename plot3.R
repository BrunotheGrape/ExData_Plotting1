require(data.table) #loads data.table package
ihepc <- fread("household_power_consumption.txt", header = TRUE,) # uses data.table package to read in data
ihepc1 <- subset(ihepc, ihepc$Date == "2/1/2007") #subset data by year
ihepc2 <- subset(ihepc, ihepc$Date == "2/2/2007")
ihepcs <- rbind(ihepc1, ihepc2) #combines the two subsets
ihepcs[ihepcs == "?"] <- NA # converts "?" to "NA"
strptime(ihepcs$Date,"%m/%d/%Y")
dt <- as.POSIXct(paste(ihepcs$Date, ihepcs$Time)) # creates formated date time column "dt"
ihepct <- cbind(ihepcs,dt) #adds the date time column to the data frame
ihepct$Global_active_power <- as.numeric(ihepcs$Global_active_power) #converts data to numeric
png(filename = "plot3.png") # creates png file
plot3 <- plot(ihepct$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="", axes = FALSE)# creates base plot
axis(1, at = c(1, 1440, 2880), labels = c("Thur", "Fri", "Sat")) # creates x axis
axis(2, at = c(0, .25, .5, .75, 1), labels = c("0", "10", "20", "30", "40")) # creates y axis
lines(ihepct$Sub_metering_2, type = "l", col = "red")
lines(ihepct$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub-metering_3"), text.col = c("black", "red", "blue"), lty = 1, col = c("black", "red", "blue"))
#legend("topright", c("Sub_metering_2", lty = 1, col = "red")
#legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3", col = c("black", "red", "blue"))
dev.off() # saves plot and turns off device


