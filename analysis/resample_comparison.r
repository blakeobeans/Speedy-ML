library(AppliedPredictiveModeling)

#we make statistical statements about their performance 
#first collect the resampling results using resamples()

ls()
rs <- resamples(list("boosted_tree" = c50Tune,
                     "CART" = cartTune,
                     "flex_discriminant" = fdaTune,
                     "conditional_trees" = ctreeFit,
                     "gradient_boost" = gbmFit,
                     "kn_neighbors" = knnTune,
                     "naive_bayes" = nbTune,
                     "non-linear_da" = mdaTune,
                     "neural_net_avg" = nnetFit,
                     "nn_works" = nnwTune,
                     "pl_squares" = plsFit,
                     "random_forest" = rfTune,
                     "ridge_regression" = ridgeTune,
                     "mar_splin" = splineTune,
                     "sv_machine" = svmTune,
                     "bagged_CART" = treebagTune))

#others "xg_boost"= xgb_base



summary(rs)
ggplot(rs)
bwplot(rs)
