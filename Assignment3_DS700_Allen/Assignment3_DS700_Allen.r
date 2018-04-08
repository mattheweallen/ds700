#install package for coefficient plot
install.packages("arm")
library(arm) # for coefplot()
# Load data
income_data <- read.csv("C:/Users/matt/source/repos/ds700/Assignment3_DS700_AllenOrig/acs_ny_with_income_binary.csv")
# Examine data
head(income_data)
#create density plot of data
# Kernel Density Plot
d <- density(income_data$FamilyIncome) # returns the density data 
plot(d, main = "Density Plot of Family Income", xlab="Family Income") # plots the results
#histogram of family income
hist(income_data$FamilyIncome, main = "Histogram of Family Income", xlab="Family Income")
# Fit logistic regression
model <- glm(formula=FamilyIncomeGreaterThanOrEqualTo150000~HouseCosts+Insurance,data=income_data,family="binomial")

# Display the model
model
# Display summary of the model
summary(model)
#coeff plot
coefplot(model, vertical=FALSE, mar=c(5,5,2,2))

#try three other models and compare AIC, lower AIC the better
model2 <- glm(formula=FamilyIncomeGreaterThanOrEqualTo150000~HouseCosts,data=income_data,family="binomial")


coefplot(model2, vertical=FALSE, mar=c(5,5,2,2))
summary(model2)

model3 <- glm(formula=FamilyIncomeGreaterThanOrEqualTo150000~HouseCosts+FoodStamp,data=income_data,family="binomial")




coefplot(model3, vertical=FALSE, mar=c(5,5,2,2))
summary(model3)

model4 <- glm(formula=FamilyIncomeGreaterThanOrEqualTo150000~NumWorkers+HouseCosts,data=income_data,family="binomial")
coefplot(model4, vertical=FALSE, mar=c(5,5,2,2))
summary(model4)

variableNames = c("HouseCosts", "Insurance")
coefplot(summary(model4)$coefficients[,1], summary(model4)$coefficients[,2], vertical=FALSE, varnames=variableNames, ylim=c(-5, 25), main="")
