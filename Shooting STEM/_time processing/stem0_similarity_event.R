library(devtools)
library(twitteR)
library(tm)
library(ggplot2)
library(RColorBrewer)
library(wordcloud)
library(graph)
library(Rgraphviz)
library(topicmodels)
require(data.table)
library(tidytext)
library(dplyr)
require(devtools)
library(lubridate)
#install_github("sentiment140", "okugami79")
library(sentiment) # sentiment analysis

stem0_13 <- read.csv(file="Shooting STEM/stem0/stem13_2.csv",header=TRUE);
stem0_21 <- read.csv(file="Shooting STEM/stem0/stem21_2.csv",header=TRUE);
stem0_12_13 <- read.csv(file="Shooting STEM/stem0/stem0_12_13.csv",header=TRUE);
stem0_20_21 <- read.csv(file="Shooting STEM/stem0/stem0_20_21.csv",header=TRUE);

removeURL <- function(x) gsub("http[^[:space:]]*", "", x);               # remove URLs
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x);     # remove anything other than English letters or space
removeNum <- function(x) gsub("[[:digit:]]+", "", x);                    # remove numbers
removeHand <- function(x) gsub("@.*","", x);                             # remove twitter handles
removeUser <- function(x) gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", x)     # Remove the "RT" (retweet) and usernames 
myStopwords <- c(setdiff(stopwords('english'), c("r", "big")),"use", "see", "used", "via", "amp", "rt", "can");     # remove stopwords
stemCompletion2 <- function(x, dictionary) {                               # words stem
  x <- unlist(strsplit(as.character(x), " "))
  x <- x[x != ""]
  x <- stemCompletion(x, dictionary=dictionary)
  x <- paste(x, sep="", collapse=" ")
  PlainTextDocument(stripWhitespace(x))
}
textclean <- function (myCorpus) {
  myCorpus <- tm_map(myCorpus, content_transformer(removeURL));
  myCorpus <- tm_map(myCorpus, content_transformer(removeNumPunct));
  myCorpus <- tm_map(myCorpus, content_transformer(removeHand));
  myCorpus <- tm_map(myCorpus, stripWhitespace);                          # remove extra whitespace
  myCorpus <- tm_map(myCorpus, content_transformer(tolower));             # convert to lower case
  myCorpus <- tm_map(myCorpus, removeWords, myStopwords);
  return(myCorpus)
}
textclean2 <- function (tweettext) {
  tweettext <- as.character(tweettext);
  tweettext <- iconv(tweettext, to = "ASCII", sub = " ");
  tweettext <- gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", tweettext)  # Remove the "RT" (retweet) and usernames 
  tweettext <- gsub("http.+ |http.+$", " ", tweettext)  # Remove html links
  tweettext <- gsub("http[[:alnum:]]*", "", tweettext)
  tweettext <- gsub("[[:punct:]]", " ", tweettext)  # Remove punctuation
  tweettext <- gsub("[ |\t]{2,}", " ", tweettext)   # Remove tabs
  tweettext <- gsub("^ ", "", tweettext)  # Leading blanks
  tweettext <- gsub(" $", "", tweettext)  # Lagging blanks
  tweettext <- gsub(" +", " ", tweettext) # General spaces 
  tweettext <- tolower(tweettext);
}

wordFreq <- function(corpus, word) {
  results <- lapply(corpus,
                    function(x) { grep(as.character(x), pattern=paste0("nn<",word)) }
  )
  sum(unlist(results))
}
pal <- brewer.pal(9, "BuGn")[-(1:4)]              # colors

############################ N0-EVENT (aggregated) ################################
###################################################################################
###################################################################################

myCorpus13 <- Corpus(VectorSource(stem0_13$text)); 
myCorpus13 <- textclean(myCorpus13);            # text cleaning
writeLines(strwrap(myCorpus13[[20]]$content, 60))
myCorpusCopy13 <- myCorpus13;
#myCorpus13 <- tm_map(myCorpus13, stemDocument);                             # stem words
#myCorpus13 <- Corpus(VectorSource(lapply(myCorpus13, stemCompletion2, dictionary=myCorpusCopy13)));
#myCorpus13 <- tm_map(myCorpus13, content_transformer(stemCompletion), dictionary = myCorpusCopy13);
writeLines(strwrap(myCorpus13[[20]]$content, 60))
# count word frequence
tdm13 <- TermDocumentMatrix(myCorpus13,control = list(wordLengths = c(1, Inf)));
freq.terms13 <- findFreqTerms(tdm13, lowfreq = 20);
term.freq13 <- rowSums(as.matrix(tdm13));
term.freq13 <- subset(term.freq13, term.freq13 >= 20);
df13 <- data.frame(term = names(term.freq13), freq = term.freq13)
ggplot(df13, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc13 <- as.matrix(tdm13);
word.freq13 <- sort(rowSums(wc13), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq13), freq = word.freq13, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm13, "shooting", 0.2) # which words are associated with 'shooting'?
plot(tdm13, term = freq.terms13, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths13 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus13)));
dtm13 <- DocumentTermMatrix(myCorpus13[doc.lengths13 > 0]);
# choosing 2, 5 and 10 topics
lda13_2 <- LDA(dtm13, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda13_5 <- LDA(dtm13, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda13_10 <- LDA(dtm13, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms13_2 <- as.matrix(terms(lda13_2,10)); # top 10 terms in topics
top10terms13_5 <- as.matrix(terms(lda13_5,10));
top10terms13_10 <- as.matrix(terms(lda13_10,10));
lda.topics13_5 = as.matrix(topics(lda13_5));
lda.topics13_2 = as.matrix(topics(lda13_2));
lda.topics13_10 = as.matrix(topics(lda13_10));
summary(as.factor(lda.topics13_5[,1]))
summary(as.factor(lda.topics13_2[,1]))
summary(as.factor(lda.topics13_10[,1]))

topicprob13_5 = as.matrix(lda13_5@gamma);
topicprob13_2 = as.matrix(lda13_2@gamma);
topicprob13_10 = as.matrix(lda13_10@gamma);

tweet13 <- textclean2(stem0_13$text);
writeLines(tweet13[[20]])

# Sentiment Analysis
# Tokenizing character file
token13 <- data.frame(text=tweet13, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti13 <- inner_join(token13, get_sentiments("bing")) %>% count(sentiment);
senti13_temp <- inner_join(token13, get_sentiments("bing"));
senti13 <- data.frame(table(senti13_temp$sentiment));
colnames(senti13) <- c("sentiment","n");
senti13$percent = (senti13$n/sum(senti13$n))*100;
#Plotting the sentiment summary 
ggplot(senti13, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments13 <- sentiment(stem0_13$text)
table(sentiments13$polarity)
# sentiment plot
sentiments13$score <- 0
sentiments13$score[sentiments13$polarity == "positive"] <- 1
sentiments13$score[sentiments13$polarity == "negative"] <- -1
sentiments13$time <- as.POSIXct(round(as.POSIXct(stem0_13$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result13 <- aggregate(score ~ time, data = sentiments13, sum)
ggplot(result13,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

############################ EVENT (aggregated) ###################################
###################################################################################
###################################################################################

myCorpus21 <- Corpus(VectorSource(stem0_21$text)); 
myCorpus21 <- textclean(myCorpus21);            # text cleaning
writeLines(strwrap(myCorpus21[[20]]$content, 60))
# count word frequence
tdm21 <- TermDocumentMatrix(myCorpus21,control = list(wordLengths = c(1, Inf)));
freq.terms21 <- findFreqTerms(tdm21, lowfreq = 20);
term.freq21 <- rowSums(as.matrix(tdm21));
term.freq21 <- subset(term.freq21, term.freq21 >= 20);
df21 <- data.frame(term = names(term.freq21), freq = term.freq21)
ggplot(df21, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc21 <- as.matrix(tdm21);
word.freq21 <- sort(rowSums(wc21), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq21), freq = word.freq21, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm21, "shooting", 0.2) # which words are associated with 'shooting'?
plot(tdm21, term = freq.terms21, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths21 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus21)));
dtm21 <- DocumentTermMatrix(myCorpus21[doc.lengths21 > 0]);
# choosing 2, 5 and 10 topics
lda21_2 <- LDA(dtm21, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda21_5 <- LDA(dtm21, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda21_10 <- LDA(dtm21, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms21_2 <- as.matrix(terms(lda21_2,10)); # top 10 terms in topics
top10terms21_5 <- as.matrix(terms(lda21_5,10));
top10terms21_10 <- as.matrix(terms(lda21_10,10));
lda.topics21_5 = as.matrix(topics(lda21_5));
lda.topics21_2 = as.matrix(topics(lda21_2));
lda.topics21_10 = as.matrix(topics(lda21_10));
summary(as.factor(lda.topics21_5[,1]))
summary(as.factor(lda.topics21_2[,1]))
summary(as.factor(lda.topics21_10[,1]))

topicprob21_5 = as.matrix(lda21_5@gamma);
topicprob21_2 = as.matrix(lda21_2@gamma);
topicprob21_10 = as.matrix(lda21_10@gamma);

tweet21 <- textclean2(stem0_21$text);
writeLines(tweet21[[20]])

# Sentiment Analysis
# Tokenizing character file
token21 <- data.frame(text=tweet21, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti21 <- inner_join(token21, get_sentiments("bing")) %>% count(sentiment);
senti21_temp <- inner_join(token21, get_sentiments("bing"));
senti21 <- data.frame(table(senti21_temp$sentiment));
colnames(senti21) <- c("sentiment","n");
senti21$percent = (senti21$n/sum(senti21$n))*100;
#Plotting the sentiment summary 
ggplot(senti21, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments21 <- sentiment(stem0_21$text)
table(sentiments21$polarity)
# sentiment plot
sentiments21$score <- 0
sentiments21$score[sentiments21$polarity == "positive"] <- 1
sentiments21$score[sentiments21$polarity == "negative"] <- -1
sentiments21$time <- as.POSIXct(round(as.POSIXct(stem0_21$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result21 <- aggregate(score ~ time, data = sentiments21, sum)
ggplot(result21,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus20_21 <- Corpus(VectorSource(stem0_20_21$text)); 
myCorpus20_21 <- textclean(myCorpus20_21);            # text cleaning
writeLines(strwrap(myCorpus20_21[[20]]$content, 60))
# count word frequence
tdm20_21 <- TermDocumentMatrix(myCorpus20_21,control = list(wordLengths = c(1, Inf)));
freq.terms20_21 <- findFreqTerms(tdm20_21, lowfreq = 10);
term.freq20_21 <- rowSums(as.matrix(tdm20_21));
term.freq20_21 <- subset(term.freq20_21, term.freq20_21 >= 10);
df20_21 <- data.frame(ind=rep("0_20_21",length(term.freq20_21)), term = names(term.freq20_21), freq = term.freq20_21)
ggplot(df20_21, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc20_21 <- as.matrix(tdm20_21);
word.freq20_21 <- sort(rowSums(wc20_21), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq20_21), freq = word.freq20_21, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm20_21, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm20_21, term = freq.terms20_21, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths20_21 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus20_21)));
dtm20_21 <- DocumentTermMatrix(myCorpus20_21[doc.lengths20_21 > 0]);
# choosing 2, 5 and 10 topics
lda20_21_2 <- LDA(dtm20_21, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda20_21_5 <- LDA(dtm20_21, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda20_21_10 <- LDA(dtm20_21, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms20_21_2 <- as.matrix(terms(lda20_21_2,10)); # top 10 terms in topics
top10terms20_21_5 <- as.matrix(terms(lda20_21_5,10));
top10terms20_21_10 <- as.matrix(terms(lda20_21_10,10));
lda.topics20_21_5 = as.matrix(topics(lda20_21_5));
lda.topics20_21_2 = as.matrix(topics(lda20_21_2));
lda.topics20_21_10 = as.matrix(topics(lda20_21_10));
summary(as.factor(lda.topics20_21_5[,1]))
summary(as.factor(lda.topics20_21_2[,1]))
summary(as.factor(lda.topics20_21_10[,1]))

topicprob20_21_5 = as.matrix(lda20_21_5@gamma);
topicprob20_21_2 = as.matrix(lda20_21_2@gamma);
topicprob20_21_10 = as.matrix(lda20_21_10@gamma);

tweet20_21 <- textclean2(stem0_20_21$text);
writeLines(tweet20_21[[20]])

# Sentiment Analysis
# Tokenizing character file
token20_21 <- data.frame(text=tweet20_21, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti20_21 <- inner_join(token20_21, get_sentiments("bing")) %>% count(sentiment);
senti20_21_temp <- inner_join(token20_21, get_sentiments("bing"));
senti20_21 <- data.frame(table(senti20_21_temp$sentiment));
colnames(senti20_21) <- c("sentiment","n");
senti20_21$percent = (senti20_21$n/sum(senti20_21$n))*100;
#Plotting the sentiment summary 
ggplot(senti20_21, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments20_21 <- sentiment(stem0_20_21$text)
table(sentiments20_21$polarity)
# sentiment plot
sentiments20_21$score <- 0
sentiments20_21$score[sentiments20_21$polarity == "positive"] <- 1
sentiments20_21$score[sentiments20_21$polarity == "negative"] <- -1
sentiments20_21$time <- as.POSIXct(round(as.POSIXct(stem0_20_21$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result20_21 <- aggregate(score ~ time, data = sentiments20_21, sum)
ggplot(result20_21,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus12_13 <- Corpus(VectorSource(stem0_12_13$text)); 
myCorpus12_13 <- textclean(myCorpus12_13);            # text cleaning
writeLines(strwrap(myCorpus12_13[[200]]$content, 60))
# count word frequence
tdm12_13 <- TermDocumentMatrix(myCorpus12_13,control = list(wordLengths = c(1, Inf)));
freq.terms12_13 <- findFreqTerms(tdm12_13, lowfreq = 10);
term.freq12_13 <- rowSums(as.matrix(tdm12_13));
term.freq12_13 <- subset(term.freq12_13, term.freq12_13 >= 10);
df12_13 <- data.frame(ind=rep("0_12_13",length(term.freq12_13)), term = names(term.freq12_13), freq = term.freq12_13)
ggplot(df12_13, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc12_13 <- as.matrix(tdm12_13);
word.freq12_13 <- sort(rowSums(wc12_13), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq12_13), freq = word.freq12_13, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm12_13, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm12_13, term = freq.terms12_13, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths12_13 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus12_13)));
dtm12_13 <- DocumentTermMatrix(myCorpus12_13[doc.lengths12_13 > 0]);
# choosing 2, 5 and 10 topics
lda12_13_2 <- LDA(dtm12_13, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda12_13_5 <- LDA(dtm12_13, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda12_13_10 <- LDA(dtm12_13, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms12_13_2 <- as.matrix(terms(lda12_13_2,10)); # top 10 terms in topics
top10terms12_13_5 <- as.matrix(terms(lda12_13_5,10));
top10terms12_13_10 <- as.matrix(terms(lda12_13_10,10));
lda.topics12_13_5 = as.matrix(topics(lda12_13_5));
lda.topics12_13_2 = as.matrix(topics(lda12_13_2));
lda.topics12_13_10 = as.matrix(topics(lda12_13_10));
summary(as.factor(lda.topics12_13_5[,1]))
summary(as.factor(lda.topics12_13_2[,1]))
summary(as.factor(lda.topics12_13_10[,1]))

topicprob12_13_5 = as.matrix(lda12_13_5@gamma);
topicprob12_13_2 = as.matrix(lda12_13_2@gamma);
topicprob12_13_10 = as.matrix(lda12_13_10@gamma);

tweet12_13 <- textclean2(stem0_12_13$text);
writeLines(tweet12_13[[20]])

# Sentiment Analysis
# Tokenizing character file
token12_13 <- data.frame(text=tweet12_13, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti12_13 <- inner_join(token12_13, get_sentiments("bing")) %>% count(sentiment);
senti12_13_temp <- inner_join(token12_13, get_sentiments("bing"));
senti12_13 <- data.frame(table(senti12_13_temp$sentiment));
colnames(senti12_13) <- c("sentiment","n");
senti12_13$percent = (senti12_13$n/sum(senti12_13$n))*100;
#Plotting the sentiment summary 
ggplot(senti12_13, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments12_13 <- sentiment(stem0_12_13$text)
table(sentiments12_13$polarity)
# sentiment plot
sentiments12_13$score <- 0
sentiments12_13$score[sentiments12_13$polarity == "positive"] <- 1
sentiments12_13$score[sentiments12_13$polarity == "negative"] <- -1
sentiments12_13$time <- as.POSIXct(round(as.POSIXct(stem0_12_13$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result12_13 <- aggregate(score ~ time, data = sentiments12_13, sum)
ggplot(result12_13,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################


