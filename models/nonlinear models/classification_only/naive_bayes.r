set.seed(1234)
nbTune <- train(y ~ ., 
                 data=dfTrain,
                 method = "nb",
                  preProc = c("center", "scale", "BoxCox"), 
                 tuneLength = 50,
                 trControl = ctrl,
                 metric = "ROC")

# top 5 modesl
nbTune$results %>% 
  top_n(5, wt = Accuracy) %>%
  arrange(desc(Accuracy))

##   usekernel fL adjust  Accuracy     Kappa AccuracySD   KappaSD
## 1      TRUE  1      3 0.8737864 0.4435322 0.02858175 0.1262286
## 2      TRUE  0      2 0.8689320 0.4386202 0.02903618 0.1155707
## 3      TRUE  2      3 0.8689320 0.4750282 0.02830559 0.0970368
## 4      TRUE  2      4 0.8689320 0.4008608 0.02432572 0.1234943
## 5      TRUE  4      5 0.8689320 0.4439767 0.02867321 0.1354681

# plot search grid results
plot(nbTune)
nbTune$bestTune
nbPred <- predict(nbTune, dhfrTest)
nbProbs <- predict(nbTune, dhfrTest, type = "prob")
confusionMatrix(nbPred, dhfrTest$Y)