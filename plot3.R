powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerdata <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

subpowerdata$Date <- as.Date(subpowerdata$Date, format="%d/%m/%Y")
subpowerdata$Time <- strptime(subpowerdata$Time, format="%H:%M:%S")
subpowerdata[1:1440,"Time"] <- format(subpowerdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerdata[1441:2880,"Time"] <- format(subpowerdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(subpowerdata$Time,subpowerdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")