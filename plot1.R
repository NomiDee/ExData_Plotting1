#Import full dataset
dataFile<-"C:/Users/Data Science - Coursera/data/household_power_consumption.txt"
data<-read.table(dataFile, header=TRUE, sep=';', stringsAsFactors=FALSE, dec=".")

#Subset the data
data$Date=as.Date(data$Date,'%d/%m/%Y') 
Feb2007 = subset(data, Date == '2007-02-01' | Date == '2007-02-02') 

#convert global active power to numeric value
Feb2007$Global_active_power=as.numeric(Feb2007$Global_active_power)

#plot histogram
hist(Feb2007$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")
axis(side=2, at= seq(0,1200, by=200), labels=TRUE)

#save to file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
