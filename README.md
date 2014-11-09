ExploreData-Project1
====================

## Reading the data
from 
```
data<-read.csv("household_power_consumption.txt",sep=";")
```

## Making the data usable (& in the required range)
```
# convert factors to usable data
data$date <- as.Date(data$Date, format="%d/%m/%Y")

# create the plot data set between the proper dates
DATE1 = as.Date("2007-02-01")
DATE2 = as.Date("2007-02-02")
plot_df <- data[data$date >= DATE1 & data$date <= DATE2,]

# create date_time field for graphing
plot_df$date_time <- as.POSIXct(paste(plot_df$Date, plot_df$Time), format="%d/%m/%Y %H:%M:%S")
# convert factor data into graphable numeric data
plot_df$Global_reactive_power  <- as.numeric(as.character(plot_df$Global_reactive_power))
plot_df$Global_active_power    <- as.numeric(as.character(plot_df$Global_active_power))
plot_df$Sub_metering_1         <- as.numeric(as.character(plot_df$Sub_metering_1))
plot_df$Sub_metering_2         <- as.numeric(as.character(plot_df$Sub_metering_2))
plot_df$Sub_metering_3         <- as.numeric(as.character(plot_df$Sub_metering_3))
plot_df$Voltage                <- as.numeric(as.character(plot_df$Voltage))
```

## Plot 1
### Relevant Code
```
graph <- function(plot_df) {
  hist(plot_df$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
}

# create the plot as a png
png(filename = "plot1.png", width = 480, height = 480)
graph(plot_df)
dev.off()
```
### Graph
![alt text](https://github.com/btihen/ExploreData-Project1/blob/master/plot1.png "Plot 1")


## Plot 2
### Relevant Code
```
graph <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Global_active_power, type="n",
     ylab="Global Active Power (kilowatts)", xlab="")
  lines(plot_df$date_time, plot_df$Global_active_power)
}

# create the plot as a png
png(filename = "plot2.png", width = 480, height = 480)
graph(plot_df)
dev.off()
```
### Graph
![alt text](https://github.com/btihen/ExploreData-Project1/blob/master/plot2.png "Plot 2")


## Plot 3
### Relevant Code
```
graph <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Sub_metering_1, type="n",
     ylab="Energy sub metering", xlab="")
  lines(plot_df$date_time, plot_df$Sub_metering_1, col="black")
  lines(plot_df$date_time, plot_df$Sub_metering_2, col="red")
  lines(plot_df$date_time, plot_df$Sub_metering_3, col="blue")
  legend("topright", 
    legend = c("Sub metering 1","Sub metering 2","Sub metering 3"),
    lty=c(1,1,1), # gives the legend appropriate symbols (lines)
    col=c("black","red","blue"))
}

# create the plot as a png
png(filename = "plot3.png", width = 480, height = 480)
graph(plot_df)
dev.off()
```
### Graph
![alt text](https://github.com/btihen/ExploreData-Project1/blob/master/plot3.png "Plot 3")

## Plot 4
### Relevant Code
```
# Global Active Power (over time)
graph1 <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Global_active_power, type="n",
     ylab="Global Active Power (kilowatts)", xlab="")
  lines(plot_df$date_time, plot_df$Global_active_power)
}

# Voltage vs DateTime
graph2 <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Voltage, type="n",
     ylab="Voltage", xlab="datetime")
  lines(plot_df$date_time, plot_df$Voltage)
}

# Sub Metering over Time
graph3 <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Sub_metering_1, type="n",
     ylab="Energy sub metering", xlab="")
  lines(plot_df$date_time, plot_df$Sub_metering_1, col="black")
  lines(plot_df$date_time, plot_df$Sub_metering_2, col="red")
  lines(plot_df$date_time, plot_df$Sub_metering_3, col="blue")
  legend("topright", bty = "n",
    legend = c("Sub metering 1","Sub metering 2","Sub metering 3"),
    lty=c(1,1,1), # gives the legend appropriate symbols (lines)
    col=c("black","red","blue"))
}

# global Reactive power vs DateTime
graph4 <- function(plot_df) {
  plot(plot_df$date_time, plot_df$Global_reactive_power, type="n",
     ylab="Global_reative_power", xlab="datetime")
  lines(plot_df$date_time, plot_df$Global_reactive_power)
}

# create the plot as a png
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
graph1(plot_df)
graph2(plot_df)
graph3(plot_df)
graph4(plot_df)
dev.off()
```
### Graph
![alt text](https://github.com/btihen/ExploreData-Project1/blob/master/plot4.png "Plot 4")
