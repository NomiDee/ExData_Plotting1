#Import full dataset
dataFile<-"C:/Users/nh14/Dropbox (KiTEC)/Data Science - Coursera/data/household_power_consumption.txt"
data<-read.table(dataFile, header=TRUE, sep=';', stringsAsFactors=FALSE, dec=".")

#Subset the data
data$Date=as.Date(data$Date,'%d/%m/%Y') 
Feb2007 = subset(data, Date == '2007-02-01' | Date == '2007-02-02') 

#convert global active power to numeric value
Feb2007$Global_active_power=as.numeric(Feb2007$Global_active_power)

#Combine date and times and set variables
datetime <- paste(as.Date(Feb2007$Date), Feb2007$Time)
Feb2007$datetime<- as.POSIXct(datetime)

#Open png device
png(file="C:/Users/nh14/Dropbox (KiTEC)/Data Science - Coursera/Exploratory data analysis/plot3.png", width=480, height=480)

#plot histogram
plot(Feb2007$datetime, Feb2007$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="l")
lines(Feb2007$datetime, Feb2007$Sub_metering_2, col='red')
lines(Feb2007$datetime, Feb2007$Sub_metering_3, col='blue')

# legend
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)

#close png device
dev.off()