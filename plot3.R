library(data.table)
options(digits = 10)

pow = fread("household_power_consumption.txt",sep=';',stringsAsFactors = F,na.strings = '?')
str(pow)
pow = subset(pow,pow$Date=='1/2/2007' | pow$Date=='2/2/2007')
pow$timestamp = as.POSIXct(paste0(pow$Date,' ',pow$Time),format='%d/%m/%Y %H:%M:%S')


png('plot3.png',width = 480,height = 480,units = 'px');
plot(Sub_metering_1~timestamp,data = pow,type='l',xlab='',ylab='Energy sub metering',col='black');
points(Sub_metering_2~timestamp,data = pow,type='l',col='red');
points(Sub_metering_3~timestamp,data = pow,type='l',col='blue');
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1);
dev.off();

