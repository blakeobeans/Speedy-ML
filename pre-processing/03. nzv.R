###Zero- and Near Zero-Variance Predictors
#NZV are ok for tree-based models, but not others 
#a high frequency ratio- the frequency of the most prevalent value of the second most will be near 1 for well-behaved, large for unbalanced
nearZeroVar(df) #returns positions of variables flagged to be problematic
nzv <- nearZeroVar(df, saveMetrics= TRUE) 
#nzv[nzv$nzv,][1:10,]
#remove NSV predictors
#dim(df)
nzv <- nearZeroVar(df)
df <- df[, -nzv]
rm(nzv)
