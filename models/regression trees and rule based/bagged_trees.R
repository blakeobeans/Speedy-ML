In the 1990s, ensemble techniques (methods that combine many models predictions) began to appear. 
Bagging, short for bootstrap aggregation, was one of the earliest developed ensemble techniques.
no tuning parameters

set.seed(1234)
treebagTune <- train(y ~ ., 
                     data=dfTrain,
                     method = "treebag",
                     preProc = c("center", "scale", "BoxCox"), 
                     tuneLength = 50,
                     trControl = ctrl,
                     metric = "ROC")
#plot(treebagTune)
treebagTune$bestTune
treebagPred <- predict(treebagTune, dhfrTest)
treebagProbs <- predict(treebagTune, dhfrTest, type = "prob")
confusionMatrix(treebagPred, dhfrTest$Y)