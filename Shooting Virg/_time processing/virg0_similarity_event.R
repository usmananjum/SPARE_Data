# from stem0_similarity

virg0_16_17 <- read.csv(file="Shooting Virg/virg0/virg0_16_17.csv",header=TRUE);

############################ EVENT (disggregated) #################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

myCorpus0_16_17 <- Corpus(VectorSource(virg0_16_17$text)); 
myCorpus0_16_17 <- textclean(myCorpus0_16_17);            # text cleaning
writeLines(strwrap(myCorpus0_16_17[[20]]$content, 60))
# count word frequence
tdm0_16_17 <- TermDocumentMatrix(myCorpus0_16_17,control = list(wordLengths = c(1, Inf)));
freq.terms0_16_17 <- findFreqTerms(tdm0_16_17, lowfreq = 150);
term.freq0_16_17 <- rowSums(as.matrix(tdm0_16_17));
term.freq0_16_17 <- subset(term.freq0_16_17, term.freq0_16_17 >= 150);
df0_16_17 <- data.frame(ind=rep("0_16_17",length(term.freq0_16_17)), term = names(term.freq0_16_17), freq = term.freq0_16_17)
ggplot(df0_16_17, aes(x=term, y=freq)) + geom_bar(stat="identity")+xlab("Terms") + ylab("Count") + coord_flip()+theme(axis.text=element_text(size=7))

# # Word Cloud
# wc0_16_17 <- as.matrix(tdm0_16_17);
# word.freq0_16_17 <- sort(rowSums(wc0_16_17), decreasing = T);    # calculate the frequency of words and sort it by frequency
# wordcloud(words = names(word.freq0_16_17), freq = word.freq0_16_17, min.freq = 3,random.order = F, colors = pal)    # plot word cloud
# findAssocs(tdm0_16_17, "virginia", 0.2) # which words are associated with 'shooting'?
# plot(tdm0_16_17, term = freq.terms0_16_17, corThreshold = 0.1, weighting = T)

# Topic Modeling
doc.lengths0_16_17 <- rowSums(as.matrix(DocumentTermMatrix(myCorpus0_16_17)));
dtm0_16_17 <- DocumentTermMatrix(myCorpus0_16_17[doc.lengths0_16_17 > 0]);
# choosing 2, 5 and 10 topics
lda0_16_17_2 <- LDA(dtm0_16_17, k = 2, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda0_16_17_5 <- LDA(dtm0_16_17, k = 5, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
lda0_16_17_10 <- LDA(dtm0_16_17, k = 10, method = 'Gibbs', control = list(nstart = 5, seed = list(1505,99,36,56,88), best = TRUE, thin = 500, burnin = 4000, iter = 2000));
top10terms0_16_17_2 <- as.matrix(terms(lda0_16_17_2,10)); # top 10 terms in topics
top10terms0_16_17_5 <- as.matrix(terms(lda0_16_17_5,10));
top10terms0_16_17_10 <- as.matrix(terms(lda0_16_17_10,10));
lda.topics0_16_17_5 = as.matrix(topics(lda0_16_17_5));
lda.topics0_16_17_2 = as.matrix(topics(lda0_16_17_2));
lda.topics0_16_17_10 = as.matrix(topics(lda0_16_17_10));
summary(as.factor(lda.topics0_16_17_5[,1]))
summary(as.factor(lda.topics0_16_17_2[,1]))
summary(as.factor(lda.topics0_16_17_10[,1]))

topicprob0_16_17_5 = as.matrix(lda0_16_17_5@gamma);
topicprob0_16_17_2 = as.matrix(lda0_16_17_2@gamma);
topicprob0_16_17_10 = as.matrix(lda0_16_17_10@gamma);

tweet0_16_17 <- textclean2(virg0_16_17$text);
writeLines(tweet0_16_17[[20]])

# Sentiment Analysis
# Tokenizing character file
token0_16_17 <- data.frame(text=tweet0_16_17, stringsAsFactors = FALSE) %>% unnest_tokens(word, text);
#Matching sentiment words from the sentiment lexicon
# senti0_16_17 <- inner_join(token0_16_17, get_sentiments("loughran")) %>% count(sentiment);
senti0_16_17_temp <- inner_join(token0_16_17, get_sentiments("bing"));
senti0_16_17 <- data.frame(table(senti0_16_17_temp$sentiment));
colnames(senti0_16_17) <- c("sentiment","n");
senti0_16_17$percent = (senti0_16_17$n/sum(senti0_16_17$n))*100;
#Plotting the sentiment summary 
ggplot(senti0_16_17, aes(sentiment, percent)) + geom_bar(aes(fill = sentiment), position = 'dodge', stat = 'identity') + 
  ggtitle("Sentiment analysis") + coord_flip() +
  theme(legend.position = 'none', plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=16),axis.title=element_text(size=14,face="bold"))

# Sentiment Analysis (alternative)
sentiments0_16_17 <- sentiment(virg0_16_17$text)
table(sentiments0_16_17$polarity)
# sentiment plot
sentiments0_16_17$score <- 0
sentiments0_16_17$score[sentiments0_16_17$polarity == "positive"] <- 1
sentiments0_16_17$score[sentiments0_16_17$polarity == "negative"] <- -1
sentiments0_16_17$time <- as.POSIXct(round(as.POSIXct(virg0_16_17$created,format = "%Y-%m-%d %H:%M:%S"),"hours"));
result0_16_17 <- aggregate(score ~ time, data = sentiments0_16_17, sum)
ggplot(result0_16_17,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")
