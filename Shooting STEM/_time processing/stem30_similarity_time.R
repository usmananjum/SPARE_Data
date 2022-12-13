# from stem0_similarity

event_time_stem <- strptime("2019-05-07 13:53:00","%Y-%m-%d %H:%M:%S");

stem30_28_temp <- read.csv(file="Shooting STEM/stem30/stem_30_28_2.csv",header=TRUE);

stem30_28ne <- subset(stem30_28_temp, as.POSIXct(stem30_28_temp$created) < as.POSIXct(event_time_stem));
stem30_28e <- subset(stem30_28_temp, as.POSIXct(stem30_28_temp$created) > as.POSIXct(event_time_stem));


############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus30_28e <- Corpus(VectorSource(stem30_28e$text)); 
myCorpus30_28e <- textclean(myCorpus30_28e);            # text cleaning
writeLines(strwrap(myCorpus30_28e[[20]]$content, 60))
# count word frequence
tdm30_28e <- TermDocumentMatrix(myCorpus30_28e,control = list(wordLengths = c(1, Inf)));
freq.terms30_28e <- findFreqTerms(tdm30_28e, lowfreq = 200);
term.freq30_28e <- rowSums(as.matrix(tdm30_28e));
term.freq30_28e <- subset(term.freq30_28e, term.freq30_28e >= 200);
df30_28e <- data.frame(ind=rep("30_28e",length(term.freq30_28e)), term = names(term.freq30_28e), freq = term.freq30_28e)
ggplot(df30_28e, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=20))

# Word Cloud
# wc30_28e <- as.matrix(tdm30_28e);
# word.freq30_28e <- sort(rowSums(wc30_28e), decreasing = T);    # calculate the frequency of words and sort it by frequency
# wordcloud(words = names(word.freq30_28e), freq = word.freq30_28e, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
# findAssocs(tdm30_28e, "school", 0.2) # which words are associated with 'shooting'?
# plot(tdm30_28e, term = freq.terms30_28e, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths30_28e <- rowSums(as.matrix(DocumentTermMatrix(myCorpus30_28e)));
dtm30_28e <- DocumentTermMatrix(myCorpus30_28e[doc.lengths30_28e > 0]);
# choosing 2, 5 and 10 topics
lda30_28e_2 <- LDA(dtm30_28e, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_28e_5 <- LDA(dtm30_28e, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_28e_10 <- LDA(dtm30_28e, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms30_28e_2 <- as.matrix(terms(lda30_28e_2,10)); # top 10 terms in topics
top10terms30_28e_5 <- as.matrix(terms(lda30_28e_5,10));
top10terms30_28e_10 <- as.matrix(terms(lda30_28e_10,10));
lda.topics30_28e_5 = as.matrix(topics(lda30_28e_5));
lda.topics30_28e_2 = as.matrix(topics(lda30_28e_2));
lda.topics30_28e_10 = as.matrix(topics(lda30_28e_10));
summary(as.factor(lda.topics30_28e_5[,1]))
summary(as.factor(lda.topics30_28e_2[,1]))
summary(as.factor(lda.topics30_28e_10[,1]))

topicprob30_28e_5 = as.matrix(lda30_28e_5@gamma);
topicprob30_28e_2 = as.matrix(lda30_28e_2@gamma);
topicprob30_28e_10 = as.matrix(lda30_28e_10@gamma);

tweet30_28e <- textclean2(stem30_28e$text);
writeLines(tweet30_28e[[20]])

# Sentiment Analysis
# Tokenizing character file
token30_28e <- data.frame(text=tweet30_28e, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti30_28e <- inner_join(token30_28e, get_sentiments("loughran")) %>% count(sentiment);
senti30_28e_temp <- inner_join(token30_28e, get_sentiments("bing"));
senti30_28e <- data.frame(table(senti30_28e_temp$sentiment));
colnames(senti30_28e) <- c("sentiment","n");
senti30_28e$percent = (senti30_28e$n/sum(senti30_28e$n))*100;
#Plotting the sentiment summary 
ggplot(senti30_28e, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments30_28e <- sentiment(stem30_28e$text)
table(sentiments30_28e$polarity)
# sentiment plot
sentiments30_28e$score <- 0
sentiments30_28e$score[sentiments30_28e$polarity == "positive"] <- 1
sentiments30_28e$score[sentiments30_28e$polarity == "negative"] <- -1
sentiments30_28e$time <- as.POSIXct(round(as.POSIXct(stem30_28e$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result30_28e <- aggregate(score ~ time, data = sentiments30_28e, sum)
ggplot(result30_28e,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus30_28ne <- Corpus(VectorSource(stem30_28ne$text)); 
myCorpus30_28ne <- textclean(myCorpus30_28ne);            # text cleaning
writeLines(strwrap(myCorpus30_28ne[[200]]$content, 60))
# count word frequence
tdm30_28ne <- TermDocumentMatrix(myCorpus30_28ne,control = list(wordLengths = c(1, Inf)));
freq.terms30_28ne <- findFreqTerms(tdm30_28ne, lowfreq = 200);
term.freq30_28ne <- rowSums(as.matrix(tdm30_28ne));
term.freq30_28ne <- subset(term.freq30_28ne, term.freq30_28ne >= 200);
df30_28ne <- data.frame(ind=rep("30_28ne",length(term.freq30_28ne)), term = names(term.freq30_28ne), freq = term.freq30_28ne)
ggplot(df30_28ne, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
# wc30_28ne <- as.matrix(tdm30_28ne);
# word.freq30_28ne <- sort(rowSums(wc30_28ne), decreasing = T);    # calculate the frequency of words and sort it by frequency
# wordcloud(words = names(word.freq30_28ne), freq = word.freq30_28ne, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
# findAssocs(tdm30_28ne, "school", 0.2) # which words are associated with 'shooting'?
# plot(tdm30_28ne, term = freq.terms30_28ne, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths30_28ne <- rowSums(as.matrix(DocumentTermMatrix(myCorpus30_28ne)));
dtm30_28ne <- DocumentTermMatrix(myCorpus30_28ne[doc.lengths30_28ne > 0]);
# choosing 2, 5 and 10 topics
lda30_28ne_2 <- LDA(dtm30_28ne, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_28ne_5 <- LDA(dtm30_28ne, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda30_28ne_10 <- LDA(dtm30_28ne, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms30_28ne_2 <- as.matrix(terms(lda30_28ne_2,10)); # top 10 terms in topics
top10terms30_28ne_5 <- as.matrix(terms(lda30_28ne_5,10));
top10terms30_28ne_10 <- as.matrix(terms(lda30_28ne_10,10));
lda.topics30_28ne_5 = as.matrix(topics(lda30_28ne_5));
lda.topics30_28ne_2 = as.matrix(topics(lda30_28ne_2));
lda.topics30_28ne_10 = as.matrix(topics(lda30_28ne_10));
summary(as.factor(lda.topics30_28ne_5[,1]))
summary(as.factor(lda.topics30_28ne_2[,1]))
summary(as.factor(lda.topics30_28ne_10[,1]))

topicprob30_28ne_5 = as.matrix(lda30_28ne_5@gamma);
topicprob30_28ne_2 = as.matrix(lda30_28ne_2@gamma);
topicprob30_28ne_10 = as.matrix(lda30_28ne_10@gamma);

tweet30_28ne <- textclean2(stem30_28ne$text);
writeLines(tweet30_28ne[[20]])

# Sentiment Analysis
# Tokenizing character file
token30_28ne <- data.frame(text=tweet30_28ne, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti30_28ne <- inner_join(token30_28ne, get_sentiments("loughran")) %>% count(sentiment);
senti30_28ne_temp <- inner_join(token30_28ne, get_sentiments("bing"));
senti30_28ne <- data.frame(table(senti30_28ne_temp$sentiment));
colnames(senti30_28ne) <- c("sentiment","n");
senti30_28ne$percent = (senti30_28ne$n/sum(senti30_28ne$n))*100;
#Plotting the sentiment summary 
ggplot(senti30_28ne, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments30_28ne <- sentiment(stem30_28ne$text)
table(sentiments30_28ne$polarity)
# sentiment plot
sentiments30_28ne$score <- 0
sentiments30_28ne$score[sentiments30_28ne$polarity == "positive"] <- 1
sentiments30_28ne$score[sentiments30_28ne$polarity == "negative"] <- -1
sentiments30_28ne$time <- as.POSIXct(round(as.POSIXct(stem30_28ne$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result30_28ne <- aggregate(score ~ time, data = sentiments30_28ne, sum)
ggplot(result30_28ne,aes(time,score)) + geom_line() + geom_vline(xintercept = round(event_time_stem,"hours")) + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + 
  theme(axis.text=element_text(size=20), axis.title=element_text(size=18,face="bold"))

###################################################################################
###################################################################################
