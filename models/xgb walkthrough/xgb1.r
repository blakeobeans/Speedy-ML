tune_grid <- expand.grid(
  nrounds = seq(from = 200, to = nrounds, by = 50),
  eta = c(0.025, 0.05, 0.1, 0.3),
  max_depth = c(2, 3, 4, 5, 6),
  gamma = 0,
  colsample_bytree = 1,
  min_child_weight = 1,
  subsample = 1
)

tune_control <- caret::trainControl(
  method = "cv", # cross-validation
  number = 3, # with n folds 
  verboseIter = FALSE, # no training log
  allowParallel = TRUE, # FALSE for reproducible results 
  classProbs = TRUE,
  summaryFunction = twoClassSummary,
  sampling = "smote"
)

xgb_tune <- train(
  y ~ .,
  data = dfTrain,
  trControl = tune_control,
  tuneGrid = tune_grid,
  method = "xgbTree",
  verbose = TRUE
)

plot(xgb_tune)


