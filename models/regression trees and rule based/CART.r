#CART minimzes the sum of square errors between two different groups. This is also known as recursive partitioning.

###resampling
set.seed(1234)
cartTune <- train(y ~ ., 
                  data=dfTrain,
                  method = "rpart",
                  preProc = c("center", "scale", "BoxCox"), 
                  tuneLength = 50,
                  trControl = ctrl,
                  metric = "ROC")
plot(cartTune)
cartPred <- predict(cartTune, dhfrTest)
cartProbs <- predict(cartTune, dhfrTest, type = "prob")
confusionMatrix(cartPred, dhfrTest$Y)