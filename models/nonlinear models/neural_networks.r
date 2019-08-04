#neural networks can be used for classification and regression
#tuning parameters: size (# hidden units) and decay (weight decay)
#method = 'nnet'

#start with a single layer feed forward network
#weight decay is used to regularize 

set.seed(1234)
nnwTune <- train(y ~ ., 
                 data=dfTrain,
                 method = "nnet",
                 preProc = c("center", "scale", "BoxCox"), 
                 tuneLength = 50,
                 trControl = ctrl,
                 metric = "ROC")

plot(nnwTune)
nnwTune$bestTune
nnwPred <- predict(nnwTune, dhfrTest)
nnwProbs <- predict(nnwTune, dhfrTest, type = "prob")
confusionMatrix(nnwPred, dhfrTest$Y)
