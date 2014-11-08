# read the data file
data<-read.csv("household_power_consumption.txt",sep=";")

# convert factors to usable data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# create the plot data set between the proper dates
DATE1 = as.Date("2007-02-01")
DATE2 = as.Date("2007-02-02")
plot1_df <- data[data$Date >= DATE1 & data$Date <= DATE2,]

# Let me see the graph
hist(plot1_df$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowats)")

# create the plot as a png
png(filename = "plot1.png", width = 480, height = 480)
#    units = "px", bg = "transparent")
#    units = "px", pointsize = 12, bg = "white", res = NA,
#    restoreConsole = TRUE)
hist(plot1_df$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowats)")
dev.off()
