#They tend to select variables that have many possible splits or many missing values. Unlike the others, ctree uses a significance test procedure in order to select variables instead of 
#selecting the variable that maximizes an information measure (e.g. Gini coefficient). can be used for classification and regression

#1 tuning parameter: mincriterion (1-p-value threshold)
set.seed(12345)
ctreeFit <- train(y ~ .,
                  data = dfTrain,
                  method = "ctree",
                  preProc = c("center", "scale", "BoxCox"), 
                  tuneLength = 50,
                  trControl = ctrl)