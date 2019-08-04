#mixture (non-linear discriminant analysis)
#classification only
#tuning parameter: subclasses (# per class)

set.seed(1234)
mdaTune <- train(y ~ ., 
                 data=dfTrain,
                 method = "mda",
                 preProc = c("center", "scale", "BoxCox"), 
                 tuneLength = 50,
                 trControl = ctrl,
                 metric = "ROC")

plot(mdaTune)
mdaTune$bestTune
mdaPred <- predict(mdaTune, dhfrTest)
mdaProbs <- predict(mdaTune, dhfrTest, type = "prob")
confusionMatrix(mdaPred, dhfrTest$Y)