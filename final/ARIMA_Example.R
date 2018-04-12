# install the "forecast" package
install.packages("forecast")
# load the clean data from the CSV file and save it on a variable
myForecast  <- read.table("project_data.csv", header = TRUE)
# examine a few records
head(myForecast)
# build a time series from data
myTS  <- ts(myForecast)
# review the time series
myTS
# plot the time series to find any trends, seasonality, etc.
plot(myTS, ylab = "Number of Exams", xlab = "Months")
# Assess the time series using ACF and PACF
acf(myTS)
pacf(myTS)
# load the "forecast" package
require(forecast)
# use diffing for data transformation. R can find optimal diffing
ndiffs(x = myTS)
# plot to see the effect of diffing
plot(diff(myTS, 1))
# fit the ARIMA model
myBestForecast  <- auto.arima(x = myTS)
# review the ARIMA model
myBestForecast
# check the ACF and PACF of the ARIMA model residuals
acf(myBestForecast$residuals)
pacf(myBestForecast$residuals)
# check the coefficients
coef(myBestForecast)
# predict next five months using the ARIMA model
NextForecasts  <- forecast.Arima (myBestForecast, h=5)
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

