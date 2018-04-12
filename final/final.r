# install and import imputeTS
install.packages("imputeTS")
library(imputeTS)
library(zoo)
#import dataset
fargo_data <- read.csv("C:/Users/matt/source/repos/ds700/final/fargo.csv")
#convert year month to date
fargo_data$YearMonth = as.yearmon(as.character(fargo_data$YearMonth), "%Y%m")
fargo_data$YearMonth = as.ts(fargo_data$YearMonth)
#use impute ts to fill in NA values by Exponential Weighted Moving Average with four points on either side
fargo_data$TotalHeartExams = na.ma(fargo_data$TotalHeartExams, k = 4, weighting = "exponential")
#Holt Winters 
## Seasonal Holt-Winters
(m <- HoltWinters(fargo_data))
plot(fargo_data)
plot(fitted(fargo_data))
#ARIMA Model
?ts
