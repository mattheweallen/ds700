# Load the ggplot2 package for creating graphics
install.packages("ggplot2")
require(ggplot2)
# Load the diamonds dataset, it is part of ggplot2
data(diamonds)
# create a histogram of carats. 
ggplot(data = diamonds) + geom_histogram(aes(x = carat), fill = "darkblue") + labs(x = "Carats") + labs(y = "Count") +labs(title = "Count of Carats") #
mean(diamonds$carat)
median(diamonds$carat)
sd(diamonds$carat)


# Find the maximum and minimum values for carat
max(diamonds$carat)
min(diamonds$carat)
# Histograms are used for examining the distribution of values for a variable
hist(diamonds$carat, main = "Carat Historgram", xlab = "Carat")
# Scatterplots are frequently used to compare two variables with each other
plot(diamonds$carat, diamonds$price)
plot(price ~ carat, data = diamonds)
# Boxplots provide median, quartiles, maximum, and minimum of a dataset. Good for comparing groups
boxplot(diamonds$carat)
# Histogram of diamond carats using ggplot2
ggplot(data = diamonds) + geom_histogram(aes(x = carat))

# Save the ggplot object to a varibale
g <- ggplot(diamonds, aes(x = carat, y = price))
# Call the variable and use color aesthetic
g + geom_point(aes(color = color))
# Boxplot of diamond carats
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot() + labs(x = "") 

# Violin plots using ggplot2. Similar to boxplots but provide density of data
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()

#summarize the data
summary(diamonds)
# Examine the first few records of the dataset
head(diamonds)
