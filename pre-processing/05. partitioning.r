set.seed(1234)
inTrainingSet <- createDataPartition(df$y, 
                                     p=.8, 
                                     list = FALSE,
                                     times = 1) #an index of row numbers
dfTemp <- df[inTrainingSet,]
dfTest <- df[-inTrainingSet,]

inValidationSet <- createDataPartition(dfTemp$y, 
                                       p=.8, 
                                       list = FALSE,
                                       times = 1) #an index of row numbers

dfTrain <- dfTemp[inValidationSet,]
dfValidation <- dfTemp[-inValidationSet,]
rm(dfTemp); rm(inTrainingSet); rm(inValidationSet)
