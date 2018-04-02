# Load the ggplot2 package for creating graphics
remove.packages("ggplot")
install.packages("ggplot2")
require(ggplot2)
# Load the diamonds dataset, it is part of ggplot2
data(diamonds)
# Examine the first few records of the dataset
head(diamonds)
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
# You can change the color using the fill argument
ggplot(data = diamonds) + geom_histogram(aes(x = carat), fill = "grey50") #
# Scatterplot using ggplot2
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()
# Save the ggplot object to a varibale
g <- ggplot(diamonds, aes(x = carat, y = price))
# Call the variable and use color aesthetic
g + geom_point(aes(color = color))
# Boxplot using ggplot2
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()
# Multiple boxplots, one for each level of variable
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()
# Violin plots using ggplot2. Similar to boxplots but provide density of data
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()
# Install package ggthemes
install.packages("ggthemes")
# Load ggthemes
require(ggthemes)
# create a new variable g2
g2 <- g + geom_point(aes(color = color))
# Apply a few themes 
g2 + theme_wsj()
g2 + theme_tufte()
