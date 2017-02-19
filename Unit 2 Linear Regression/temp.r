setwd("C:/Users/zjpla/OneDrive/Work/R/Unit 2 -Linear Regression")
Climate=read.csv(("climate_change.csv"))
str(Climate)
Climate$Year
TrainingSet<-subset(Climate,Climate$Year <= 2006)
View(TrainingSet)
View(TrainingSet)
TestSet=subset(Climate,Climate$Year>2006)
View(Climate)
View(Climate)
Model1<-lm(Temp~ MEI + CO2+CH4+N2O + CFC.11 + CFC.12 + TSI + Aerosols , data = Climate)
summary(Model1)
Model1<-lm(Temp~ MEI + CO2+CH4+N2O + CFC.11 + CFC.12 + TSI + Aerosols , data = TrainingSet)
summary(Model1)
cor(TrainingSet)
Model2=lm(Temp~ MEI +TSI + Aerosols +N2O ,data=TrainingSet)
summary(Model2)
?step
Modelx<-step(Model2)
summary(Modelx)
Predictions<-predict(Modelx,newdata = TestSet)
SSE=sum( (Predictions-TestSet$Temp)^2 )
SSR= sum( (mean(TrainingSet$Temp) - TestSet$Temp)^2)
R2 = 1 - SSE/SST
SST=SSR
R2 = 1 - SSE/SST
r2
R2
savehistory("C:/Users/zjpla/OneDrive/Work/R/Unit 2 -Linear Regression/temp.r")
