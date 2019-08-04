tune_grid <- expand.grid(
  nrounds = seq(from = 200, to = nrounds, by = 50),
  eta = 0.025,
  max_depth = 4,
  gamma = 0,
  colsample_bytree = 1,
  min_child_weight = c(1,2,3),
  subsample = 1
)

tune_control <- caret::trainControl(
  method = "cv", # cross-validation
  number = 3, # with n folds 
  #index = createFolds(tr_treated$Id_clean), # fix the folds
  verboseIter = FALSE, # no training log
  allowParallel = TRUE # FALSE for reproducible results 
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
