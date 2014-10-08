#Download Data and Dictionnary
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="DL_Data2006.csv",method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",destfile="DL_Data2006.pdf",method="curl")

myData <- read.table("DL_Data2006.csv",sep=",",header=TRUE)

#Number of rows of property over 1M€
nrow(subset(myData,myData$VAL==24))

#Download Data 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile="govNGAP.xlsx",method="curl")

install.packages("xlsx")
library(xlsx)