library(data.table)
options(digits = 10)

pow = fread("household_power_consumption.txt",sep=';',stringsAsFactors = F,na.strings = '?')
str(pow)
pow = subset(pow,pow$Date=='1/2/2007' | pow$Date=='2/2/2007')
pow$timestamp = as.POSIXct(paste0(pow$Date,' ',pow$Time),format='%d/%m/%Y %H:%M:%S')

png('plot2.png',width = 480,height = 480,units = 'px');
plot(Global_active_power~timestamp,data = pow,type='l',xlab='',ylab='Global Active Power (kilowatt)');
dev.off();