# from stem0_similarity

stem30_13 <- read.csv(file="Shooting STEM/stem30/stem_30_13_2.csv",header=TRUE);
stem30_22 <- read.csv(file="Shooting STEM/stem30/stem_30_22_2.csv",header=TRUE);
stem30_12_13 <- read.csv(file="Shooting STEM/stem30/stem30_12_13.csv",header=TRUE);
stem30_21_22 <- read.csv(file="Shooting STEM/stem30/stem30_21_22.csv",header=TRUE);

############################ N0-EVENT (aggregated) ################################
###################################################################################
###################################################################################

myCorpus30_13 <- Corpus(VectorSource(stem30_13$text)); 
myCorpus30_13 <- textclean(myCorpus30_13);            # text cleaning
writeLines(strwrap(myCorpus30_13[[20]]$content, 60))
# count word frequence
tdm30_13 <- TermDocumentMatrix(myCorpus30_13,control = list(wordLengths = c(1, Inf)));
freq.terms30_13 <- findFreqTerms(tdm30_13, lowfreq = 10);
term.freq30_13 <- rowSums(as.matrix(tdm30_13));
term.freq30_13 <- subset(term.freq30_13, term.freq30_13 >= 10);
df30_13 <- data.frame(term = names(term.freq30_13), freq = term.freq30_13)
ggplot(df30_13, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc30_13 <- as.matrix(tdm30_13);
word.freq30_13 <- sort(rowSums(wc30_13), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq30_13), freq = word.freq30_13, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm30_13, "shooting", 0.2) # which words are associated with 'shooting'?
plot(tdm30_13, term = freq.terms30_13, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths30_13 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus30_13)));
dtm30_13 <- DocumentTermMatrix(myCorpus30_13[doc.lengths30_13 > 0]);
# choosing 2, 5 and 10 topics
lda30_13_2 <- LDA(dtm30_13, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_13_5 <- LDA(dtm30_13, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_13_10 <- LDA(dtm30_13, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms30_13_2 <- as.matrix(terms(lda30_13_2,10)); # top 10 terms in topics
top10terms30_13_5 <- as.matrix(terms(lda30_13_5,10));
top10terms30_13_10 <- as.matrix(terms(lda30_13_10,10));
lda.topics30_13_5 = as.matrix(topics(lda30_13_5));
lda.topics30_13_2 = as.matrix(topics(lda30_13_2));
lda.topics30_13_10 = as.matrix(topics(lda30_13_10));
summary(as.factor(lda.topics30_13_5[,1]))
summary(as.factor(lda.topics30_13_2[,1]))
summary(as.factor(lda.topics30_13_10[,1]))

topicprob30_13_5 = as.matrix(lda30_13_5@gamma);
topicprob30_13_2 = as.matrix(lda30_13_2@gamma);
topicprob30_13_10 = as.matrix(lda30_13_10@gamma);

tweet30_13 <- textclean2(stem30_13$text);
writeLines(tweet30_13[[20]])

# Sentiment Analysis
# Tokenizing character file
token30_13 <- data.frame(text=tweet30_13, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti30_13 <- inner_join(token30_13, get_sentiments("bing")) %>% count(sentiment);
senti30_13_temp <- inner_join(token30_13, get_sentiments("bing"));
senti30_13 <- data.frame(table(senti30_13_temp$sentiment));
colnames(senti30_13) <- c("sentiment","n");
senti30_13$percent = (senti30_13$n/sum(senti30_13$n))*100;
#Plotting the sentiment summary 
ggplot(senti30_13, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments30_13 <- sentiment(stem30_13$text)
table(sentiments30_13$polarity)
# sentiment plot
sentiments30_13$score <- 0
sentiments30_13$score[sentiments30_13$polarity == "positive"] <- 1
sentiments30_13$score[sentiments30_13$polarity == "negative"] <- -1
sentiments30_13$time <- as.POSIXct(round(as.POSIXct(stem30_13$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result30_13 <- aggregate(score ~ time, data = sentiments30_13, sum)
ggplot(result30_13,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus30_21_22 <- Corpus(VectorSource(stem30_21_22$text)); 
myCorpus30_21_22 <- textclean(myCorpus30_21_22);            # text cleaning
writeLines(strwrap(myCorpus30_21_22[[20]]$content, 60))
# count word frequence
tdm30_21_22 <- TermDocumentMatrix(myCorpus30_21_22,control = list(wordLengths = c(1, Inf)));
freq.terms30_21_22 <- findFreqTerms(tdm30_21_22, lowfreq = 10);
term.freq30_21_22 <- rowSums(as.matrix(tdm30_21_22));
term.freq30_21_22 <- subset(term.freq30_21_22, term.freq30_21_22 >= 10);
df30_21_22 <- data.frame(ind=rep("30_21_22",length(term.freq30_21_22)), term = names(term.freq30_21_22), freq = term.freq30_21_22)
ggplot(df30_21_22, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc30_21_22 <- as.matrix(tdm30_21_22);
word.freq30_21_22 <- sort(rowSums(wc30_21_22), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq30_21_22), freq = word.freq30_21_22, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm30_21_22, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm30_21_22, term = freq.terms30_21_22, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths30_21_22 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus30_21_22)));
dtm30_21_22 <- DocumentTermMatrix(myCorpus30_21_22[doc.lengths30_21_22 > 0]);
# choosing 2, 5 and 10 topics
lda30_21_22_2 <- LDA(dtm30_21_22, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_21_22_5 <- LDA(dtm30_21_22, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_21_22_10 <- LDA(dtm30_21_22, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms30_21_22_2 <- as.matrix(terms(lda30_21_22_2,10)); # top 10 terms in topics
top10terms30_21_22_5 <- as.matrix(terms(lda30_21_22_5,10));
top10terms30_21_22_10 <- as.matrix(terms(lda30_21_22_10,10));
lda.topics30_21_22_5 = as.matrix(topics(lda30_21_22_5));
lda.topics30_21_22_2 = as.matrix(topics(lda30_21_22_2));
lda.topics30_21_22_10 = as.matrix(topics(lda30_21_22_10));
summary(as.factor(lda.topics30_21_22_5[,1]))
summary(as.factor(lda.topics30_21_22_2[,1]))
summary(as.factor(lda.topics30_21_22_10[,1]))

topicprob30_21_22_5 = as.matrix(lda30_21_22_5@gamma);
topicprob30_21_22_2 = as.matrix(lda30_21_22_2@gamma);
topicprob30_21_22_10 = as.matrix(lda30_21_22_10@gamma);

tweet30_21_22 <- textclean2(stem30_21_22$text);
writeLines(tweet30_21_22[[20]])

# Sentiment Analysis
# Tokenizing character file
token30_21_22 <- data.frame(text=tweet30_21_22, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti30_21_22 <- inner_join(token30_21_22, get_sentiments("loughran")) %>% count(sentiment);
senti30_21_22_temp <- inner_join(token30_21_22, get_sentiments("bing"));
senti30_21_22 <- data.frame(table(senti30_21_22_temp$sentiment));
colnames(senti30_21_22) <- c("sentiment","n");
senti30_21_22$percent = (senti30_21_22$n/sum(senti30_21_22$n))*100;
#Plotting the sentiment summary 
ggplot(senti30_21_22, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments30_21_22 <- sentiment(stem30_21_22$text)
table(sentiments30_21_22$polarity)
# sentiment plot
sentiments30_21_22$score <- 0
sentiments30_21_22$score[sentiments30_21_22$polarity == "positive"] <- 1
sentiments30_21_22$score[sentiments30_21_22$polarity == "negative"] <- -1
sentiments30_21_22$time <- as.POSIXct(round(as.POSIXct(stem30_21_22$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result30_21_22 <- aggregate(score ~ time, data = sentiments30_21_22, sum)
ggplot(result30_21_22,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus30_12_13 <- Corpus(VectorSource(stem30_12_13$text)); 
myCorpus30_12_13 <- textclean(myCorpus30_12_13);            # text cleaning
writeLines(strwrap(myCorpus30_12_13[[200]]$content, 60))
# count word frequence
tdm30_12_13 <- TermDocumentMatrix(myCorpus30_12_13,control = list(wordLengths = c(1, Inf)));
freq.terms30_12_13 <- findFreqTerms(tdm30_12_13, lowfreq = 10);
term.freq30_12_13 <- rowSums(as.matrix(tdm30_12_13));
term.freq30_12_13 <- subset(term.freq30_12_13, term.freq30_12_13 >= 10);
df30_12_13 <- data.frame(ind=rep("30_12_13",length(term.freq30_12_13)), term = names(term.freq30_12_13), freq = term.freq30_12_13)
ggplot(df30_12_13, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc30_12_13 <- as.matrix(tdm30_12_13);
word.freq30_12_13 <- sort(rowSums(wc30_12_13), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq30_12_13), freq = word.freq30_12_13, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm30_12_13, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm30_12_13, term = freq.terms30_12_13, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths30_12_13 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus30_12_13)));
dtm30_12_13 <- DocumentTermMatrix(myCorpus30_12_13[doc.lengths30_12_13 > 0]);
# choosing 2, 5 and 10 topics
lda30_12_13_2 <- LDA(dtm30_12_13, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_12_13_5 <- LDA(dtm30_12_13, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_12_13_10 <- LDA(dtm30_12_13, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms30_12_13_2 <- as.matrix(terms(lda30_12_13_2,10)); # top 10 terms in topics
top10terms30_12_13_5 <- as.matrix(terms(lda30_12_13_5,10));
top10terms30_12_13_10 <- as.matrix(terms(lda30_12_13_10,10));
lda.topics30_12_13_5 = as.matrix(topics(lda30_12_13_5));
lda.topics30_12_13_2 = as.matrix(topics(lda30_12_13_2));
lda.topics30_12_13_10 = as.matrix(topics(lda30_12_13_10));
summary(as.factor(lda.topics30_12_13_5[,1]))
summary(as.factor(lda.topics30_12_13_2[,1]))
summary(as.factor(lda.topics30_12_13_10[,1]))

topicprob30_12_13_5 = as.matrix(lda30_12_13_5@gamma);
topicprob30_12_13_2 = as.matrix(lda30_12_13_2@gamma);
topicprob30_12_13_10 = as.matrix(lda30_12_13_10@gamma);

tweet30_12_13 <- textclean2(stem30_12_13$text);
writeLines(tweet30_12_13[[20]])

# Sentiment Analysis
# Tokenizing character file
token30_12_13 <- data.frame(text=tweet30_12_13, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti30_12_13 <- inner_join(token30_12_13, get_sentiments("loughran")) %>% count(sentiment);
senti30_12_13_temp <- inner_join(token30_12_13, get_sentiments("bing"));
senti30_12_13 <- data.frame(table(senti30_12_13_temp$sentiment));
colnames(senti30_12_13) <- c("sentiment","n");
senti30_12_13$percent = (senti30_12_13$n/sum(senti30_12_13$n))*100;
#Plotting the sentiment summary 
ggplot(senti30_12_13, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments30_12_13 <- sentiment(stem30_12_13$text)
table(sentiments30_12_13$polarity)
# sentiment plot
sentiments30_12_13$score <- 0
sentiments30_12_13$score[sentiments30_12_13$polarity == "positive"] <- 1
sentiments30_12_13$score[sentiments30_12_13$polarity == "negative"] <- -1
sentiments30_12_13$time <- as.POSIXct(round(as.POSIXct(stem30_12_13$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result30_12_13 <- aggregate(score ~ time, data = sentiments30_12_13, sum)
ggplot(result30_12_13,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################


