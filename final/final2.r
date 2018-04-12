# install and import imputeTS
install.packages("imputeTS")
library(imputeTS)
install.packages("forecast")
library(forecast)

#import dataset
fargo_data <- read.csv("C:/Users/matt/source/repos/ds700/final/fargo2.csv")

#use impute ts to fill in NA values by Exponential Weighted Moving Average with four points on either side
fargo_data$TotalHeartExams = na.ma(fargo_data$TotalHeartExams, k = 4, weighting = "exponential")
write.csv(fargo_data,"C:/Users/matt/source/repos/ds700/final/fargo_imputed.csv")

#import imputed dataset
fargo_data_imputed <- read.csv("C:/Users/matt/source/repos/ds700/final/fargo_imputed.csv")

#initial plot of the data
plot.ts(fargo_data_imputed$TotalHeartExams, ylab = "Cardiac Exams", main="Incoming Cardiac Exams Abbeville, LA")

#Holt Winters 
# Let R calaculate best values for alpha
forecast.mean <- HoltWinters(fargo_data_imputed$TotalHeartExams, gamma=FALSE)
# check alpha and beta suggested by R
forecast.mean

accuracy(forecast.mean) 


forecast.predict <- predict(forecast.mean, n.ahead = 12, prediction.interval = TRUE)
forecast.predict
plot.ts(fargo_data_imputed$TotalHeartExams, xlim=c(10, 103), ylim=c(100, 7000), ylab = "Cardiac Exams", main="Forecasted Incoming Cardiac Exams Abbeville, LA")
lines(forecast.mean$fitted[,1], col="green")
lines(forecast.predict[,1], col="blue")
lines(forecast.predict[,2], col="green")
lines(forecast.predict[,3], col="red")


#ARIMA Model
# build a time series from data
myTS  <- ts(fargo_data_imputed$TotalHeartExams)
# review the time series
myTS
# Assess the time series using ACF and PACF
acf(myTS)
pacf(myTS)
# load the "forecast" package
require(forecast)
myBestForecast  <- auto.arima(x = myTS)
# review the ARIMA model
myBestForecast
# check the ACF and PACF of the ARIMA model residuals
acf(myBestForecast$residuals)
pacf(myBestForecast$residuals)
# check the coefficients
coef(myBestForecast)
# predict next 12 months using the ARIMA model
NextForecasts  <- predict.Arima(myBestForecast, n.ahead=12)
# review the predictions 
NextForecasts
# plot the predictions
plot.forecast(NextForecasts)
# try second ARIMA models - this time provide p,d,q values
MyBestForecast2  <- arima(myTS, order=c(2,1,1))
# review the second ARIMA model
MyBestForecast2
# check the ACF and PACF of the ARIMA model residuals
acf(MyBestForecast2$residuals)
pacf(MyBestForecast2$residuals)
coef(MyBestForecast2)
# # predict next five months using the second ARIMA model
NextForecasts2  <- forecast.Arima (MyBestForecast2, h=5)
# review the predictions from the second ARIMA model
NextForecasts2
# plot the predictions from the second ARIMA model
plot.forecast(NextForecasts2)
# optional - create another ARIMA model by using different p, d, q values


