c50Pred <- predict(c50Tune, dfValidation)
cartPred <- predict(cartTune, dfValidation)
fdaPred <- predict(fdaTune, dfValidation)
gbmPred <- predict(gbmFit, dfValidation)
knnPred <- predict(knnTune, dfValidation)
nbPred <- predict(nbTune, dfValidation) #needs some tweaking...
nnwPred <- predict(nnwTune, dfValidation)
plsPred <- predict(plsFit, dfValidation)
rfPred <- predict(rfTune, dfValidation)
ridgePred <- predict(ridgeTune, dfValidation)
splinePred <- predict(splineTune, dfValidation)
svmPred <- predict(svmTune, dfValidation)
bagtreePred <- predict(treebagTune, dfValidation)
xgbPred <- predict(xgb_base, dfValidation)
ctreePred <- predict(ctreeFit, dfValidation)
mdaPred <- predict(mdaTune, dfValidation)
nnetPred <- predict(nnetFit, dfValidation)


testResults <- rbind(postResample(c50Pred, dfValidation$y),
                     postResample(cartPred, dfValidation$y),
                     postResample(fdaPred, dfValidation$y),
                     postResample(gbmPred, dfValidation$y),
                     postResample(nbPred, dfValidation$y),
                     postResample(nnwPred, dfValidation$y),
                     postResample(plsPred, dfValidation$y),
                     postResample(rfPred, dfValidation$y),
                     postResample(ridgePred, dfValidation$y),
                     postResample(splinePred, dfValidation$y),
                     postResample(svmPred, dfValidation$y),
                     postResample(bagtreePred, dfValidation$y),
                     postResample(xgbPred, dfValidation$y),
                     postResample(nnetPred, dfValidation$y))

testResults <- as.data.frame(testResults)
testResults$Model <- c("boosted_tree",
                       "CART",
                       "flex_discriminant",
                       "gradient_boost",
                       "naive_bayes",
                       "nn_works",
                       "pl_squares",
                       "random_forest",
                       "ridge_regression",
                       "mar_splin",
                       "sv_machine",
                       "bagged_CART",
                       "xgb",
                       "nnet_avg")

print(testResults) #arrange

splineProbs <- predict(splineTune, dfValidation, type = "prob")

confusionMatrix(xgbPred, dfValidation$y)

library(pROC)
rocCurve <- roc(response = dfValidation$y, 
                predictor = splineProbs[, "yes"],
                levels = rev(levels(dfValidation$y)))

plot(rocCurve,
     print.thres = c(.1), #print nominal 50% cutoff and 2%(!) 
     print.thres.pch = 16,
     print.thres.cex = 1.2)
