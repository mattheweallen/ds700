# Description of mtcars data
?mtcars
# Load data
data("mtcars")
# Examine data
head(mtcars)
# Summary stats
summary(mtcars)
# Fit logistic regression
model <- glm(formula=vs~wt+disp,data=mtcars,family="binomial")
# Display the model
model
# Display summary of the model
summary(model)
newData <- data.frame(wt=2.1,disp=180)
# Predict the possibility of VS engine when weight = 2.1 and dispacement = 180
predict(model,newData, type = "response")

