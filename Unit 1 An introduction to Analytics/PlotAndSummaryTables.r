#Plot
hist(WHO$CellularSubscribers)
boxplot(WHO$LifeExpectancy ~ WHO$Region)
boxplot(WHO$LifeExpectancy ~ WHO$Region,xlab="",ylab="Life Expectancy",main="Life Expectancy of Countries by Region")
table(WHO$Region)
tapply(WHO$Over60,WHO$Region,mean)
tapply(WHO$LiteracyRate,WHO$Region,min,na.rm=TRUE)

