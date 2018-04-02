#Instructions and code for creating world clouds in R using Twitter data
#Watch the video for deatils
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

consumer_key  <- '4PblUSttnf86e91yP5C2TP4CW'
consumer_secret  <- 'c26ktkHQSBR976rZCWqcqFzUZiBtiV5PNA6XFZ0fEe1S4kvLs8'
access_token  <- '3303742612-4fr1Mih8uNuGvgcKu5uh8Rn9Lgaf2W8DlJgvGJw'
access_secret  <- 'fuvsKptU0v6FaWj4F2SS6acHjYMTKkEn6PeVOKuIwpjQJ'
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
#wisc_clean < tm_map(wisc_clean, stemDocument)


# Create Word Cloud from clean data
wordcloud(wisc_clean)

# Modify your Word Cloud
wordcloud(wisc_clean, random.order = F, max.words = 25, scale = c(3, 0.5))

wordcloud(wisc_clean, random.order = F, max.words = 25, scale = c(3, 0.5), color = rainbow(50))
