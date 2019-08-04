#support vector machines
#classification or regression
###tuning parameters: sigma and cost
#many different methods, including with weights and different shapes
set.seed(1234)
svmTune <- train(y ~ ., 
                    data=dfTrain,
                    method = "svmRadial",
                    preProc = c("center", "scale", "BoxCox"), 
                    tuneLength = 50,
                    trControl = ctrl,
                    metric = "ROC")

plot(svmTune)
svmTune$bestTune
svmPred <- predict(svmTune, dhfrTest)
svmProbs <- predict(svmTune, dhfrTest, type = "prob")
confusionMatrix(svmPred, dhfrTest$Y)