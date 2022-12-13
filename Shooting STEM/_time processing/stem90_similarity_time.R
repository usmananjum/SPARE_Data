# from stem0_similarity

event_time_stem <- strptime("2019-05-07 13:53:00","%Y-%m-%d %H:%M:%S");

stem90_27_temp <- read.csv(file="Shooting STEM/stem90/stem_90_27_2.csv",header=TRUE);

stem90_27ne <- subset(stem90_27_temp, as.POSIXct(stem90_27_temp$created) < as.POSIXct(event_time_stem));
stem90_27e <- subset(stem90_27_temp, as.POSIXct(stem90_27_temp$created) > as.POSIXct(event_time_stem));


############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus90_27e <- Corpus(VectorSource(stem90_27e$text)); 
myCorpus90_27e <- textclean(myCorpus90_27e);            # text cleaning
writeLines(strwrap(myCorpus90_27e[[20]]$content, 60))
# count word frequence
tdm90_27e <- TermDocumentMatrix(myCorpus90_27e,control = list(wordLengths = c(1, Inf)));
freq.terms90_27e <- findFreqTerms(tdm90_27e, lowfreq = 30);
term.freq90_27e <- rowSums(as.matrix(tdm90_27e));
term.freq90_27e <- subset(term.freq90_27e, term.freq90_27e >= 30);
df90_27e <- data.frame(ind=rep("90_27e",length(term.freq90_27e)), term = names(term.freq90_27e), freq = term.freq90_27e)
ggplot(df90_27e, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=20))

# Word Cloud
wc90_27e <- as.matrix(tdm90_27e);
word.freq90_27e <- sort(rowSums(wc90_27e), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq90_27e), freq = word.freq90_27e, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm90_27e, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm90_27e, term = freq.terms90_27e, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths90_27e <- rowSums(as.matrix(DocumentTermMatrix(myCorpus90_27e)));
dtm90_27e <- DocumentTermMatrix(myCorpus90_27e[doc.lengths90_27e > 0]);
# choosing 2, 5 and 10 topics
lda90_27e_2 <- LDA(dtm90_27e, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_27e_5 <- LDA(dtm90_27e, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_27e_10 <- LDA(dtm90_27e, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms90_27e_2 <- as.matrix(terms(lda90_27e_2,10)); # top 10 terms in topics
top10terms90_27e_5 <- as.matrix(terms(lda90_27e_5,10));
top10terms90_27e_10 <- as.matrix(terms(lda90_27e_10,10));
lda.topics90_27e_5 = as.matrix(topics(lda90_27e_5));
lda.topics90_27e_2 = as.matrix(topics(lda90_27e_2));
lda.topics90_27e_10 = as.matrix(topics(lda90_27e_10));
summary(as.factor(lda.topics90_27e_5[,1]))
summary(as.factor(lda.topics90_27e_2[,1]))
summary(as.factor(lda.topics90_27e_10[,1]))

topicprob90_27e_5 = as.matrix(lda90_27e_5@gamma);
topicprob90_27e_2 = as.matrix(lda90_27e_2@gamma);
topicprob90_27e_10 = as.matrix(lda90_27e_10@gamma);

tweet90_27e <- textclean2(stem90_27e$text);
writeLines(tweet90_27e[[20]])

# Sentiment Analysis
# Tokenizing character file
token90_27e <- data.frame(text=tweet90_27e, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti90_27e <- inner_join(token90_27e, get_sentiments("loughran")) %>% count(sentiment);
senti90_27e_temp <- inner_join(token90_27e, get_sentiments("bing"));
senti90_27e <- data.frame(table(senti90_27e_temp$sentiment));
colnames(senti90_27e) <- c("sentiment","n");
senti90_27e$percent = (senti90_27e$n/sum(senti90_27e$n))*100;
#Plotting the sentiment summary 
ggplot(senti90_27e, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments90_27e <- sentiment(stem90_27e$text)
table(sentiments90_27e$polarity)
# sentiment plot
sentiments90_27e$score <- 0
sentiments90_27e$score[sentiments90_27e$polarity == "positive"] <- 1
sentiments90_27e$score[sentiments90_27e$polarity == "negative"] <- -1
sentiments90_27e$time <- as.POSIXct(round(as.POSIXct(stem90_27e$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result90_27e <- aggregate(score ~ time, data = sentiments90_27e, sum)
ggplot(result90_27e,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus90_27ne <- Corpus(VectorSource(stem90_27ne$text)); 
myCorpus90_27ne <- textclean(myCorpus90_27ne);            # text cleaning
writeLines(strwrap(myCorpus90_27ne[[200]]$content, 60))
# count word frequence
tdm90_27ne <- TermDocumentMatrix(myCorpus90_27ne,control = list(wordLengths = c(1, Inf)));
freq.terms90_27ne <- findFreqTerms(tdm90_27ne, lowfreq = 10);
term.freq90_27ne <- rowSums(as.matrix(tdm90_27ne));
term.freq90_27ne <- subset(term.freq90_27ne, term.freq90_27ne >= 10);
df90_27ne <- data.frame(ind=rep("90_27ne",length(term.freq90_27ne)), term = names(term.freq90_27ne), freq = term.freq90_27ne)
ggplot(df90_27ne, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=20))

# Word Cloud
wc90_27ne <- as.matrix(tdm90_27ne);
word.freq90_27ne <- sort(rowSums(wc90_27ne), decreasing = T);    # calculate the frequency of words and sort it by frequency
wordcloud(words = names(word.freq90_27ne), freq = word.freq90_27ne, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
findAssocs(tdm90_27ne, "school", 0.2) # which words are associated with 'shooting'?
plot(tdm90_27ne, term = freq.terms90_27ne, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths90_27ne <- rowSums(as.matrix(DocumentTermMatrix(myCorpus90_27ne)));
dtm90_27ne <- DocumentTermMatrix(myCorpus90_27ne[doc.lengths90_27ne > 0]);
# choosing 2, 5 and 10 topics
lda90_27ne_2 <- LDA(dtm90_27ne, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_27ne_5 <- LDA(dtm90_27ne, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda90_27ne_10 <- LDA(dtm90_27ne, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms90_27ne_2 <- as.matrix(terms(lda90_27ne_2,10)); # top 10 terms in topics
top10terms90_27ne_5 <- as.matrix(terms(lda90_27ne_5,10));
top10terms90_27ne_10 <- as.matrix(terms(lda90_27ne_10,10));
lda.topics90_27ne_5 = as.matrix(topics(lda90_27ne_5));
lda.topics90_27ne_2 = as.matrix(topics(lda90_27ne_2));
lda.topics90_27ne_10 = as.matrix(topics(lda90_27ne_10));
summary(as.factor(lda.topics90_27ne_5[,1]))
summary(as.factor(lda.topics90_27ne_2[,1]))
summary(as.factor(lda.topics90_27ne_10[,1]))

topicprob90_27ne_5 = as.matrix(lda90_27ne_5@gamma);
topicprob90_27ne_2 = as.matrix(lda90_27ne_2@gamma);
topicprob90_27ne_10 = as.matrix(lda90_27ne_10@gamma);

tweet90_27ne <- textclean2(stem90_27ne$text);
writeLines(tweet90_27ne[[20]])

# Sentiment Analysis
# Tokenizing character file
token90_27ne <- data.frame(text=tweet90_27ne, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti90_27ne <- inner_join(token90_27ne, get_sentiments("loughran")) %>% count(sentiment);
senti90_27ne_temp <- inner_join(token90_27ne, get_sentiments("bing"));
senti90_27ne <- data.frame(table(senti90_27ne_temp$sentiment));
colnames(senti90_27ne) <- c("sentiment","n");
senti90_27ne$percent = (senti90_27ne$n/sum(senti90_27ne$n))*100;
#Plotting the sentiment summary 
ggplot(senti90_27ne, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments90_27ne <- sentiment(stem90_27ne$text)
table(sentiments90_27ne$polarity)
# sentiment plot
sentiments90_27ne$score <- 0
sentiments90_27ne$score[sentiments90_27ne$polarity == "positive"] <- 1
sentiments90_27ne$score[sentiments90_27ne$polarity == "negative"] <- -1
sentiments90_27ne$time <- as.POSIXct(round(as.POSIXct(stem90_27ne$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result90_27ne <- aggregate(score ~ time, data = sentiments90_27ne, sum)
ggplot(result90_27ne,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") 

###################################################################################
###################################################################################
