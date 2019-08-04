#one hot encoding creates perfect collinearity which causes problems with some machine learning algorithms 
#dropping one of the variables is called "full-rank" one-hot-encoding
#(i.e. generalized regression models, neural networks).
dummies <- dummyVars(y ~ curnt_insurer, data = df, fullRank=TRUE) #option fullRank=TRUE

###overwrite original data with OHE data
train.dummy <- predict(dummies, newdata = df) #WARNING OK
d <- as.data.frame(train.dummy)
#drop factor predictor
df <- df %>% dplyr::select(-c("curnt_insurer"))
#add dummies
df <- cbind(df, d)
rm(d); rm(train.dummy); rm(dummies)
