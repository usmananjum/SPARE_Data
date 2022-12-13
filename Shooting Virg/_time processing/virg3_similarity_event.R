# from stem0_similarity

virg3_17_18 <- read.csv(file="Shooting Virg/virg3/virg3_17_18.csv",header=TRUE);
virg3_19_20 <- read.csv(file="Shooting Virg/virg3/virg3_19_20.csv",header=TRUE);
virg3_22_23 <- read.csv(file="Shooting Virg/virg3/virg3_22_23.csv",header=TRUE);

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus3_19_20 <- Corpus(VectorSource(virg3_19_20$text)); 
myCorpus3_19_20 <- textclean(myCorpus3_19_20);            # text cleaning
writeLines(strwrap(myCorpus3_19_20[[20]]$content, 60))
# count word frequence
tdm3_19_20 <- TermDocumentMatrix(myCorpus3_19_20,control = list(wordLengths = c(1, Inf)));
freq.terms3_19_20 <- findFreqTerms(tdm3_19_20, lowfreq = 5);
term.freq3_19_20 <- rowSums(as.matrix(tdm3_19_20));
term.freq3_19_20 <- subset(term.freq3_19_20, term.freq3_19_20 >= 5);
df3_19_20 <- data.frame(ind=rep("3_19_20",length(term.freq3_19_20)), term = names(term.freq3_19_20), freq = term.freq3_19_20)
ggplot(df3_19_20, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc3_19_20 <- as.matrix(tdm3_19_20);
word.freq3_19_20 <- sort(rowSums(wc3_19_20), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq3_19_20), freq = word.freq3_19_20, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm3_19_20, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm3_19_20, term = freq.terms3_19_20, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths3_19_20 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus3_19_20)));
dtm3_19_20 <- DocumentTermMatrix(myCorpus3_19_20[doc.lengths3_19_20 > 0]);
# choosing 2, 5 and 10 topics
lda3_19_20_2 <- LDA(dtm3_19_20, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_19_20_5 <- LDA(dtm3_19_20, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_19_20_10 <- LDA(dtm3_19_20, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms3_19_20_2 <- as.matrix(terms(lda3_19_20_2,10)); # top 10 terms in topics
top10terms3_19_20_5 <- as.matrix(terms(lda3_19_20_5,10));
top10terms3_19_20_10 <- as.matrix(terms(lda3_19_20_10,10));
lda.topics3_19_20_5 = as.matrix(topics(lda3_19_20_5));
lda.topics3_19_20_2 = as.matrix(topics(lda3_19_20_2));
lda.topics3_19_20_10 = as.matrix(topics(lda3_19_20_10));
summary(as.factor(lda.topics3_19_20_5[,1]))
summary(as.factor(lda.topics3_19_20_2[,1]))
summary(as.factor(lda.topics3_19_20_10[,1]))

topicprob3_19_20_5 = as.matrix(lda3_19_20_5@gamma);
topicprob3_19_20_2 = as.matrix(lda3_19_20_2@gamma);
topicprob3_19_20_10 = as.matrix(lda3_19_20_10@gamma);

tweet3_19_20 <- textclean2(virg3_19_20$text);
writeLines(tweet3_19_20[[20]])

# Sentiment Analysis
# Tokenizing character file
token3_19_20 <- data.frame(text=tweet3_19_20, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti3_19_20 <- inner_join(token3_19_20, get_sentiments("loughran")) %>% count(sentiment);
senti3_19_20_temp <- inner_join(token3_19_20, get_sentiments("bing"));
senti3_19_20 <- data.frame(table(senti3_19_20_temp$sentiment));
colnames(senti3_19_20) <- c("sentiment","n");
senti3_19_20$percent = (senti3_19_20$n/sum(senti3_19_20$n))*100;
#Plotting the sentiment summary 
ggplot(senti3_19_20, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments3_19_20 <- sentiment(virg3_19_20$text)
table(sentiments3_19_20$polarity)
# sentiment plot
sentiments3_19_20$score <- 0
sentiments3_19_20$score[sentiments3_19_20$polarity == "positive"] <- 1
sentiments3_19_20$score[sentiments3_19_20$polarity == "negative"] <- -1
sentiments3_19_20$time <- as.POSIXct(round(as.POSIXct(virg3_19_20$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result3_19_20 <- aggregate(score ~ time, data = sentiments3_19_20, sum)
ggplot(result3_19_20,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus3_17_18 <- Corpus(VectorSource(virg3_17_18$text)); 
myCorpus3_17_18 <- textclean(myCorpus3_17_18);            # text cleaning
writeLines(strwrap(myCorpus3_17_18[[200]]$content, 60))
# count word frequence
tdm3_17_18 <- TermDocumentMatrix(myCorpus3_17_18,control = list(wordLengths = c(1, Inf)));
freq.terms3_17_18 <- findFreqTerms(tdm3_17_18, lowfreq = 5);
term.freq3_17_18 <- rowSums(as.matrix(tdm3_17_18));
term.freq3_17_18 <- subset(term.freq3_17_18, term.freq3_17_18 >= 5);
df3_17_18 <- data.frame(ind=rep("3_17_18",length(term.freq3_17_18)), term = names(term.freq3_17_18), freq = term.freq3_17_18)
ggplot(df3_17_18, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc3_17_18 <- as.matrix(tdm3_17_18);
word.freq3_17_18 <- sort(rowSums(wc3_17_18), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq3_17_18), freq = word.freq3_17_18, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm3_17_18, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm3_17_18, term = freq.terms3_17_18, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths3_17_18 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus3_17_18)));
dtm3_17_18 <- DocumentTermMatrix(myCorpus3_17_18[doc.lengths3_17_18 > 0]);
# choosing 2, 5 and 10 topics
lda3_17_18_2 <- LDA(dtm3_17_18, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_17_18_5 <- LDA(dtm3_17_18, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_17_18_10 <- LDA(dtm3_17_18, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms3_17_18_2 <- as.matrix(terms(lda3_17_18_2,10)); # top 10 terms in topics
top10terms3_17_18_5 <- as.matrix(terms(lda3_17_18_5,10));
top10terms3_17_18_10 <- as.matrix(terms(lda3_17_18_10,10));
lda.topics3_17_18_5 = as.matrix(topics(lda3_17_18_5));
lda.topics3_17_18_2 = as.matrix(topics(lda3_17_18_2));
lda.topics3_17_18_10 = as.matrix(topics(lda3_17_18_10));
summary(as.factor(lda.topics3_17_18_5[,1]))
summary(as.factor(lda.topics3_17_18_2[,1]))
summary(as.factor(lda.topics3_17_18_10[,1]))

topicprob3_17_18_5 = as.matrix(lda3_17_18_5@gamma);
topicprob3_17_18_2 = as.matrix(lda3_17_18_2@gamma);
topicprob3_17_18_10 = as.matrix(lda3_17_18_10@gamma);

tweet3_17_18 <- textclean2(virg3_17_18$text);
writeLines(tweet3_17_18[[20]])

# Sentiment Analysis
# Tokenizing character file
token3_17_18 <- data.frame(text=tweet3_17_18, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti3_17_18 <- inner_join(token3_17_18, get_sentiments("loughran")) %>% count(sentiment);
senti3_17_18_temp <- inner_join(token3_17_18, get_sentiments("bing"));
senti3_17_18 <- data.frame(table(senti3_17_18_temp$sentiment));
colnames(senti3_17_18) <- c("sentiment","n");
senti3_17_18$percent = (senti3_17_18$n/sum(senti3_17_18$n))*100;
#Plotting the sentiment summary 
ggplot(senti3_17_18, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments3_17_18 <- sentiment(virg3_17_18$text)
table(sentiments3_17_18$polarity)
# sentiment plot
sentiments3_17_18$score <- 0
sentiments3_17_18$score[sentiments3_17_18$polarity == "positive"] <- 1
sentiments3_17_18$score[sentiments3_17_18$polarity == "negative"] <- -1
sentiments3_17_18$time <- as.POSIXct(round(as.POSIXct(virg3_17_18$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result3_17_18 <- aggregate(score ~ time, data = sentiments3_17_18, sum)
ggplot(result3_17_18,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

############################ N0-EVENT 2 (disggregated) ############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus3_22_23 <- Corpus(VectorSource(virg3_22_23$text)); 
myCorpus3_22_23 <- textclean(myCorpus3_22_23);            # text cleaning
writeLines(strwrap(myCorpus3_22_23[[200]]$content, 60))
# count word frequence
tdm3_22_23 <- TermDocumentMatrix(myCorpus3_22_23,control = list(wordLengths = c(1, Inf)));
freq.terms3_22_23 <- findFreqTerms(tdm3_22_23, lowfreq = 5);
term.freq3_22_23 <- rowSums(as.matrix(tdm3_22_23));
term.freq3_22_23 <- subset(term.freq3_22_23, term.freq3_22_23 >= 5);
df3_22_23 <- data.frame(ind=rep("3_22_23",length(term.freq3_22_23)), term = names(term.freq3_22_23), freq = term.freq3_22_23)
ggplot(df3_22_23, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc3_22_23 <- as.matrix(tdm3_22_23);
word.freq3_22_23 <- sort(rowSums(wc3_22_23), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq3_22_23), freq = word.freq3_22_23, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm3_22_23, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm3_22_23, term = freq.terms3_22_23, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths3_22_23 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus3_22_23)));
dtm3_22_23 <- DocumentTermMatrix(myCorpus3_22_23[doc.lengths3_22_23 > 0]);
# choosing 2, 5 and 10 topics
lda3_22_23_2 <- LDA(dtm3_22_23, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_22_23_5 <- LDA(dtm3_22_23, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_22_23_10 <- LDA(dtm3_22_23, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms3_22_23_2 <- as.matrix(terms(lda3_22_23_2,10)); # top 10 terms in topics
top10terms3_22_23_5 <- as.matrix(terms(lda3_22_23_5,10));
top10terms3_22_23_10 <- as.matrix(terms(lda3_22_23_10,10));
lda.topics3_22_23_5 = as.matrix(topics(lda3_22_23_5));
lda.topics3_22_23_2 = as.matrix(topics(lda3_22_23_2));
lda.topics3_22_23_10 = as.matrix(topics(lda3_22_23_10));
summary(as.factor(lda.topics3_22_23_5[,1]))
summary(as.factor(lda.topics3_22_23_2[,1]))
summary(as.factor(lda.topics3_22_23_10[,1]))

topicprob3_22_23_5 = as.matrix(lda3_22_23_5@gamma);
topicprob3_22_23_2 = as.matrix(lda3_22_23_2@gamma);
topicprob3_22_23_10 = as.matrix(lda3_22_23_10@gamma);

tweet3_22_23 <- textclean2(virg3_22_23$text);
writeLines(tweet3_22_23[[20]])

# Sentiment Analysis
# Tokenizing character file
token3_22_23 <- data.frame(text=tweet3_22_23, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti3_22_23 <- inner_join(token3_22_23, get_sentiments("loughran")) %>% count(sentiment);
senti3_22_23_temp <- inner_join(token3_22_23, get_sentiments("bing"));
senti3_22_23 <- data.frame(table(senti3_22_23_temp$sentiment));
colnames(senti3_22_23) <- c("sentiment","n");
senti3_22_23$percent = (senti3_22_23$n/sum(senti3_22_23$n))*100;
#Plotting the sentiment summary 
ggplot(senti3_22_23, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments3_22_23 <- sentiment(virg3_22_23$text)
table(sentiments3_22_23$polarity)
# sentiment plot
sentiments3_22_23$score <- 0
sentiments3_22_23$score[sentiments3_22_23$polarity == "positive"] <- 1
sentiments3_22_23$score[sentiments3_22_23$polarity == "negative"] <- -1
sentiments3_22_23$time <- as.POSIXct(round(as.POSIXct(virg3_22_23$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result3_22_23 <- aggregate(score ~ time, data = sentiments3_22_23, sum)
ggplot(result3_22_23,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################

