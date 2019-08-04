#avNNet can be used for classification and regression
#tuning parameters: size (hidden units), decay, bagging

nnetGrid <- expand.grid(decay = c(0.001, .01, .1), 
                        size = seq(1, 27, by = 2), 
                        bag = FALSE)
set.seed(1234)
nnetFit <- train(y ~ .,
                 data = dfTrain,
                 method = "avNNet",
                 tuneGrid = nnetGrid,
                 preProc = c("center", "scale", "BoxCox"),
                 linout = TRUE,
                 trace = FALSE,
                 maxit = 1000,
                 allowParallel = FALSE,
                 trControl = ctrl)

set.seed(1234)
nnetFit <- train(y ~ .,
                 data = dfTrain,
                 method = "avNNet",
                 tuneLength = 50,
                 preProc = c("center", "scale", "BoxCox"),
                 linout = TRUE,
                 trace = FALSE,
                 maxit = 1000,
                 allowParallel = FALSE,
                 trControl = ctrl)