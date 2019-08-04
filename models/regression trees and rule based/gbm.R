#classification or regression

gbmGrid <- expand.grid(interaction.depth = seq(1, 19, by = 2),
                       n.trees = seq(100, 1000, by = 50),
                       shrinkage = c(0.01, 0.1),
                       n.minobsinnode = 10)
set.seed(1234)
gbmFit <- train(y ~ .,
                data = dfTrain,
                method = "gbm",
                tuneGrid = gbmGrid,
                preProc = c("center", "scale", "BoxCox"), 
                verbose = FALSE,
                trControl = ctrl)