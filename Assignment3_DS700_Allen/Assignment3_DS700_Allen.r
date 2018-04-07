# Load data
income_data <- read.csv("C:/Users/matt/source/repos/ds700/Assignment3_DS700_Allen/acs_ny_with_income_binary.csv")
# Examine data
head(income_data)
#create density plot of data
# Kernel Density Plot
d <- density(income_data$FamilyIncome) # returns the density data 
plot(d) # plots the results
#histogram of family income
hist(income_data$FamilyIncome, main = "Histogram of Family Income", xlab="Family Income")
# Fit logistic regression
model <- glm(formula=FamilyIncomeGreaterThanOrEqualTo150000~HouseCosts+FoodStamp,data=income_data,family="binomial")

# Display the model
model
# Display summary of the model
summary(model)
newData <- data.frame(HouseCosts=100,FoodStamp='Yes')
# Predict if income greater than or equal to 150,000 for HouseCosts=100 and FoodStamp ='Yes'
predict(model,newData, type = "response")

#try two other models and compare AIC, lower AIC the better
model2 <- glm(formula=FamilyIncomeGreaterThanOrEqualTo150000~HouseCosts+FoodStamp,data=income_data,family="binomial")
