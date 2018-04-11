# # #install and import amelia
# install.packages("Amelia")
# # #library(Amelia)
# # 
# # #import dataset
# # fargo_data <- read.csv("C:/Users/irgepi/ds/ds700/final/fargo.csv")
# # 
# # fargo_data_2 <- read.csv("C:/Users/irgepi/ds/ds700/final/twocols.csv")
# # 
# # # Set bounds for the imputed values, greater than zero and less than 10000, in order to prevent the imputation of negative numbers which would be unrealistic values for number of exams.
# # one.prior= c(1,2)
# # two.prior= c(0, 0)
# # three.prior = c(10000, Inf)
# # prior.mat = matrix(c(one.prior, two.prior, three.prior), nrow = 2, ncol = 3)
# # 
# # prior.mat
# # 
# # am_av = amelia(fargo_data, m = 1)
# # am_av[1]
# # testy = amelia(fargo_data_2, m = 5, ts = "YearMonth")
# # testy[1]
# 
# #install.packages("forecast")
install.packages("imputeTS")
library(imputeTS)
# library(forecast)

install.packages("Hmisc")
library(Hmisc)
#import dataset
fargo_data <- read.csv("C:/Users/irgepi/ds/ds700/final/fargo.csv")
#use impute ts to fill in NA values by Exponential Weighted Moving Average with four points on either side
TotalExamsWithImputedVals = na.ma(fargo_data$TotalHeartExams, k = 4, weighting = "exponential")
