setwd("C:/Users/zjpla/OneDrive/Work/R/Unit 2 -Linear Regression")
Training<- read.csv("pisa2009train.csv")
Test<-read.csv("pisa2009test.csv")
str(Training)
tapply(Training$grade,Training$male,mean)
tapply(Training$readingScore,Training$male,mean)
pisaTrain=na.omit
pisaTrain=na.omit(Training)
pisaTest<-na.omit(Test)
str(pisaTrain)
summary(pisaTest)
str(pisaTest)
pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")
str(pisaTest)
ImScore=lm(pisaTrain$readingScore ~.,data =pisaTrain )
summary(ImScore)
lmscore<-ImScore
SSE<- sum( (lmscore$residuals)^2)
RMSE<- sqrt ( SSE/nrow(pisaTrain))
RMSE
predTest<-predict(lmscore,newdata = pisaTest)
summary(predTest)
str(predTest)
SSE=sum( (pisaTest$readingScore- predTest )^2)
SSR= sqrt(SSE/nrow(pisaTest))
SSR
baseline = mean(pisaTrain$readingScore)
baseline
savehistory("C:/Users/zjpla/Desktop/temp.r")

# To include unordered factors in a linear regression model, we define one level as the "reference level" and add a binary variable for each of the remaining levels. In this way, a factor with n levels is replaced by n-1 binary variables. The reference level is typically selected to be the most frequently occurring level in the dataset.
# 
# As an example, consider the unordered factor variable "color", with levels "red", "green", and "blue". If "green" were the reference level, then we would add binary variables "colorred" and "colorblue" to a linear regression problem. All red examples would have colorred=1 and colorblue=0. All blue examples would have colorred=0 and colorblue=1. All green examples would have colorred=0 and colorblue=0.
# 
# Now, consider the variable "raceeth" in our problem, which has levels "American Indian/Alaska Native", "Asian", "Black", "Hispanic", "More than one race", "Native Hawaiian/Other Pacific Islander", and "White". Because it is the most common in our population, we will select White as the reference level.

# Because the race variable takes on text values, it was loaded as a factor variable when we read in the dataset with read.csv() -- you can see this when you run str(pisaTrain) or str(pisaTest). However, by default R selects the first level alphabetically ("American Indian/Alaska Native") as the reference level of our factor instead of the most common level ("White"). Set the reference level of the factor by typing the following two lines in your R console:
#   
#   pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
# 
# pisaTest$raceeth = relevel(pisaTest$raceeth, "White")
# 
# Now, build a linear regression model (call it lmScore) using the training set to predict readingScore using all the remaining variables.
# 
# It would be time-consuming to type all the variables, but R provides the shorthand notation "readingScore ~ ." to mean "predict readingScore using all the other variables in the data frame." The period is used to replace listing out all of the independent variables. As an example, if your dependent variable is called "Y", your independent variables are called "X1", "X2", and "X3", and your training data set is called "Train", instead of the regular notation:
#   
#   LinReg = lm(Y ~ X1 + X2 + X3, data = Train)
# 
# You would use the following command to build your model:
#   
#   LinReg = lm(Y ~ ., data = Train)

#

