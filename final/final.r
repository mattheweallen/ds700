# install and import imputeTS
install.packages("imputeTS")
library(imputeTS)
#import dataset
fargo_data <- read.csv("C:/Users/matt/source/repos/ds700/final/fargo.csv")
#use impute ts to fill in NA values by Exponential Weighted Moving Average with four points on either side
TotalExamsWithImputedVals = na.ma(fargo_data$TotalHeartExams, k = 4, weighting = "exponential")
#TotalExamsWithImputedVals = na.interpolation(fargo_data$TotalHeartExams, option="linear")
TotalExamsWithImputedVals
