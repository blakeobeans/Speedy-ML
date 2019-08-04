#regression only

cbGrid <- expand.grid(committees = c(1, 5, 10, 50, 75, 100), 
                      neighbors = c(0, 1, 3, 5, 7, 9))
set.seed(669)
cbFit <- train(CompressiveStrength ~ .,
               data = training,
               method = "cubist",
               tuneGrid = cbGrid,
               trControl = ctrl)
