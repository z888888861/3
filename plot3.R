data=read.table("C://Users//Jacky//Desktop//a.txt",sep=";")
new=data[which(as.character(data[,1])=="1/2/2007"|
                 as.character(data[,1])=="2/2/2007"),]

names(new)=c("Date","Time","Global_active_power","global_reactive_power",
              "Voltage","Global_intensity","Sub_metering_1",
              "Sub_metering_2","Sub_metering_3")

new$datetime=strptime(paste(new$Date, new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

plot(x=new$datetime,new$Sub_metering_1,type = "l",xlab = "",ylab="Energy sub metering")
lines(x=new$datetime,new$Sub_metering_2,col="red")
lines(x=new$datetime,new$Sub_metering_3,col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))




dev.copy(png,file="C://Users//Jacky//Desktop//Assignment//plot3.png")
dev.off()


