# virg similarity result summary
library("gridExtra")

# topic analysis

df_virg_topic <- rbind(df4_13_14,df4_16_17,df3_17_18,df3_19_20,df3_22_23,df2_15_16,df2_17_18,df0_16_17);

ggplot(data=df_virg_topic, aes(x=term, y=freq, fill=ind)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Topic Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=15))

# word cloud
# event
plot(tdm4_16_17, term = freq.terms4_16_17, corThreshold = 0.1, weighting = T)
plot(tdm3_19_20, term = freq.terms3_19_20, corThreshold = 0.1, weighting = T)
plot(tdm2_17_18, term = freq.terms2_17_18, corThreshold = 0.1, weighting = T)
plot(tdm0_16_17, term = freq.terms0_16_17, corThreshold = 0.1, weighting = T)
# non-event
plot(tdm4_13_14, term = freq.terms4_13_14, corThreshold = 0.1, weighting = T)
plot(tdm3_17_18, term = freq.terms3_17_18, corThreshold = 0.1, weighting = T)
plot(tdm3_22_23, term = freq.terms3_22_23, corThreshold = 0.1, weighting = T)
plot(tdm2_15_16, term = freq.terms2_15_16, corThreshold = 0.1, weighting = T)

# sentiment analysis

virg_senti_df <- cbind(senti4_13_14,senti4_16_17$percent,senti3_17_18$percent,senti3_19_20$percent,senti3_22_23$percent,
                       senti2_15_16$percent,senti2_17_18$percent,senti0_16_17$percent)
virg_senti_df[,2] <- NULL;
colnames(virg_senti_df) <- c("sentiment","4_13_14","4_16_17","3_17_18","3_19_20","3_22_23","2_15_16","2_17_18","0_16_17");
virg_senti <- melt(virg_senti_df,id.vars="sentiment");
ggplot(data=virg_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=15))

virg_senti_df[1,2:ncol(virg_senti_df)] / virg_senti_df[2,2:ncol(virg_senti_df)]

# event only
virg_event_senti_df <- cbind(senti4_16_17,senti3_19_20$percent,senti2_17_18$percent,senti0_16_17$percent)
virg_event_senti_df[,2] <- NULL;
colnames(virg_event_senti_df) <- c("sentiment","4_16_17","3_19_20","2_17_18","0_16_17");
virg_event_senti <- melt(virg_event_senti_df,id.vars="sentiment");
ggplot(data=virg_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=7))

# no event only
virg_no_event_senti_df <- cbind(senti4_13_14,senti3_17_18$percent,senti3_22_23$percent,senti2_15_16$percent)
virg_no_event_senti_df[,2] <- NULL;
colnames(virg_no_event_senti_df) <- c("sentiment","4_13_14","3_17_18","3_22_23","2_15_16");
virg_no_event_senti <- melt(virg_no_event_senti_df,id.vars="sentiment");
ggplot(data=virg_no_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=7))

# sentiment analysis (alternate)

ggplot() + geom_line(data=result4_13_14,aes(time,score,col='4_13_14')) + 
  geom_line(data=result4_16_17,aes(time,score,col='4_16_17')) + 
  geom_line(data=result3_17_18,aes(time,score,col='3_17_18')) +
  geom_line(data=result3_19_20,aes(time,score,col='3_19_20')) +
  geom_line(data=result3_22_23,aes(time,score,col='3_22_23')) +
  geom_line(data=result2_15_16,aes(time,score,col='2_15_16')) +
  geom_line(data=result2_17_18,aes(time,score,col='2_17_18')) +
  # geom_line(data=result0_16_17,aes(time,score,col='0_16_17')) +
  scale_colour_manual("", 
                      breaks = c("4_13_14","4_16_17","3_17_18","3_19_20","3_22_23","2_15_16","2_17_18"),
                      values = c("red", "green", "blue","orange","black","yellow","magenta")) +
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

ggplot(result0_16_17,aes(time,score)) + geom_line() + scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")

ggplot() + geom_line(data=result4_13_14,aes(time,score,col='no-event')) + 
  geom_line(data=result4_16_17,aes(time,score,col='event')) + 
  #scale_colour_manual("", breaks = c("a","h"), values = c("blue", "red")) +
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D")
