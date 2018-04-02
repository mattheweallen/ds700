#code for question 1
# Install and load the following packages
install.packages("twitteR")
install.packages("RCurl")
install.packages("tm")
install.packages("wordcloud")
require(twitteR)
require(RCurl)
require(tm)
require(wordcloud)

# Create a developer account at apps.twitter.com to create an app and to get the following keys
consumer_key  <- my_consumer_key
consumer_secret  <- my_consumer_secret
access_token  <- my_access_token
access_secret  <- my_access_secret
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Get the tweets from Twitter 
wisc_tweets = searchTwitter("Wisconsin", n=1001, lang="en")
wisc_text = sapply(wisc_tweets, function(x) x$getText())

# Create a corpus
wisc_corpus = Corpus(VectorSource(wisc_text))

# Inspect the corpus
inspect(wisc_corpus[1])

# Clean the corpus by removing punctuation, numbers, and white spaces
wisc_clean  <- tm_map(wisc_corpus, removePunctuation)
wisc_clean  <- tm_map(wisc_clean, removeNumbers)
wisc_clean  <- tm_map(wisc_clean, stripWhitespace)
wisc_clean <- tm_map(wisc_clean, removeWords, stopwords('english')) #remove stopwords
wisc_clean <- tm_map(wisc_clean, content_transformer(tolower))
#install.packages("SnowballC")
#library(SnowballC)
#wisc_clean < tm_map(wisc_clean, stemDocument) #tried stemming. could not get it to work.

#create colorful wordcloud
wordcloud(wisc_clean, random.order = F, max.words = 25, scale = c(3, 0.5), color = rainbow(50))

#code for question 3
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
