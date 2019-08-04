
vis_miss(df, sort_miss = TRUE)

#credit_score- 4.42% missing
#time_w_carr- time (years) with current insurer- 2.73% missing
#prior_bi- Bodily Injury Coverage Individual Limit with current insurer- 2.73% missing (same observations as time_w_carr)

#veh_lien_cnt- number of liens on car. 99.8% missing data, could be biased reporting, so this variable will be excluded
df <- df %>% dplyr::select(-c("veh_lien_cnt"))

###Impute!
pre.process <- preProcess(df[,-1], method = "bagImpute")
imputed.data <- predict(pre.process, df)
#overwrite original data with imputed data
df <- as.data.frame(imputed.data)

rm(imputed.data); rm(pre.process)






