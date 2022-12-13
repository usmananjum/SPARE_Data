# from stem0_similarity

stem90_17 <- read.csv(file="Shooting STEM/stem90/stem_90_17_2.csv",header=TRUE);
stem90_24 <- read.csv(file="Shooting STEM/stem90/stem_90_24_2.csv",header=TRUE);
stem90_16_17 <- read.csv(file="Shooting STEM/stem90/stem90_16_17.csv",header=TRUE);
stem90_23_24 <- read.csv(file="Shooting STEM/stem90/stem90_23_24.csv",header=TRUE);

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus90_23_24 <- Corpus(VectorSource(stem90_23_24$text)); 
myCorpus90_23_24 <- textclean(myCorpus90_23_24);            # text cleaning
writeLines(strwrap(myCorpus90_23_24[[20]]$content, 60))
# count word frequence
tdm90_23_24 <- TermDocumentMatrix(myCorpus90_23_24,control = list(wordLengths = c(1, Inf)));
freq.terms90_23_24 <- findFreqTerms(tdm90_23_24, lowfreq = 10);
term.freq90_23_24 <- rowSums(as.matrix(tdm90_23_24));
term.freq90_23_24 <- subset(term.freq90_23_24, term.freq90_23_24 >= 10);
df90_23_24 <- data.frame(ind=rep("90_23_24",length(term.freq90_23_24)), term = names(term.freq90_23_24), freq = term.freq90_23_24)
ggplot(df90_23_24, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc90_23_24 <- as.matrix(tdm90_23_24);
word.freq90_23_24 <- sort(rowSums(wc90_23_24), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq90_23_24), freq = word.freq90_23_24, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm90_23_24, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm90_23_24, term = freq.terms90_23_24, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths90_23_24 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus90_23_24)));
dtm90_23_24 <- DocumentTermMatrix(myCorpus90_23_24[doc.lengths90_23_24 > 0]);
# choosing 2, 5 and 10 topics
lda90_23_24_2 <- LDA(dtm90_23_24, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_23_24_5 <- LDA(dtm90_23_24, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_23_24_10 <- LDA(dtm90_23_24, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms90_23_24_2 <- as.matrix(terms(lda90_23_24_2,10)); # top 10 terms in topics
top10terms90_23_24_5 <- as.matrix(terms(lda90_23_24_5,10));
top10terms90_23_24_10 <- as.matrix(terms(lda90_23_24_10,10));
lda.topics90_23_24_5 = as.matrix(topics(lda90_23_24_5));
lda.topics90_23_24_2 = as.matrix(topics(lda90_23_24_2));
lda.topics90_23_24_10 = as.matrix(topics(lda90_23_24_10));
summary(as.factor(lda.topics90_23_24_5[,1]))
summary(as.factor(lda.topics90_23_24_2[,1]))
summary(as.factor(lda.topics90_23_24_10[,1]))

topicprob90_23_24_5 = as.matrix(lda90_23_24_5@gamma);
topicprob90_23_24_2 = as.matrix(lda90_23_24_2@gamma);
topicprob90_23_24_10 = as.matrix(lda90_23_24_10@gamma);

tweet90_23_24 <- textclean2(stem90_23_24$text);
writeLines(tweet90_23_24[[20]])

# Sentiment Analysis
# Tokenizing character file
token90_23_24 <- data.frame(text=tweet90_23_24, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti90_23_24 <- inner_join(token90_23_24, get_sentiments("loughran")) %>% count(sentiment);
senti90_23_24_temp <- inner_join(token90_23_24, get_sentiments("bing"));
senti90_23_24 <- data.frame(table(senti90_23_24_temp$sentiment));
colnames(senti90_23_24) <- c("sentiment","n");
senti90_23_24$percent = (senti90_23_24$n/sum(senti90_23_24$n))*100;
#Plotting the sentiment summary 
ggplot(senti90_23_24, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments90_23_24 <- sentiment(stem90_23_24$text)
table(sentiments90_23_24$polarity)
# sentiment plot
sentiments90_23_24$score <- 0
sentiments90_23_24$score[sentiments90_23_24$polarity == "positive"] <- 1
sentiments90_23_24$score[sentiments90_23_24$polarity == "negative"] <- -1
sentiments90_23_24$time <- as.POSIXct(round(as.POSIXct(stem90_23_24$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result90_23_24 <- aggregate(score ~ time, data = sentiments90_23_24, sum)
ggplot(result90_23_24,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus90_16_17 <- Corpus(VectorSource(stem90_16_17$text)); 
myCorpus90_16_17 <- textclean(myCorpus90_16_17);            # text cleaning
writeLines(strwrap(myCorpus90_16_17[[200]]$content, 60))
# count word frequence
tdm90_16_17 <- TermDocumentMatrix(myCorpus90_16_17,control = list(wordLengths = c(1, Inf)));
freq.terms90_16_17 <- findFreqTerms(tdm90_16_17, lowfreq = 10);
term.freq90_16_17 <- rowSums(as.matrix(tdm90_16_17));
term.freq90_16_17 <- subset(term.freq90_16_17, term.freq90_16_17 >= 10);
df90_16_17 <- data.frame(ind=rep("90_16_17",length(term.freq90_16_17)), term = names(term.freq90_16_17), freq = term.freq90_16_17)
ggplot(df90_16_17, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc90_16_17 <- as.matrix(tdm90_16_17);
word.freq90_16_17 <- sort(rowSums(wc90_16_17), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq90_16_17), freq = word.freq90_16_17, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm90_16_17, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm90_16_17, term = freq.terms90_16_17, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths90_16_17 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus90_16_17)));
dtm90_16_17 <- DocumentTermMatrix(myCorpus90_16_17[doc.lengths90_16_17 > 0]);
# choosing 2, 5 and 10 topics
lda90_16_17_2 <- LDA(dtm90_16_17, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_16_17_5 <- LDA(dtm90_16_17, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_16_17_10 <- LDA(dtm90_16_17, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms90_16_17_2 <- as.matrix(terms(lda90_16_17_2,10)); # top 10 terms in topics
top10terms90_16_17_5 <- as.matrix(terms(lda90_16_17_5,10));
top10terms90_16_17_10 <- as.matrix(terms(lda90_16_17_10,10));
lda.topics90_16_17_5 = as.matrix(topics(lda90_16_17_5));
lda.topics90_16_17_2 = as.matrix(topics(lda90_16_17_2));
lda.topics90_16_17_10 = as.matrix(topics(lda90_16_17_10));
summary(as.factor(lda.topics90_16_17_5[,1]))
summary(as.factor(lda.topics90_16_17_2[,1]))
summary(as.factor(lda.topics90_16_17_10[,1]))

topicprob90_16_17_5 = as.matrix(lda90_16_17_5@gamma);
topicprob90_16_17_2 = as.matrix(lda90_16_17_2@gamma);
topicprob90_16_17_10 = as.matrix(lda90_16_17_10@gamma);

tweet90_16_17 <- textclean2(stem90_16_17$text);
writeLines(tweet90_16_17[[20]])

# Sentiment Analysis
# Tokenizing character file
token90_16_17 <- data.frame(text=tweet90_16_17, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti90_16_17 <- inner_join(token90_16_17, get_sentiments("loughran")) %>% count(sentiment);
senti90_16_17_temp <- inner_join(token90_16_17, get_sentiments("bing"));
senti90_16_17 <- data.frame(table(senti90_16_17_temp$sentiment));
colnames(senti90_16_17) <- c("sentiment","n");
senti90_16_17$percent = (senti90_16_17$n/sum(senti90_16_17$n))*100;
#Plotting the sentiment summary 
ggplot(senti90_16_17, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments90_16_17 <- sentiment(stem90_16_17$text)
table(sentiments90_16_17$polarity)
# sentiment plot
sentiments90_16_17$score <- 0
sentiments90_16_17$score[sentiments90_16_17$polarity == "positive"] <- 1
sentiments90_16_17$score[sentiments90_16_17$polarity == "negative"] <- -1
sentiments90_16_17$time <- as.POSIXct(round(as.POSIXct(stem90_16_17$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result90_16_17 <- aggregate(score ~ time, data = sentiments90_16_17, sum)
ggplot(result90_16_17,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
