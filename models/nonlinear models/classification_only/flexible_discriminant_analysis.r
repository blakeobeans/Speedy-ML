set.seed(1234)
fdaTune <- train(y ~ ., 
                 data=dfTrain,
                 method = "fda",
                 preProc = c("center", "scale", "BoxCox"), 
                 tuneLength = 50,
                 trControl = ctrl,
                 metric = "ROC")