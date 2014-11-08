# read the data file
data<-read.csv("household_power_consumption.txt",sep=";")

# convert factors to usable data
data$date <- as.Date(data$Date, format="%d/%m/%Y")

# create the plot data set between the proper dates
DATE1 = as.Date("2007-02-01")
DATE2 = as.Date("2007-02-02")
plot_df <- data[data$date >= DATE1 & data$date <= DATE2,]

# create date_time field for graphing
plot_df$date_time <- as.POSIXct(paste(plot_df$Date, plot_df$Time), format="%d/%m/%Y %H:%M:%S")
# convert factor data into graphable numeric data
plot_df$Global_active_power <- as.numeric(as.character(plot_df$Global_active_power))

# Create a graphing function
graph <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Global_active_power, type="n",
     ylab="Global Active Power (kilowatts)")
  lines(plot_df$date_time, plot_df$Global_active_power)
}

# Let me see the graph
graph(plot_df)

# create the plot as a png
png(filename = "plot2.png", width = 480, height = 480)
graph(plot_df)
dev.off()
