library(data.table)
options(digits = 10)

pow = fread("household_power_consumption.txt",sep=';',stringsAsFactors = F,na.strings = '?')
str(pow)
pow = subset(pow,pow$Date=='1/2/2007' | pow$Date=='2/2/2007')
pow$timestamp = as.POSIXct(paste0(pow$Date,' ',pow$Time),format='%d/%m/%Y %H:%M:%S')

png('plot4.png',width = 480,height = 480,units = 'px');
par(mfrow=c(2,2));
#4-1
plot(Global_active_power~timestamp,data = pow,type='l',xlab='',ylab='Global Active Power (kilowatt)');
#4-2
plot(Voltage~timestamp,data = pow,type='l',xlab='datetime',ylab='Voltage');
#4-3
plot(Sub_metering_1~timestamp,data = pow,type='l',xlab='',ylab='Energy sub metering',col='black');
points(Sub_metering_2~timestamp,data = pow,type='l',col='red');
points(Sub_metering_3~timestamp,data = pow,type='l',col='blue');
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1,bty = 'n');
#4-4
plot(Global_reactive_power~timestamp,data = pow,type='l',xlab='datetime',ylab='Global_rective_power');
dev.off();