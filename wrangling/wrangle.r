###claim data
#convert to date
claim_data$clm_dates <- mdy(claim_data$clm_dates)
#convert after_indicator to factor- at fault or not at fault?
claim_data$aft_ind <- as.factor(claim_data$aft_ind)
levels(claim_data$aft_ind) <- c("not_at_fault", "at_fault")
#spread after_indicator to two variables
claim_data$index <- seq(1:nrow(claim_data))
claim_data <- spread(claim_data, aft_ind, pd_amt) #plenty of NA's
#5 years before application date of 1/1/17
claim_data <- claim_data %>% filter(clm_dates >= "2012-01-01") 
#count number of at_fault and not_at_fault occurrences
claim_data <- claim_data %>% group_by(hhld_id) %>% 
  summarise(n_not_at_fault = n_distinct(not_at_fault),
            n_at_fault = n_distinct(at_fault))

###join predictors and sub_loss datasets to claim_data
#join sub_loss and predictors
temp <- full_join(sub_loss, predictors, by='hhld_id')
#join previous with claim_data
df <- left_join(claim_data, temp, by='hhld_id')
rm(temp); rm(predictors); rm(sub_loss); rm(claim_data)

###future claim indicator moved to first column and four variables dropped (hhld_id is irrelevant and the last 3 are not known prior to accident)
df <- df %>% dplyr::select(future_clm_ind, everything()) %>% dplyr::select(-c("hhld_id", "premium", "loss_amount", "loss_ratio")) 
df$future_clm_ind <- as.factor(df$future_clm_ind)
levels(df$future_clm_ind) <-c("no", "yes")
