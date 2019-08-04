descrCor <-  cor(df[,-1])
highCorr <- sum(abs(descrCor[upper.tri(descrCor)]) > .999)

#distribution of correlations (before)
summary(descrCor[upper.tri(descrCor)])

#remove
highlyCorDescr <- findCorrelation(descrCor, cutoff = .85)
df <- df[,-highlyCorDescr]

#distribution of correlations (after)
cor(df[,-1])

rm(descrCor); rm(highCorr); rm(highlyCorDescr)

###create corrplot
nums <- unlist(lapply(df, is.numeric))
my_data <- df[ , nums]
#my_data <- my_data %>% dplyr::select(-c("inforce_ind"))
res <- cor(my_data)
round(res, 2)
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)
rm(my_data); rm(res); rm(nums)
