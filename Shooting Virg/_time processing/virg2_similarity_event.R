# from stem0_similarity

virg30_14 <- read.csv(file="Shooting Virg/virg2/virg_30_15_2.csv",header=TRUE);
virg30_17 <- read.csv(file="Shooting Virg/virg2/virg_30_18_2.csv",header=TRUE);
virg2_15_16 <- read.csv(file="Shooting Virg/virg2/virg2_15_16.csv",header=TRUE);
virg2_17_18 <- read.csv(file="Shooting Virg/virg2/virg2_17_18.csv",header=TRUE);

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus2_17_18 <- Corpus(VectorSource(virg2_17_18$text)); 
myCorpus2_17_18 <- textclean(myCorpus2_17_18);            # text cleaning
writeLines(strwrap(myCorpus2_17_18[[20]]$content, 60))
# count word frequence
tdm2_17_18 <- TermDocumentMatrix(myCorpus2_17_18,control = list(wordLengths = c(1, Inf)));
freq.terms2_17_18 <- findFreqTerms(tdm2_17_18, lowfreq = 5);
term.freq2_17_18 <- rowSums(as.matrix(tdm2_17_18));
term.freq2_17_18 <- subset(term.freq2_17_18, term.freq2_17_18 >= 5);
df2_17_18 <- data.frame(ind=rep("2_17_18",length(term.freq2_17_18)), term = names(term.freq2_17_18), freq = term.freq2_17_18)
ggplot(df2_17_18, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc2_17_18 <- as.matrix(tdm2_17_18);
word.freq2_17_18 <- sort(rowSums(wc2_17_18), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq2_17_18), freq = word.freq2_17_18, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm2_17_18, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm2_17_18, term = freq.terms2_17_18, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths2_17_18 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus2_17_18)));
dtm2_17_18 <- DocumentTermMatrix(myCorpus2_17_18[doc.lengths2_17_18 > 0]);
# choosing 2, 5 and 10 topics
lda2_17_18_2 <- LDA(dtm2_17_18, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_17_18_5 <- LDA(dtm2_17_18, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_17_18_10 <- LDA(dtm2_17_18, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms2_17_18_2 <- as.matrix(terms(lda2_17_18_2,10)); # top 10 terms in topics
top10terms2_17_18_5 <- as.matrix(terms(lda2_17_18_5,10));
top10terms2_17_18_10 <- as.matrix(terms(lda2_17_18_10,10));
lda.topics2_17_18_5 = as.matrix(topics(lda2_17_18_5));
lda.topics2_17_18_2 = as.matrix(topics(lda2_17_18_2));
lda.topics2_17_18_10 = as.matrix(topics(lda2_17_18_10));
summary(as.factor(lda.topics2_17_18_5[,1]))
summary(as.factor(lda.topics2_17_18_2[,1]))
summary(as.factor(lda.topics2_17_18_10[,1]))

topicprob2_17_18_5 = as.matrix(lda2_17_18_5@gamma);
topicprob2_17_18_2 = as.matrix(lda2_17_18_2@gamma);
topicprob2_17_18_10 = as.matrix(lda2_17_18_10@gamma);

tweet2_17_18 <- textclean2(virg2_17_18$text);
writeLines(tweet2_17_18[[20]])

# Sentiment Analysis
# Tokenizing character file
token2_17_18 <- data.frame(text=tweet2_17_18, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti2_17_18 <- inner_join(token2_17_18, get_sentiments("loughran")) %>% count(sentiment);
senti2_17_18_temp <- inner_join(token2_17_18, get_sentiments("bing"));
senti2_17_18 <- data.frame(table(senti2_17_18_temp$sentiment));
colnames(senti2_17_18) <- c("sentiment","n");
senti2_17_18$percent = (senti2_17_18$n/sum(senti2_17_18$n))*100;
#Plotting the sentiment summary 
ggplot(senti2_17_18, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments2_17_18 <- sentiment(virg2_17_18$text)
table(sentiments2_17_18$polarity)
# sentiment plot
sentiments2_17_18$score <- 0
sentiments2_17_18$score[sentiments2_17_18$polarity == "positive"] <- 1
sentiments2_17_18$score[sentiments2_17_18$polarity == "negative"] <- -1
sentiments2_17_18$time <- as.POSIXct(round(as.POSIXct(virg2_17_18$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result2_17_18 <- aggregate(score ~ time, data = sentiments2_17_18, sum)
ggplot(result2_17_18,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus2_15_16 <- Corpus(VectorSource(virg2_15_16$text)); 
myCorpus2_15_16 <- textclean(myCorpus2_15_16);            # text cleaning
writeLines(strwrap(myCorpus2_15_16[[200]]$content, 60))
# count word frequence
tdm2_15_16 <- TermDocumentMatrix(myCorpus2_15_16,control = list(wordLengths = c(1, Inf)));
freq.terms2_15_16 <- findFreqTerms(tdm2_15_16, lowfreq = 5);
term.freq2_15_16 <- rowSums(as.matrix(tdm2_15_16));
term.freq2_15_16 <- subset(term.freq2_15_16, term.freq2_15_16 >= 5);
df2_15_16 <- data.frame(ind=rep("2_15_16",length(term.freq2_15_16)), term = names(term.freq2_15_16), freq = term.freq2_15_16)
ggplot(df2_15_16, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc2_15_16 <- as.matrix(tdm2_15_16);
word.freq2_15_16 <- sort(rowSums(wc2_15_16), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq2_15_16), freq = word.freq2_15_16, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm2_15_16, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm2_15_16, term = freq.terms2_15_16, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths2_15_16 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus2_15_16)));
dtm2_15_16 <- DocumentTermMatrix(myCorpus2_15_16[doc.lengths2_15_16 > 0]);
# choosing 2, 5 and 10 topics
lda2_15_16_2 <- LDA(dtm2_15_16, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_15_16_5 <- LDA(dtm2_15_16, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_15_16_10 <- LDA(dtm2_15_16, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms2_15_16_2 <- as.matrix(terms(lda2_15_16_2,10)); # top 10 terms in topics
top10terms2_15_16_5 <- as.matrix(terms(lda2_15_16_5,10));
top10terms2_15_16_10 <- as.matrix(terms(lda2_15_16_10,10));
lda.topics2_15_16_5 = as.matrix(topics(lda2_15_16_5));
lda.topics2_15_16_2 = as.matrix(topics(lda2_15_16_2));
lda.topics2_15_16_10 = as.matrix(topics(lda2_15_16_10));
summary(as.factor(lda.topics2_15_16_5[,1]))
summary(as.factor(lda.topics2_15_16_2[,1]))
summary(as.factor(lda.topics2_15_16_10[,1]))

topicprob2_15_16_5 = as.matrix(lda2_15_16_5@gamma);
topicprob2_15_16_2 = as.matrix(lda2_15_16_2@gamma);
topicprob2_15_16_10 = as.matrix(lda2_15_16_10@gamma);

tweet2_15_16 <- textclean2(virg2_15_16$text);
writeLines(tweet2_15_16[[20]])

# Sentiment Analysis
# Tokenizing character file
token2_15_16 <- data.frame(text=tweet2_15_16, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti2_15_16 <- inner_join(token2_15_16, get_sentiments("loughran")) %>% count(sentiment);
senti2_15_16_temp <- inner_join(token2_15_16, get_sentiments("bing"));
senti2_15_16 <- data.frame(table(senti2_15_16_temp$sentiment));
colnames(senti2_15_16) <- c("sentiment","n");
senti2_15_16$percent = (senti2_15_16$n/sum(senti2_15_16$n))*100;
#Plotting the sentiment summary 
ggplot(senti2_15_16, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments2_15_16 <- sentiment(virg2_15_16$text)
table(sentiments2_15_16$polarity)
# sentiment plot
sentiments2_15_16$score <- 0
sentiments2_15_16$score[sentiments2_15_16$polarity == "positive"] <- 1
sentiments2_15_16$score[sentiments2_15_16$polarity == "negative"] <- -1
sentiments2_15_16$time <- as.POSIXct(round(as.POSIXct(virg2_15_16$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result2_15_16 <- aggregate(score ~ time, data = sentiments2_15_16, sum)
ggplot(result2_15_16,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
