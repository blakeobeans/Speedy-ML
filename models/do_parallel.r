library(doParallel)
x <- detectCores()
registerDoParallel(cores=x)
rm(x)
