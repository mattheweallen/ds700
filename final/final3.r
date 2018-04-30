# install and import imputeTS
install.packages("imputeTS")
library(imputeTS)
install.packages("forecast")
library(forecast)

#import dataset
#todo get this one
fargo_data <- read.csv("C:/Users/matt/source/repos/ds700/final/fargo2.csv")

#use impute ts to fill in NA values by Exponential Weighted Moving Average with four points on either side
fargo_data$TotalHeartExams = na.ma(fargo_data$TotalHeartExams, k = 4, weighting = "exponential")
write.csv(fargo_data,"C:/Users/matt/source/repos/ds700/final/fargo_imputed.csv")

#import imputed dataset
fargo_data_imputed <- read.csv("C:/Users/matt/source/repos/ds700/final/fargo_imputed.csv")

#initial plot of the data
plot.ts(fargo_data_imputed$TotalHeartExams, ylab = "Cardiac Exams", main="Incoming Cardiac Exams Abbeville, LA")

#Holt Winters
#todo new method
#https://www.rdocumentation.org/packages/aTSA/versions/3.1.2
#https://www.rdocumentation.org/packages/aTSA/versions/3.1.2/topics/Holt
install.packages("aTSA")
library(aTSA)
holtwithAIC = Holt(fargo_data_imputed$TotalHeartExams, alpha=0.2028283, beta = 0.1497088)
holtwithAIC


# Let R calaculate best values for alpha
forecast.mean <- HoltWinters(fargo_data_imputed$TotalHeartExams, gamma=FALSE)
# check alpha and beta suggested by R
forecast.mean
holtwinters.forecast = forecast(forecast.mean, h=12)
holtwinters.forecast
accuracy(holtwinters.forecast)

#predict next twelve months with Holt-Winters
forecast.predict <- predict(forecast.mean, n.ahead = 12, prediction.interval = TRUE)
forecast.predict
plot.ts(fargo_data_imputed$TotalHeartExams, xlim=c(10, 103), ylim=c(100, 7000), ylab = "Cardiac Exams", main="Holt-Winters Forecast Incoming Cardiac Exams Abbeville, LA")
lines(forecast.mean$fitted[,1], col="green")
lines(forecast.predict[,1], col="blue")
lines(forecast.predict[,2], col="yellow")
lines(forecast.predict[,3], col="red")

#ARIMA Model
# build a time series from data
arimaTS  <- ts(fargo_data_imputed$TotalHeartExams)
# review the time series
arimaTS
# Assess the time series using ACF and PACF
acf(arimaTS)
pacf(arimaTS)
# load the "forecast" package
require(forecast)
arima.fit  <- auto.arima(x = arimaTS)
# review the ARIMA model
arima.fit
# check the ACF and PACF of the ARIMA model residuals
acf(arima.fit$residuals)
pacf(arima.fit$residuals)
# check the coefficients
coef(arima.fit)
#forecast next 12 months using the ARIMA model
arima.forecast  <- forecast(arima.fit, h = 12)
arima.forecast
# review the predictions 
accuracy(arima.forecast)


#plot arima model
plot.ts(fargo_data_imputed$TotalHeartExams, xlim=c(10, 103), ylim=c(100, 7000), ylab = "Cardiac Exams", main="ARIMA Forecast Incoming Cardiac Exams Abbeville, LA")

lines(arima.fit$fitted, col="green")
lines(arima.forecast$mean, col="blue")
lines(arima.forecast$upper[,2], col="yellow")
lines(arima.forecast$lower[,2], col="red")
