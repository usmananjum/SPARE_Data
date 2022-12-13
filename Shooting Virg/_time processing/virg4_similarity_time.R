# from virg0_similarity

event_time_virg <- strptime("2019-05-31 16:44:00","%Y-%m-%d %H:%M:%S");

virg4_28_temp <- read.csv(file="Shooting Virg/virg4/virg_270_28_2.csv",header=TRUE);

virg4_28ne <- subset(virg4_28_temp, as.POSIXct(virg4_28_temp$created) < as.POSIXct(event_time_virg));
virg4_28e <- subset(virg4_28_temp, as.POSIXct(virg4_28_temp$created) > as.POSIXct(event_time_virg));


############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus4_28e <- Corpus(VectorSource(virg4_28e$text)); 
myCorpus4_28e <- textclean(myCorpus4_28e);            # text cleaning
writeLines(strwrap(myCorpus4_28e[[20]]$content, 60))
# count word frequence
tdm4_28e <- TermDocumentMatrix(myCorpus4_28e,control = list(wordLengths = c(1, Inf)));
freq.terms4_28e <- findFreqTerms(tdm4_28e, lowfreq = 5);
term.freq4_28e <- rowSums(as.matrix(tdm4_28e));
term.freq4_28e <- subset(term.freq4_28e, term.freq4_28e >= 5);
df4_28e <- data.frame(ind=rep("4_28e",length(term.freq4_28e)), term = names(term.freq4_28e), freq = term.freq4_28e)
ggplot(df4_28e, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc4_28e <- as.matrix(tdm4_28e);
word.freq4_28e <- sort(rowSums(wc4_28e), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq4_28e), freq = word.freq4_28e, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm4_28e, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm4_28e, term = freq.terms4_28e, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths4_28e <- rowSums(as.matrix(DocumentTermMatrix(myCorpus4_28e)));
dtm4_28e <- DocumentTermMatrix(myCorpus4_28e[doc.lengths4_28e > 0]);
# choosing 2, 5 and 10 topics
lda4_28e_2 <- LDA(dtm4_28e, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_28e_5 <- LDA(dtm4_28e, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_28e_10 <- LDA(dtm4_28e, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms4_28e_2 <- as.matrix(terms(lda4_28e_2,10)); # top 10 terms in topics
top10terms4_28e_5 <- as.matrix(terms(lda4_28e_5,10));
top10terms4_28e_10 <- as.matrix(terms(lda4_28e_10,10));
lda.topics4_28e_5 = as.matrix(topics(lda4_28e_5));
lda.topics4_28e_2 = as.matrix(topics(lda4_28e_2));
lda.topics4_28e_10 = as.matrix(topics(lda4_28e_10));
summary(as.factor(lda.topics4_28e_5[,1]))
summary(as.factor(lda.topics4_28e_2[,1]))
summary(as.factor(lda.topics4_28e_10[,1]))

topicprob4_28e_5 = as.matrix(lda4_28e_5@gamma);
topicprob4_28e_2 = as.matrix(lda4_28e_2@gamma);
topicprob4_28e_10 = as.matrix(lda4_28e_10@gamma);

tweet4_28e <- textclean2(virg4_28e$text);
writeLines(tweet4_28e[[20]])

# Sentiment Analysis
# Tokenizing character file
token4_28e <- data.frame(text=tweet4_28e, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti4_28ve <- inner_join(token4_28e, get_sentiments("loughran")) %>% count(sentiment);
senti4_28ve_temp <- inner_join(token4_28e, get_sentiments("bing"));
senti4_28ve <- data.frame(table(senti4_28ve_temp$sentiment));
colnames(senti4_28ve) <- c("sentiment","n");
senti4_28ve$percent = (senti4_28ve$n/sum(senti4_28ve$n))*100;
#Plotting the sentiment summary 
ggplot(senti4_28ve, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments4_28e <- sentiment(virg4_28e$text)
table(sentiments4_28e$polarity)
# sentiment plot
sentiments4_28e$score <- 0
sentiments4_28e$score[sentiments4_28e$polarity == "positive"] <- 1
sentiments4_28e$score[sentiments4_28e$polarity == "negative"] <- -1
sentiments4_28e$time <- as.POSIXct(round(as.POSIXct(virg4_28e$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result4_28e <- aggregate(score ~ time, data = sentiments4_28e, sum)
ggplot(result4_28e,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus4_28ne <- Corpus(VectorSource(virg4_28ne$text)); 
myCorpus4_28ne <- textclean(myCorpus4_28ne);            # text cleaning
writeLines(strwrap(myCorpus4_28ne[[200]]$content, 60))
# count word frequence
tdm4_28ne <- TermDocumentMatrix(myCorpus4_28ne,control = list(wordLengths = c(1, Inf)));
freq.terms4_28ne <- findFreqTerms(tdm4_28ne, lowfreq = 5);
term.freq4_28ne <- rowSums(as.matrix(tdm4_28ne));
term.freq4_28ne <- subset(term.freq4_28ne, term.freq4_28ne >= 5);
df4_28ne <- data.frame(ind=rep("4_28ne",length(term.freq4_28ne)), term = names(term.freq4_28ne), freq = term.freq4_28ne)
ggplot(df4_28ne, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc4_28ne <- as.matrix(tdm4_28ne);
word.freq4_28ne <- sort(rowSums(wc4_28ne), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq4_28ne), freq = word.freq4_28ne, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm4_28ne, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm4_28ne, term = freq.terms4_28ne, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths4_28ne <- rowSums(as.matrix(DocumentTermMatrix(myCorpus4_28ne)));
dtm4_28ne <- DocumentTermMatrix(myCorpus4_28ne[doc.lengths4_28ne > 0]);
# choosing 2, 5 and 10 topics
lda4_28ne_2 <- LDA(dtm4_28ne, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_28ne_5 <- LDA(dtm4_28ne, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda4_28ne_10 <- LDA(dtm4_28ne, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms4_28ne_2 <- as.matrix(terms(lda4_28ne_2,10)); # top 10 terms in topics
top10terms4_28ne_5 <- as.matrix(terms(lda4_28ne_5,10));
top10terms4_28ne_10 <- as.matrix(terms(lda4_28ne_10,10));
lda.topics4_28ne_5 = as.matrix(topics(lda4_28ne_5));
lda.topics4_28ne_2 = as.matrix(topics(lda4_28ne_2));
lda.topics4_28ne_10 = as.matrix(topics(lda4_28ne_10));
summary(as.factor(lda.topics4_28ne_5[,1]))
summary(as.factor(lda.topics4_28ne_2[,1]))
summary(as.factor(lda.topics4_28ne_10[,1]))

topicprob4_28ne_5 = as.matrix(lda4_28ne_5@gamma);
topicprob4_28ne_2 = as.matrix(lda4_28ne_2@gamma);
topicprob4_28ne_10 = as.matrix(lda4_28ne_10@gamma);

tweet4_28ne <- textclean2(virg4_28ne$text);
writeLines(tweet4_28ne[[20]])

# Sentiment Analysis
# Tokenizing character file
token4_28ne <- data.frame(text=tweet4_28ne, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti4_28vne <- inner_join(token4_28ne, get_sentiments("loughran")) %>% count(sentiment);
senti4_28vne_temp <- inner_join(token4_28ne, get_sentiments("bing"));
senti4_28vne <- data.frame(table(senti4_28vne_temp$sentiment));
colnames(senti4_28vne) <- c("sentiment","n");
senti4_28vne$percent = (senti4_28vne$n/sum(senti4_28vne$n))*100;
#Plotting the sentiment summary 
ggplot(senti4_28vne, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments4_28ne <- sentiment(virg4_28ne$text)
table(sentiments4_28ne$polarity)
# sentiment plot
sentiments4_28ne$score <- 0
sentiments4_28ne$score[sentiments4_28ne$polarity == "positive"] <- 1
sentiments4_28ne$score[sentiments4_28ne$polarity == "negative"] <- -1
sentiments4_28ne$time <- as.POSIXct(round(as.POSIXct(virg4_28ne$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result4_28ne <- aggregate(score ~ time, data = sentiments4_28ne, sum)
ggplot(result4_28ne,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
