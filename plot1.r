if(!file.exists("./data")){dir.create("./data")}
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"data/zipfile.zip")
unzip(zipfile = "data/zipfile.zip", exdir = "./data")
household_Power<- read.table("data/household_power_consumption.txt", sep=";", header = T)
household_Power$Date<- as.Date(household_Power$Date, format = "%d/%m/%Y")
household_Power_sub<- with(household_Power, household_Power[(Date >= "2007-02-01" & Date <= "2007-02-02"), ])
summary(household_Power_sub)
##Plot1
household_Power_sub$Global_active_power<- as.numeric(as.character(household_Power_sub$Global_active_power))
##setting background white
par(bg="white")
##File as png and defining the dimensions
png(file="plot1.png",width=480,height=480)
hist(household_Power_sub$Global_active_power, col = "red", 
     xlab= "Global Active Power(kilowatts)", main = "Global Active power")
dev.off()
