# from stem0_similarity

virg270_14 <- read.csv(file="Shooting Virg/virg4/virg_270_14_2.csv",header=TRUE);
virg270_17 <- read.csv(file="Shooting Virg/virg4/virg_270_17_2.csv",header=TRUE);
virg4_13_14 <- read.csv(file="Shooting Virg/virg4/virg4_13_14.csv",header=TRUE);
virg4_16_17 <- read.csv(file="Shooting Virg/virg4/virg4_16_17.csv",header=TRUE);

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus4_16_17 <- Corpus(VectorSource(virg4_16_17$text)); 
myCorpus4_16_17 <- textclean(myCorpus4_16_17);            # text cleaning
writeLines(strwrap(myCorpus4_16_17[[20]]$content, 60))
# count word frequence
tdm4_16_17 <- TermDocumentMatrix(myCorpus4_16_17,control = list(wordLengths = c(1, Inf)));
freq.terms4_16_17 <- findFreqTerms(tdm4_16_17, lowfreq = 10);
term.freq4_16_17 <- rowSums(as.matrix(tdm4_16_17));
term.freq4_16_17 <- subset(term.freq4_16_17, term.freq4_16_17 >= 10);
df4_16_17 <- data.frame(ind=rep("4_16_17",length(term.freq4_16_17)), term = names(term.freq4_16_17), freq = term.freq4_16_17)
ggplot(df4_16_17, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc4_16_17 <- as.matrix(tdm4_16_17);
word.freq4_16_17 <- sort(rowSums(wc4_16_17), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq4_16_17), freq = word.freq4_16_17, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm4_16_17, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm4_16_17, term = freq.terms4_16_17, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths4_16_17 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus4_16_17)));
dtm4_16_17 <- DocumentTermMatrix(myCorpus4_16_17[doc.lengths4_16_17 > 0]);
# choosing 2, 5 and 10 topics
lda4_16_17_2 <- LDA(dtm4_16_17, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_16_17_5 <- LDA(dtm4_16_17, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_16_17_10 <- LDA(dtm4_16_17, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms4_16_17_2 <- as.matrix(terms(lda4_16_17_2,10)); # top 10 terms in topics
top10terms4_16_17_5 <- as.matrix(terms(lda4_16_17_5,10));
top10terms4_16_17_10 <- as.matrix(terms(lda4_16_17_10,10));
lda.topics4_16_17_5 = as.matrix(topics(lda4_16_17_5));
lda.topics4_16_17_2 = as.matrix(topics(lda4_16_17_2));
lda.topics4_16_17_10 = as.matrix(topics(lda4_16_17_10));
summary(as.factor(lda.topics4_16_17_5[,1]))
summary(as.factor(lda.topics4_16_17_2[,1]))
summary(as.factor(lda.topics4_16_17_10[,1]))

topicprob4_16_17_5 = as.matrix(lda4_16_17_5@gamma);
topicprob4_16_17_2 = as.matrix(lda4_16_17_2@gamma);
topicprob4_16_17_10 = as.matrix(lda4_16_17_10@gamma);

tweet4_16_17 <- textclean2(virg4_16_17$text);
writeLines(tweet4_16_17[[20]])

# Sentiment Analysis
# Tokenizing character file
token4_16_17 <- data.frame(text=tweet4_16_17, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti4_16_17 <- inner_join(token4_16_17, get_sentiments("loughran")) %>% count(sentiment);
senti4_16_17_temp <- inner_join(token4_16_17, get_sentiments("bing"));
senti4_16_17 <- data.frame(table(senti4_16_17_temp$sentiment));
colnames(senti4_16_17) <- c("sentiment","n");
senti4_16_17$percent = (senti4_16_17$n/sum(senti4_16_17$n))*100;
#Plotting the sentiment summary 
ggplot(senti4_16_17, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments4_16_17 <- sentiment(virg4_16_17$text)
table(sentiments4_16_17$polarity)
# sentiment plot
sentiments4_16_17$score <- 0
sentiments4_16_17$score[sentiments4_16_17$polarity == "positive"] <- 1
sentiments4_16_17$score[sentiments4_16_17$polarity == "negative"] <- -1
sentiments4_16_17$time <- as.POSIXct(round(as.POSIXct(virg4_16_17$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result4_16_17 <- aggregate(score ~ time, data = sentiments4_16_17, sum)
ggplot(result4_16_17,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus4_13_14 <- Corpus(VectorSource(virg4_13_14$text)); 
myCorpus4_13_14 <- textclean(myCorpus4_13_14);            # text cleaning
writeLines(strwrap(myCorpus4_13_14[[200]]$content, 60))
# count word frequence
tdm4_13_14 <- TermDocumentMatrix(myCorpus4_13_14,control = list(wordLengths = c(1, Inf)));
freq.terms4_13_14 <- findFreqTerms(tdm4_13_14, lowfreq = 10);
term.freq4_13_14 <- rowSums(as.matrix(tdm4_13_14));
term.freq4_13_14 <- subset(term.freq4_13_14, term.freq4_13_14 >= 10);
df4_13_14 <- data.frame(ind=rep("4_13_14",length(term.freq4_13_14)), term = names(term.freq4_13_14), freq = term.freq4_13_14)
ggplot(df4_13_14, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc4_13_14 <- as.matrix(tdm4_13_14);
word.freq4_13_14 <- sort(rowSums(wc4_13_14), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq4_13_14), freq = word.freq4_13_14, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm4_13_14, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm4_13_14, term = freq.terms4_13_14, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths4_13_14 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus4_13_14)));
dtm4_13_14 <- DocumentTermMatrix(myCorpus4_13_14[doc.lengths4_13_14 > 0]);
# choosing 2, 5 and 10 topics
lda4_13_14_2 <- LDA(dtm4_13_14, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_13_14_5 <- LDA(dtm4_13_14, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_13_14_10 <- LDA(dtm4_13_14, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms4_13_14_2 <- as.matrix(terms(lda4_13_14_2,10)); # top 10 terms in topics
top10terms4_13_14_5 <- as.matrix(terms(lda4_13_14_5,10));
top10terms4_13_14_10 <- as.matrix(terms(lda4_13_14_10,10));
lda.topics4_13_14_5 = as.matrix(topics(lda4_13_14_5));
lda.topics4_13_14_2 = as.matrix(topics(lda4_13_14_2));
lda.topics4_13_14_10 = as.matrix(topics(lda4_13_14_10));
summary(as.factor(lda.topics4_13_14_5[,1]))
summary(as.factor(lda.topics4_13_14_2[,1]))
summary(as.factor(lda.topics4_13_14_10[,1]))

topicprob4_13_14_5 = as.matrix(lda4_13_14_5@gamma);
topicprob4_13_14_2 = as.matrix(lda4_13_14_2@gamma);
topicprob4_13_14_10 = as.matrix(lda4_13_14_10@gamma);

tweet4_13_14 <- textclean2(virg4_13_14$text);
writeLines(tweet4_13_14[[20]])

# Sentiment Analysis
# Tokenizing character file
token4_13_14 <- data.frame(text=tweet4_13_14, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti4_13_14 <- inner_join(token4_13_14, get_sentiments("loughran")) %>% count(sentiment);
senti4_13_14_temp <- inner_join(token4_13_14, get_sentiments("bing"));
senti4_13_14 <- data.frame(table(senti4_13_14_temp$sentiment));
colnames(senti4_13_14) <- c("sentiment","n");
senti4_13_14$percent = (senti4_13_14$n/sum(senti4_13_14$n))*100;
#Plotting the sentiment summary 
ggplot(senti4_13_14, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments4_13_14 <- sentiment(virg4_13_14$text)
table(sentiments4_13_14$polarity)
# sentiment plot
sentiments4_13_14$score <- 0
sentiments4_13_14$score[sentiments4_13_14$polarity == "positive"] <- 1
sentiments4_13_14$score[sentiments4_13_14$polarity == "negative"] <- -1
sentiments4_13_14$time <- as.POSIXct(round(as.POSIXct(virg4_13_14$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result4_13_14 <- aggregate(score ~ time, data = sentiments4_13_14, sum)
ggplot(result4_13_14,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
