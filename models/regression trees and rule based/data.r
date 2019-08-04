library(caret)
###
library(doParallel)
x <- detectCores()
registerDoParallel(cores=x)
###
data(dhfr)
response <- dhfr$Y #pull out response
dhfr <- subset(dhfr, select = -c(Y)) #remove from data
#checked for dummies, all numeric
#remove nzv predictors
nzv <- nearZeroVar(dhfr); dhfr <- dhfr[, -nzv]
#remove highly correlated predictors
descrCor <-  cor(dhfr)
highlyCorDescr <- findCorrelation(descrCor, cutoff = .75) #163 highly correlated
dhfr <- dhfr[,-highlyCorDescr]
sum(is.na(dhfr)) #complete data set
#linear combinations
comboInfo <- findLinearCombos(dhfr); comboInfo 
#dhfr <- dhfr[, -comboInfo$remove] #none to remove
#join reponse
dhfr$Y <- response
##look at split
prop.table(table(dhfr$Y))
#parition data
set.seed(1234)
inTrainingSet <- createDataPartition(dhfr$Y, 
                                     p=.8, 
                                     list = FALSE,
                                     times = 1) #an index of row numbers
dhfrTrain <- dhfr[inTrainingSet,]
dhfrTest <- dhfr[-inTrainingSet,]
###preprocess
preProcValues <- preProcess(dhfr, method = c("center", "scale")); preProcValues