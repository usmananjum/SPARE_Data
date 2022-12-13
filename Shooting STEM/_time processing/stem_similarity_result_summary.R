# stem similarity result summary
library("gridExtra")

# topic analysis

df_stem_topic <- rbind(df12_13,df20_21,df30_12_13,df30_21_22,df90_16_17,df90_23_24);

ggplot(data=df_stem_topic, aes(x=term, y=freq, fill=ind)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Topic Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=15))

# word cloud
# event
plot(tdm20_21, term = freq.terms20_21, corThreshold = 0.1, weighting = T)
plot(tdm30_21_22, term = freq.terms30_21_22, corThreshold = 0.1, weighting = T)
plot(tdm90_23_24, term = freq.terms90_23_24, corThreshold = 0.1, weighting = T)
# non-event
plot(tdm12_13, term = freq.terms12_13, corThreshold = 0.1, weighting = T)
plot(tdm30_12_13, term = freq.terms30_12_13, corThreshold = 0.1, weighting = T)
plot(tdm90_16_17, term = freq.terms90_16_17, corThreshold = 0.1, weighting = T)

# sentiment analysis

stem_senti_df <- cbind(senti12_13,senti20_21$percent,senti30_12_13$percent,senti30_21_22$percent,senti90_16_17$percent,senti90_23_24$percent);
stem_senti_df[,2] <- NULL;
colnames(stem_senti_df) <- c("sentiment","0_12_13","0_20_21","30_12_13","30_21_22","90_16_17","90_23_24");
stem_senti <- melt(stem_senti_df,id.vars="sentiment");
ggplot(data=stem_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Topic Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=15))

stem_senti_df[1,2:ncol(stem_senti_df)] / stem_senti_df[2,2:ncol(stem_senti_df)] 

# event only
stem_event_senti_df <- cbind(senti20_21,senti30_21_22$percent,senti90_23_24$percent)
stem_event_senti_df[,2] <- NULL;
colnames(stem_event_senti_df) <- c("sentiment","0_20_21","30_21_22","90_23_24");
stem_event_senti <- melt(stem_event_senti_df,id.vars="sentiment");
ggplot(data=stem_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=15))

# no event only
stem_no_event_senti_df <- cbind(senti12_13,senti30_12_13$percent,senti90_16_17$percent)
stem_no_event_senti_df[,2] <- NULL;
colnames(stem_no_event_senti_df) <- c("sentiment","0_12_13","30_12_13","90_16_17");
stem_no_event_senti <- melt(stem_no_event_senti_df,id.vars="sentiment");
ggplot(data=stem_no_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=15))

# sentiment analysis (alternate)

ggplot() + geom_line(data=result12_13,aes(time,score,col='0_12_13')) + 
  geom_line(data=result20_21,aes(time,score,col='0_20_21')) + 
  geom_line(data=result30_12_13,aes(time,score,col='30_12_13')) +
  geom_line(data=result30_21_22,aes(time,score,col='30_21_22')) +
  geom_line(data=result90_16_17,aes(time,score,col='90_16_17')) +
  geom_line(data=result90_23_24,aes(time,score,col='90_23_24')) + 
  scale_colour_manual("", 
                     breaks = c("0_12_13","0_20_21","30_12_13","30_21_22","90_16_17","90_23_24"),
                     values = c("red", "green", "blue","orange","black","yellow")) +
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

ggplot() + geom_line(data=result12_13,aes(time,score,col='no-event')) + 
  geom_line(data=result20_21,aes(time,score,col='event')) + 
  #scale_colour_manual("", breaks = c("a","h"), values = c("blue", "red")) +
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")



