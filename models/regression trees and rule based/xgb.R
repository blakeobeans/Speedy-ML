eXtreme Gradient Boosting

method = 'xgbTree'
Type: Regression, Classification

Tuning parameters:
  
  nrounds (# Boosting Iterations)
    max_depth (Max Tree Depth)
    eta (Shrinkage)
    gamma (Minimum Loss Reduction)
    colsample_bytree (Subsample Ratio of Columns)
    min_child_weight (Minimum Sum of Instance Weight)
    subsample (Subsample Percentage)
    Required packages: xgboost, plyr
    
    A model-specific variable importance metric is available.
    
      grid_default <- expand.grid(
        nrounds = 100,
        max_depth = 6,
        eta = 0.3,
        gamma = 0,
        colsample_bytree = 1,
        min_child_weight = 1,
        subsample = 1
      )
      
      train_control <- caret::trainControl(
        method = "none",
        verboseIter = FALSE, # no training log
        allowParallel = TRUE # FALSE for reproducible results 
      )
      
      xgb_base <- caret::train(
        y ~ ., data=dfTrain
        trControl = train_control,
        tuneGrid = grid_default,
        method = "xgbTree",
        verbose = TRUE
      )
    
    #####
    
    set.seed(12345)
    xgb_base <- train(
      y ~ ., data=dfTrain,
      trControl = ctrl,
      tuneLength = 50,
      method = "xgbTree",
      verbose = TRUE
    )