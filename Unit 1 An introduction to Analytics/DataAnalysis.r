getwd()

WHO=read.csv("WHO.csv")
str(WHO)
summary(WHO)
WHO_Europe=subset(WHO,region="Europe")
str(WHO_Europe)
write.csv(WHO_Europe,"WHO_Europe.csv")
ls()
rm(WHO_Europe)

WHO$Under15
mean(WHO$Under15)
sd(WHO$Under15)
summary(WHO$Under15)
which.min(WHO$Under15)
which.max(WHO$Under15)
WHO$Country[124]
plot(WHO$GNI,WHO$FertilityRate)
Outliers=subset(WHO,GNI>10000 & FertilityRate >2.5)
nrow(Outliers)
Outliers[c("Country","GNI","FertilityRate")]

