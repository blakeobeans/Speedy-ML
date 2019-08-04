#knn
#classification or regression
#k = number of neighbors (use an odd number to prevent ties)
set.seed(1234)
knnTune <- train(y ~ ., 
                    data=dfTrain,
                    method = "knn",
                    preProc = c("center", "scale", "BoxCox"), 
                    tuneLength = 50,
                    trControl = ctrl,
                    metric = "ROC")

plot(knnTune)
knnTune$bestTune
knnPred <- predict(knnTune, dhfrTest)
knnProbs <- predict(knnTune, dhfrTest, type = "prob")
confusionMatrix(knnPred, dhfrTest$Y)