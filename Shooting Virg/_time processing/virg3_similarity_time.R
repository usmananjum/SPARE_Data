# from virg0_similarity

event_time_virg <- strptime("2019-05-31 16:44:00","%Y-%m-%d %H:%M:%S");

virg3_28_temp <- read.csv(file="Shooting Virg/virg3/virg_90_28_2.csv",header=TRUE);

virg3_28ne <- subset(virg3_28_temp, as.POSIXct(virg3_28_temp$created) < as.POSIXct(event_time_virg));
virg3_28e <- subset(virg3_28_temp, as.POSIXct(virg3_28_temp$created) > as.POSIXct(event_time_virg));


############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus3_28e <- Corpus(VectorSource(virg3_28e$text)); 
myCorpus3_28e <- textclean(myCorpus3_28e);            # text cleaning
writeLines(strwrap(myCorpus3_28e[[20]]$content, 60))
# count word frequence
tdm3_28e <- TermDocumentMatrix(myCorpus3_28e,control = list(wordLengths = c(1, Inf)));
freq.terms3_28e <- findFreqTerms(tdm3_28e, lowfreq = 5);
term.freq3_28e <- rowSums(as.matrix(tdm3_28e));
term.freq3_28e <- subset(term.freq3_28e, term.freq3_28e >= 5);
df3_28e <- data.frame(ind=rep("3_28e",length(term.freq3_28e)), term = names(term.freq3_28e), freq = term.freq3_28e)
ggplot(df3_28e, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc3_28e <- as.matrix(tdm3_28e);
word.freq3_28e <- sort(rowSums(wc3_28e), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq3_28e), freq = word.freq3_28e, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm3_28e, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm3_28e, term = freq.terms3_28e, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths3_28e <- rowSums(as.matrix(DocumentTermMatrix(myCorpus3_28e)));
dtm3_28e <- DocumentTermMatrix(myCorpus3_28e[doc.lengths3_28e > 0]);
# choosing 2, 5 and 10 topics
lda3_28e_2 <- LDA(dtm3_28e, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_28e_5 <- LDA(dtm3_28e, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_28e_10 <- LDA(dtm3_28e, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms3_28e_2 <- as.matrix(terms(lda3_28e_2,10)); # top 10 terms in topics
top10terms3_28e_5 <- as.matrix(terms(lda3_28e_5,10));
top10terms3_28e_10 <- as.matrix(terms(lda3_28e_10,10));
lda.topics3_28e_5 = as.matrix(topics(lda3_28e_5));
lda.topics3_28e_2 = as.matrix(topics(lda3_28e_2));
lda.topics3_28e_10 = as.matrix(topics(lda3_28e_10));
summary(as.factor(lda.topics3_28e_5[,1]))
summary(as.factor(lda.topics3_28e_2[,1]))
summary(as.factor(lda.topics3_28e_10[,1]))

topicprob3_28e_5 = as.matrix(lda3_28e_5@gamma);
topicprob3_28e_2 = as.matrix(lda3_28e_2@gamma);
topicprob3_28e_10 = as.matrix(lda3_28e_10@gamma);

tweet3_28e <- textclean2(virg3_28e$text);
writeLines(tweet3_28e[[20]])

# Sentiment Analysis
# Tokenizing character file
token3_28e <- data.frame(text=tweet3_28e, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti3_28ve <- inner_join(token3_28e, get_sentiments("loughran")) %>% count(sentiment);
senti3_28ve_temp <- inner_join(token3_28e, get_sentiments("bing"));
senti3_28ve <- data.frame(table(senti3_28ve_temp$sentiment));
colnames(senti3_28ve) <- c("sentiment","n");
senti3_28ve$percent = (senti3_28ve$n/sum(senti3_28ve$n))*100;
#Plotting the sentiment summary 
ggplot(senti3_28ve, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments3_28e <- sentiment(virg3_28e$text)
table(sentiments3_28e$polarity)
# sentiment plot
sentiments3_28e$score <- 0
sentiments3_28e$score[sentiments3_28e$polarity == "positive"] <- 1
sentiments3_28e$score[sentiments3_28e$polarity == "negative"] <- -1
sentiments3_28e$time <- as.POSIXct(round(as.POSIXct(virg3_28e$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result3_28e <- aggregate(score ~ time, data = sentiments3_28e, sum)
ggplot(result3_28e,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus3_28ne <- Corpus(VectorSource(virg3_28ne$text)); 
myCorpus3_28ne <- textclean(myCorpus3_28ne);            # text cleaning
writeLines(strwrap(myCorpus3_28ne[[200]]$content, 60))
# count word frequence
tdm3_28ne <- TermDocumentMatrix(myCorpus3_28ne,control = list(wordLengths = c(1, Inf)));
freq.terms3_28ne <- findFreqTerms(tdm3_28ne, lowfreq = 2);
term.freq3_28ne <- rowSums(as.matrix(tdm3_28ne));
term.freq3_28ne <- subset(term.freq3_28ne, term.freq3_28ne >= 2);
df3_28ne <- data.frame(ind=rep("3_28ne",length(term.freq3_28ne)), term = names(term.freq3_28ne), freq = term.freq3_28ne)
ggplot(df3_28ne, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc3_28ne <- as.matrix(tdm3_28ne);
word.freq3_28ne <- sort(rowSums(wc3_28ne), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq3_28ne), freq = word.freq3_28ne, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm3_28ne, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm3_28ne, term = freq.terms3_28ne, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths3_28ne <- rowSums(as.matrix(DocumentTermMatrix(myCorpus3_28ne)));
dtm3_28ne <- DocumentTermMatrix(myCorpus3_28ne[doc.lengths3_28ne > 0]);
# choosing 2, 5 and 10 topics
lda3_28ne_2 <- LDA(dtm3_28ne, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_28ne_5 <- LDA(dtm3_28ne, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda3_28ne_10 <- LDA(dtm3_28ne, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms3_28ne_2 <- as.matrix(terms(lda3_28ne_2,10)); # top 10 terms in topics
top10terms3_28ne_5 <- as.matrix(terms(lda3_28ne_5,10));
top10terms3_28ne_10 <- as.matrix(terms(lda3_28ne_10,10));
lda.topics3_28ne_5 = as.matrix(topics(lda3_28ne_5));
lda.topics3_28ne_2 = as.matrix(topics(lda3_28ne_2));
lda.topics3_28ne_10 = as.matrix(topics(lda3_28ne_10));
summary(as.factor(lda.topics3_28ne_5[,1]))
summary(as.factor(lda.topics3_28ne_2[,1]))
summary(as.factor(lda.topics3_28ne_10[,1]))

topicprob3_28ne_5 = as.matrix(lda3_28ne_5@gamma);
topicprob3_28ne_2 = as.matrix(lda3_28ne_2@gamma);
topicprob3_28ne_10 = as.matrix(lda3_28ne_10@gamma);

tweet3_28ne <- textclean2(virg3_28ne$text);
writeLines(tweet3_28ne[[20]])

# Sentiment Analysis
# Tokenizing character file
token3_28ne <- data.frame(text=tweet3_28ne, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti3_28vne <- inner_join(token3_28ne, get_sentiments("loughran")) %>% count(sentiment);
senti3_28vne_temp <- inner_join(token3_28ne, get_sentiments("bing"));
senti3_28vne <- data.frame(table(senti3_28vne_temp$sentiment));
colnames(senti3_28vne) <- c("sentiment","n");
senti3_28vne$percent = (senti3_28vne$n/sum(senti3_28vne$n))*100;
#Plotting the sentiment summary 
ggplot(senti3_28vne, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments3_28ne <- sentiment(virg3_28ne$text)
table(sentiments3_28ne$polarity)
# sentiment plot
sentiments3_28ne$score <- 0
sentiments3_28ne$score[sentiments3_28ne$polarity == "positive"] <- 1
sentiments3_28ne$score[sentiments3_28ne$polarity == "negative"] <- -1
sentiments3_28ne$time <- as.POSIXct(round(as.POSIXct(virg3_28ne$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result3_28ne <- aggregate(score ~ time, data = sentiments3_28ne, sum)
ggplot(result3_28ne,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
