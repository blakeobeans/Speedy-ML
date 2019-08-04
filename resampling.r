ctrl <- trainControl(method = "repeatedcv", 
                     number = 10, #10-fold cross validation 
                     repeats = 5, #repeated
                     search = "random",
                     classProbs = TRUE,
                     summaryFunction = twoClassSummary,
                     sampling = "smote")

#for xgb

ctrl <- trainControl(
  method = "cv", # cross-validation
  number = 3, # with n folds 
  verboseIter = FALSE, # no training log
  allowParallel = TRUE, # FALSE for reproducible results
  classProbs = TRUE,
  summaryFunction = twoClassSummary,
  sampling = "smote" 
)