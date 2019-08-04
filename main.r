library(AppliedPredictiveModeling)
library(RMariaDB)
library(tidyverse)
library(lubridate)
library(visdat)
library(gmodels)
library(corrplot)
library(caret)
library(DMwR)
library(glmnet)
library(mda)
library(klaR)
library(C50)
library(ranger)
library(xgboost)
library(earth)
library(party)

source('scripts/wrangling/ETL.r') #ETL
source('scripts/wrangling/wrangle.r') #wrangle
source('scripts/wrangling/missing_data.r') #missing data- review impute under pre-processing...
source('scripts/pre-processing/00. transform.r') #transformation- 41 VARS
source('scripts/pre-processing/01. dummyvars.r') #dummyvars- warning OK- 48 VARS
source('scripts/pre-processing/03. nzv.r') #nzv 48 TO 39 VARS
source('scripts/pre-processing/04. correlated predictors.r') #correlated predictors 39 to 28
source('scripts/pre-processing/05. partitioning.r') #partition data

#done online
source('scripts/resampling.r') #resampling
source('scripts/db_upload.r') #upload

#then train!!!

#don't forget
save.image("my_work_space.RData")
