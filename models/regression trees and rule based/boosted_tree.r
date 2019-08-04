Examples include C5.0, "Fuzzy Rules", Random Forest rule-based & jrip.

The number of samples affected by a rule is called its coverage. 

Another approach to creating rules from model trees is outlined in Holmes et al. (1993) that uses the "separate and conquer" strategy. This procedure derives rules from many different model trees instead of from a single tree. First, an initial model tree is created (they recommend using unsmoothed model trees). However, only the rule with the largest coverage is saved from this model. The samples covered by the rule are removed from the training set and another model tree is created with the remaining data. Again, only
the rule with the maximum coverage is retained. This process repeats until all the training set data have been covered by at least one rule. A new sample is predicted by determining which rule(s) it falls under then applies the linear model associated with the largest coverage.



###resampling
set.seed(1234)
c50Tune <- train(y ~ ., 
                 data=dfTrain,
                 method = "C5.0",
                 preProc = c("center", "scale", "BoxCox"), 
                 tuneLength = 50,
                 trControl = ctrl,
                 metric = "ROC")
plot(c50Tune)
c50Tune$bestTune
c50Pred <- predict(c50Tune, dhfrTest)
c50Probs <- predict(c50Tune, dhfrTest, type = "prob")
confusionMatrix(c50Pred, dhfrTest$Y)