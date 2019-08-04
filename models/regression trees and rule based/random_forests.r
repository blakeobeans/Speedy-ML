Does not work with missing data. While this uses ranger, method= "rf" is references in the text. 
Also, try conditional random forest method = "cforest"

##ranger
set.seed(1234)
rfTune <- train(y ~ ., 
                data=dfTrain,
                method = "ranger",
                preProc = c("center", "scale", "BoxCox"), 
                tuneLength = 50,
                trControl = ctrl,
                metric = "ROC")
plot(rfTune)
rfTune$bestTune
rfPred <- predict(rfTune, dhfrTest)
rfProbs <- predict(rfTune, dhfrTest, type = "prob")
confusionMatrix(rfPred, dhfrTest$Y)
