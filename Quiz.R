#Question 1 et 2
#Download Data and Dictionnary
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="DL_Data2006.csv",method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",destfile="DL_Data2006.pdf",method="curl")

myData <- read.table("DL_Data2006.csv",sep=",",header=TRUE)

#Number of rows of property over 1M€
nrow(subset(myData,myData$VAL==24))

#Question 3
#Download Data 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile="govNGAP.xlsx",method="curl")

install.packages("xlsx")
library(xlsx)
dat <- read.xlsx("govNGAP.xlsx",header=TRUE,sheetIndex=1,startRow=18,endRow=23)
dat <- dat[,c(7:15)]
sum(dat$Zip*dat$Ext,na.rm=T) 

#Question 4
#Download Data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",destfile="Resto.xml",method="curl")

install.packages("XML")
library(XML)

myData <- xmlTreeParse("Resto.xml",useInternal=TRUE)
rootNode <- xmlRoot(myData)
#How many restaurants have zipcode 21231?
v <- xpathSApply(rootNode,"//zipcode",xmlValue)
a <- table(v)
a[names(a)==21231]

#Question 4
#Download Data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile="pid.csv",method="curl")

install.packages("data.table")
library(data.table)
DT <- fread("pid.csv")

> system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
utilisateur     système      écoulé 
0.036       0.002       0.037 
> system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
Erreur dans rowMeans(DT) : 'x' doit être numérique
Timing stopped at: 0.649 0.022 0.671 
> system.time({sapply(split(DT$pwgtp15,DT$SEX),mean)})
utilisateur     système      écoulé 
0.001       0.000       0.001 
> system.time(tapply(DT$pwgtp15,DT$SEX,mean))
utilisateur     système      écoulé 
0.002       0.000       0.001 
> system.time(DT[,mean(pwgtp15),by=SEX])
utilisateur     système      écoulé 
0.001       0.000       0.002 
> system.time(mean(DT$pwgtp15,by=DT$SEX))
utilisateur     système      écoulé 
0           0           0 