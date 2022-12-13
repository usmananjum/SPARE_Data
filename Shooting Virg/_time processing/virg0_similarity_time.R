# from virg0_similarity

event_time_virg <- strptime("2019-05-31 16:44:00","%Y-%m-%d %H:%M:%S");

virg0_28_temp <- read.csv(file="Shooting Virg/virg0/virg28_2.csv",header=TRUE);

virg0_28ne <- subset(virg0_28_temp, as.POSIXct(virg0_28_temp$created) < as.POSIXct(event_time_virg));
virg0_28e <- subset(virg0_28_temp, as.POSIXct(virg0_28_temp$created) > as.POSIXct(event_time_virg));


############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus0_28e <- Corpus(VectorSource(virg0_28e$text)); 
myCorpus0_28e <- textclean(myCorpus0_28e);            # text cleaning
writeLines(strwrap(myCorpus0_28e[[20]]$content, 60))
# count word frequence
tdm0_28e <- TermDocumentMatrix(myCorpus0_28e,control = list(wordLengths = c(1, Inf)));
freq.terms0_28e <- findFreqTerms(tdm0_28e, lowfreq = 50);
term.freq0_28e <- rowSums(as.matrix(tdm0_28e));
term.freq0_28e <- subset(term.freq0_28e, term.freq0_28e >= 50);
df0_28e <- data.frame(ind=rep("0_28e",length(term.freq0_28e)), term = names(term.freq0_28e), freq = term.freq0_28e)
ggplot(df0_28e, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
# wc0_28e <- as.matrix(tdm0_28e);
# word.freq0_28e <- sort(rowSums(wc0_28e), decreasing = T);    # calculate the frequency of words and sort it by frequency
# wordcloud(words = names(word.freq0_28e), freq = word.freq0_28e, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
# findAssocs(tdm0_28e, "virginia", 0.2) # which words are associated with 'shooting'?
# plot(tdm0_28e, term = freq.terms0_28e, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths0_28e <- rowSums(as.matrix(DocumentTermMatrix(myCorpus0_28e)));
dtm0_28e <- DocumentTermMatrix(myCorpus0_28e[doc.lengths0_28e > 0]);
# choosing 2, 5 and 10 topics
lda0_28e_2 <- LDA(dtm0_28e, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda0_28e_5 <- LDA(dtm0_28e, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda0_28e_10 <- LDA(dtm0_28e, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms0_28e_2 <- as.matrix(terms(lda0_28e_2,10)); # top 10 terms in topics
top10terms0_28e_5 <- as.matrix(terms(lda0_28e_5,10));
top10terms0_28e_10 <- as.matrix(terms(lda0_28e_10,10));
lda.topics0_28e_5 = as.matrix(topics(lda0_28e_5));
lda.topics0_28e_2 = as.matrix(topics(lda0_28e_2));
lda.topics0_28e_10 = as.matrix(topics(lda0_28e_10));
summary(as.factor(lda.topics0_28e_5[,1]))
summary(as.factor(lda.topics0_28e_2[,1]))
summary(as.factor(lda.topics0_28e_10[,1]))

topicprob0_28e_5 = as.matrix(lda0_28e_5@gamma);
topicprob0_28e_2 = as.matrix(lda0_28e_2@gamma);
topicprob0_28e_10 = as.matrix(lda0_28e_10@gamma);

tweet0_28e <- textclean2(virg0_28e$text);
writeLines(tweet0_28e[[20]])

# Sentiment Analysis
# Tokenizing character file
token0_28e <- data.frame(text=tweet0_28e, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti0_28ve <- inner_join(token0_28e, get_sentiments("loughran")) %>% count(sentiment);
senti0_28ve_temp <- inner_join(token0_28e, get_sentiments("bing"));
senti0_28ve <- data.frame(table(senti0_28ve_temp$sentiment));
colnames(senti0_28ve) <- c("sentiment","n");
senti0_28ve$percent = (senti0_28ve$n/sum(senti0_28ve$n))*100;
#Plotting the sentiment summary 
ggplot(senti0_28ve, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments0_28e <- sentiment(virg0_28e$text)
table(sentiments0_28e$polarity)
# sentiment plot
sentiments0_28e$score <- 0
sentiments0_28e$score[sentiments0_28e$polarity == "positive"] <- 1
sentiments0_28e$score[sentiments0_28e$polarity == "negative"] <- -1
sentiments0_28e$time <- as.POSIXct(round(as.POSIXct(virg0_28e$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result0_28e <- aggregate(score ~ time, data = sentiments0_28e, sum)
ggplot(result0_28e,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")


############################ N0-EVENT (disggregated) ##############################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus0_28ne <- Corpus(VectorSource(virg0_28ne$text)); 
myCorpus0_28ne <- textclean(myCorpus0_28ne);            # text cleaning
writeLines(strwrap(myCorpus0_28ne[[200]]$content, 60))
# count word frequence
tdm0_28ne <- TermDocumentMatrix(myCorpus0_28ne,control = list(wordLengths = c(1, Inf)));
freq.terms0_28ne <- findFreqTerms(tdm0_28ne, lowfreq = 50);
term.freq0_28ne <- rowSums(as.matrix(tdm0_28ne));
term.freq0_28ne <- subset(term.freq0_28ne, term.freq0_28ne >= 50);
df0_28ne <- data.frame(ind=rep("0_28ne",length(term.freq0_28ne)), term = names(term.freq0_28ne), freq = term.freq0_28ne)
ggplot(df0_28ne, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# Word Cloud
# wc0_28ne <- as.matrix(tdm0_28ne);
# word.freq0_28ne <- sort(rowSums(wc0_28ne), decreasing = T);    # calculate the frequency of words and sort it by frequency
# wordcloud(words = names(word.freq0_28ne), freq = word.freq0_28ne, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
# findAssocs(tdm0_28ne, "virginia", 0.2) # which words are associated with 'shooting'?
# plot(tdm0_28ne, term = freq.terms0_28ne, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths0_28ne <- rowSums(as.matrix(DocumentTermMatrix(myCorpus0_28ne)));
dtm0_28ne <- DocumentTermMatrix(myCorpus0_28ne[doc.lengths0_28ne > 0]);
# choosing 2, 5 and 10 topics
lda0_28ne_2 <- LDA(dtm0_28ne, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda0_28ne_5 <- LDA(dtm0_28ne, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda0_28ne_10 <- LDA(dtm0_28ne, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms0_28ne_2 <- as.matrix(terms(lda0_28ne_2,10)); # top 10 terms in topics
top10terms0_28ne_5 <- as.matrix(terms(lda0_28ne_5,10));
top10terms0_28ne_10 <- as.matrix(terms(lda0_28ne_10,10));
lda.topics0_28ne_5 = as.matrix(topics(lda0_28ne_5));
lda.topics0_28ne_2 = as.matrix(topics(lda0_28ne_2));
lda.topics0_28ne_10 = as.matrix(topics(lda0_28ne_10));
summary(as.factor(lda.topics0_28ne_5[,1]))
summary(as.factor(lda.topics0_28ne_2[,1]))
summary(as.factor(lda.topics0_28ne_10[,1]))

topicprob0_28ne_5 = as.matrix(lda0_28ne_5@gamma);
topicprob0_28ne_2 = as.matrix(lda0_28ne_2@gamma);
topicprob0_28ne_10 = as.matrix(lda0_28ne_10@gamma);

tweet0_28ne <- textclean2(virg0_28ne$text);
writeLines(tweet0_28ne[[20]])

# Sentiment Analysis
# Tokenizing character file
token0_28ne <- data.frame(text=tweet0_28ne, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti0_28vne <- inner_join(token0_28ne, get_sentiments("loughran")) %>% count(sentiment);
senti0_28vne_temp <- inner_join(token0_28ne, get_sentiments("bing"));
senti0_28vne <- data.frame(table(senti0_28vne_temp$sentiment));
colnames(senti0_28vne) <- c("sentiment","n");
senti0_28vne$percent = (senti0_28vne$n/sum(senti0_28vne$n))*100;
#Plotting the sentiment summary 
ggplot(senti0_28vne, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments0_28ne <- sentiment(virg0_28ne$text)
table(sentiments0_28ne$polarity)
# sentiment plot
sentiments0_28ne$score <- 0
sentiments0_28ne$score[sentiments0_28ne$polarity == "positive"] <- 1
sentiments0_28ne$score[sentiments0_28ne$polarity == "negative"] <- -1
sentiments0_28ne$time <- as.POSIXct(round(as.POSIXct(virg0_28ne$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result0_28ne <- aggregate(score ~ time, data = sentiments0_28ne, sum)
ggplot(result0_28ne,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

###################################################################################
###################################################################################
