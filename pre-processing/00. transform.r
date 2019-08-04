#transform logical to numeric
df$hoh_married <- as.numeric(df$hoh_married)

#transform response
table(df$future_clm_ind) #WOW REALLY IMBALANCED.
df$y <- df$future_clm_ind
df$future_clm_ind <- NULL

df <- df %>% dplyr::select(y, everything())
