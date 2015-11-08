require(data.table) #loads data.table package
ihepc <- fread("household_power_consumption.txt", header = TRUE,) # uses data.table package to read in data
#ihepc[1:5,]
#png(filename = "plot1.png")
ihepc1 <- subset(ihepc, ihepc$Date == "2/1/2007")
ihepc2 <- subset(ihepc, ihepc$Date == "2/2/2007")
ihepcs <- rbind(ihepc1, ihepc2)
#ihepcs[1:5]
ihepcs[ihepcs == "?"] <- NA
ihepcs$Global_active_power <- as.numeric(ihepcs$Global_active_power)
#ihepcs$Time <- strptime(ihepcs$Time, format = "%H:%M:%S")
png(filename = "plot1.png")
plot1 <- hist(ihepcs$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()


