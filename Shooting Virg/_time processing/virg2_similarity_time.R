# from virg0_similarity

event_time_virg <- strptime("2019-05-31 16:44:00","%Y-%m-%d %H:%M:%S");

virg2_28_temp <- read.csv(file="Shooting Virg/virg2/virg_30_28_2.csv",header=TRUE);

virg2_28ne <- subset(virg2_28_temp, as.POSIXct(virg2_28_temp$created) < as.POSIXct(event_time_virg));
virg2_28e <- subset(virg2_28_temp, as.POSIXct(virg2_28_temp$created) > as.POSIXct(event_time_virg));


############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus2_28e <- Corpus(VectorSource(virg2_28e$text)); 
myCorpus2_28e <- textclean(myCorpus2_28e);            # text cleaning
writeLines(strwrap(myCorpus2_28e[[20]]$content, 60))
# count word frequence
tdm2_28e <- TermDocumentMatrix(myCorpus2_28e,control = list(wordLengths = c(1, Inf)));
freq.terms2_28e <- findFreqTerms(tdm2_28e, lowfreq = 5);
term.freq2_28e <- rowSums(as.matrix(tdm2_28e));
term.freq2_28e <- subset(term.freq2_28e, term.freq2_28e >= 5);
df2_28e <- data.frame(ind=rep("2_28e",length(term.freq2_28e)), term = names(term.freq2_28e), freq = term.freq2_28e)
ggplot(df2_28e, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc2_28e <- as.matrix(tdm2_28e);
word.freq2_28e <- sort(rowSums(wc2_28e), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq2_28e), freq = word.freq2_28e, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm2_28e, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm2_28e, term = freq.terms2_28e, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths2_28e <- rowSums(as.matrix(DocumentTermMatrix(myCorpus2_28e)));
dtm2_28e <- DocumentTermMatrix(myCorpus2_28e[doc.lengths2_28e > 0]);
# choosing 2, 5 and 10 topics
lda2_28e_2 <- LDA(dtm2_28e, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_28e_5 <- LDA(dtm2_28e, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_28e_10 <- LDA(dtm2_28e, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms2_28e_2 <- as.matrix(terms(lda2_28e_2,10)); # top 10 terms in topics
top10terms2_28e_5 <- as.matrix(terms(lda2_28e_5,10));
top10terms2_28e_10 <- as.matrix(terms(lda2_28e_10,10));
lda.topics2_28e_5 = as.matrix(topics(lda2_28e_5));
lda.topics2_28e_2 = as.matrix(topics(lda2_28e_2));
lda.topics2_28e_10 = as.matrix(topics(lda2_28e_10));
summary(as.factor(lda.topics2_28e_5[,1]))
summary(as.factor(lda.topics2_28e_2[,1]))
summary(as.factor(lda.topics2_28e_10[,1]))

topicprob2_28e_5 = as.matrix(lda2_28e_5@gamma);
topicprob2_28e_2 = as.matrix(lda2_28e_2@gamma);
topicprob2_28e_10 = as.matrix(lda2_28e_10@gamma);

tweet2_28e <- textclean2(virg2_28e$text);
writeLines(tweet2_28e[[20]])

# Sentiment Analysis
# Tokenizing character file
token2_28e <- data.frame(text=tweet2_28e, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti2_28ve <- inner_join(token2_28e, get_sentiments("loughran")) %>% count(sentiment);
senti2_28ve_temp <- inner_join(token2_28e, get_sentiments("bing"));
senti2_28ve <- data.frame(table(senti2_28ve_temp$sentiment));
colnames(senti2_28ve) <- c("sentiment","n");
senti2_28ve$percent = (senti2_28ve$n/sum(senti2_28ve$n))*100;
#Plotting the sentiment summary 
ggplot(senti2_28ve, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments2_28e <- sentiment(virg2_28e$text)
table(sentiments2_28e$polarity)
# sentiment plot
sentiments2_28e$score <- 0
sentiments2_28e$score[sentiments2_28e$polarity == "positive"] <- 1
sentiments2_28e$score[sentiments2_28e$polarity == "negative"] <- -1
sentiments2_28e$time <- as.POSIXct(round(as.POSIXct(virg2_28e$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result2_28e <- aggregate(score ~ time, data = sentiments2_28e, sum)
ggplot(result2_28e,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus2_28ne <- Corpus(VectorSource(virg2_28ne$text)); 
myCorpus2_28ne <- textclean(myCorpus2_28ne);            # text cleaning
writeLines(strwrap(myCorpus2_28ne[[200]]$content, 60))
# count word frequence
tdm2_28ne <- TermDocumentMatrix(myCorpus2_28ne,control = list(wordLengths = c(1, Inf)));
freq.terms2_28ne <- findFreqTerms(tdm2_28ne, lowfreq = 2);
term.freq2_28ne <- rowSums(as.matrix(tdm2_28ne));
term.freq2_28ne <- subset(term.freq2_28ne, term.freq2_28ne >= 2);
df2_28ne <- data.frame(ind=rep("2_28ne",length(term.freq2_28ne)), term = names(term.freq2_28ne), freq = term.freq2_28ne)
ggplot(df2_28ne, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
wc2_28ne <- as.matrix(tdm2_28ne);
word.freq2_28ne <- sort(rowSums(wc2_28ne), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq2_28ne), freq = word.freq2_28ne, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm2_28ne, "virginia", 0.2) # which words are associated with 'shooting'?
plot(tdm2_28ne, term = freq.terms2_28ne, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths2_28ne <- rowSums(as.matrix(DocumentTermMatrix(myCorpus2_28ne)));
dtm2_28ne <- DocumentTermMatrix(myCorpus2_28ne[doc.lengths2_28ne > 0]);
# choosing 2, 5 and 10 topics
lda2_28ne_2 <- LDA(dtm2_28ne, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_28ne_5 <- LDA(dtm2_28ne, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda2_28ne_10 <- LDA(dtm2_28ne, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms2_28ne_2 <- as.matrix(terms(lda2_28ne_2,10)); # top 10 terms in topics
top10terms2_28ne_5 <- as.matrix(terms(lda2_28ne_5,10));
top10terms2_28ne_10 <- as.matrix(terms(lda2_28ne_10,10));
lda.topics2_28ne_5 = as.matrix(topics(lda2_28ne_5));
lda.topics2_28ne_2 = as.matrix(topics(lda2_28ne_2));
lda.topics2_28ne_10 = as.matrix(topics(lda2_28ne_10));
summary(as.factor(lda.topics2_28ne_5[,1]))
summary(as.factor(lda.topics2_28ne_2[,1]))
summary(as.factor(lda.topics2_28ne_10[,1]))

topicprob2_28ne_5 = as.matrix(lda2_28ne_5@gamma);
topicprob2_28ne_2 = as.matrix(lda2_28ne_2@gamma);
topicprob2_28ne_10 = as.matrix(lda2_28ne_10@gamma);

tweet2_28ne <- textclean2(virg2_28ne$text);
writeLines(tweet2_28ne[[20]])

# Sentiment Analysis
# Tokenizing character file
token2_28ne <- data.frame(text=tweet2_28ne, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti2_28vne <- inner_join(token2_28ne, get_sentiments("loughran")) %>% count(sentiment);
senti2_28vne_temp <- inner_join(token2_28ne, get_sentiments("bing"));
senti2_28vne <- data.frame(table(senti2_28vne_temp$sentiment));
colnames(senti2_28vne) <- c("sentiment","n");
senti2_28vne$percent = (senti2_28vne$n/sum(senti2_28vne$n))*100;
#Plotting the sentiment summary 
ggplot(senti2_28vne, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments2_28ne <- sentiment(virg2_28ne$text)
table(sentiments2_28ne$polarity)
# sentiment plot
sentiments2_28ne$score <- 0
sentiments2_28ne$score[sentiments2_28ne$polarity == "positive"] <- 1
sentiments2_28ne$score[sentiments2_28ne$polarity == "negative"] <- -1
sentiments2_28ne$time <- as.POSIXct(round(as.POSIXct(virg2_28ne$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result2_28ne <- aggregate(score ~ time, data = sentiments2_28ne, sum)
ggplot(result2_28ne,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
