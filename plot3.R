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
png(filename = "plot2.png") # creates png file
plot2 <- plot(ihepct$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="", axes = FALSE)# creates base plot
axis(1, at = c(1, 1440, 2880), labels = c("Thur", "Fri", "Sat")) # creates x axis
axis(2, at = c(0, 2, 4, 6, 8), labels = c("0", "2", "4", "6", "8")) # creates y axis
dev.off() # saves plot and turns off device


