con <- dbConnect(MariaDB(),
                 user = 'blakeobeans',
                 password = '***',
                 host = 'mydbinstance4.***.us-west-1.rds.amazonaws.com',
                 dbname='blakeobeans')

dbWriteTable(conn = con, name = 'sf_data', value = dfTrain, overwrite = TRUE)

#dfTrain <- dbReadTable(conn = con, name = 'sf_data', value = dfTrain, overwrite = TRUE)

