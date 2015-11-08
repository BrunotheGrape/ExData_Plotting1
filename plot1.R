require(data.table) #loads data.table package
ihepc <- fread("household_power_consumption.txt", header = TRUE,) # uses data.table package to read in data
ihepc1 <- subset(ihepc, ihepc$Date == "2/1/2007") #subset data by year
ihepc2 <- subset(ihepc, ihepc$Date == "2/2/2007")
ihepcs <- rbind(ihepc1, ihepc2) #combines the two subsets
ihepcs[ihepcs == "?"] <- NA # converts "?" to "NA"
ihepcs$Global_active_power <- as.numeric(ihepcs$Global_active_power) #converts data to numeric
png(filename = "plot1.png") # creates png file
plot1 <- hist(ihepcs$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency") # creates plot
dev.off() # saves plot and turns off device


