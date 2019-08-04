library(caret)
str(dfTrain)
varImp(xgb_base)
varImp(c50Tune)
hist(dfTrain$avg_age)

y <- ifelse(dfTrain$y == "no", 0, 1)
plot(y ~ dfTrain$max_age) #weird
plot(y ~ dfTrain$prior_bi)
plot(y ~ dfTrain$credit_score) #weird

levels(dfTrain$y)
as.numeric(as.character(dfTrain$y))
library(varhandle)
y <- unfactor(dfTrain$y)
