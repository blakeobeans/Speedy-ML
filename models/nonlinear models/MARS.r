#multivariate adaptive regression splines (MARS)
#splines create a piecewise linear model where each new feature models an isolated portion of the original data
#splines have hinge functions, cut points determined for each point on the data

#cross-validation, as we have with the previous models, to find the optimal number of knots.
#two tuning parameters: degree (product degree) is the number of interactions
#nprune (#terms): Consequently, once the full set of knots have been created, we can sequentially remove knots that do not contribute significantly to 
  #predictive accuracy. This process is known as "pruning"

#tuneGrid = expand.grid(degree = 1, nprune = 2:25),

library(earth)

# create a tuning grid
hyper_grid <- expand.grid(
  degree = 1:3, 
  nprune = seq(2, 100, length.out = 10) %>% floor()
)

set.seed(1234)
splineTune <- train(y ~ ., 
                 data=dfTrain,
                 method = "earth",
                 preProc = c("center", "scale", "BoxCox"), 
                 tuneLength = 50,
                 trControl = ctrl,
                 metric = "ROC")

plot(splineTune)

print(splineTune)
#It also shows us that 38 of 41 terms were used from 27 of the 307 original predictors. But what does this mean? If we were to look at all the coefficients, we would see that there are 38 terms in our model (including the intercept). These terms include hinge functions produced from the original 307 predictors (307 predictors because the model automatically dummy encodes our categorical variables). Looking at the first 

splineTune$bestTune
splinePred <- predict(splineTune, dhfrTest)
splineProbs <- predict(splineTune, dhfrTest, type = "prob")
confusionMatrix(splinePred, dhfrTest$Y)

#variable importance plot
p1 <- vip(splineTune, num_features = 40, bar = FALSE, value = "gcv") + ggtitle("GCV")

#partial importance plots!!!
p1 <- partial(tuned_mars, pred.var = "Gr_Liv_Area", grid.resolution = 10) %>% autoplot()
p2 <- partial(tuned_mars, pred.var = "Year_Built", grid.resolution = 10) %>% autoplot()
p3 <- partial(tuned_mars, pred.var = c("Gr_Liv_Area", "Year_Built"), grid.resolution = 10) %>% 
  plotPartial(levelplot = FALSE, zlab = "yhat", drape = TRUE, colorkey = TRUE, screen = list(z = -20, x = -60))

gridExtra::grid.arrange(p1, p2, p3, ncol = 3)
