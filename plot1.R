# read the data file
data<-read.csv("household_power_consumption.txt",sep=";")

# convert date to usable data
data$date <- as.Date(data$Date, format="%d/%m/%Y")

# select the data in the dates of interest
DATE1 = as.Date("2007-02-01")
DATE2 = as.Date("2007-02-02")
plot_df <- data[data$date >= DATE1 & data$date <= DATE2,]

# make the graphing data usable
plot_df$Global_active_power <- as.numeric(as.character(plot_df$Global_active_power))

# create I can see the graph
hist(plot_df$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# create the plot as a png
png(filename = "plot1.png", width = 480, height = 480)
#    units = "px", bg = "transparent")
#    units = "px", pointsize = 12, bg = "white", res = NA,
#    restoreConsole = TRUE)
hist(plot_df$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
