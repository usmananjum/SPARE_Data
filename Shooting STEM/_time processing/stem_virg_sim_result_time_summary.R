# virg similarity result summary
library("gridExtra")

# sentiment analysis - stem

stem_senti_time_df <- cbind(senti0_28e,senti0_28ne$percent,senti30_28e$percent,senti30_28ne$percent,senti90_27e$percent,senti90_27ne$percent);
stem_senti_time_df[,2] <- NULL;
colnames(stem_senti_time_df) <- c("sentiment","0_28e","0_28ne","30_28e","30_28ne","90_27e","90_27ne");
stem_senti <- melt(stem_senti_time_df,id.vars="sentiment");
ggplot(data=stem_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Topic Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=20))

# event only
stem_event_senti_time_df <- cbind(senti0_28e,senti30_28e$percent,senti90_27e$percent)
stem_event_senti_time_df[,2] <- NULL;
colnames(stem_event_senti_time_df) <- c("sentiment","0_28e","30_28e","90_27e");
stem_event_senti <- melt(stem_event_senti_time_df,id.vars="sentiment");
ggplot(data=stem_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=20))

# no event only
stem_no_event_senti_time_df <- cbind(senti0_28ne,senti30_28ne$percent,senti90_27ne$percent)
stem_no_event_senti_time_df[,2] <- NULL;
colnames(stem_no_event_senti_time_df) <- c("sentiment","0_28ne","30_28ne","90_27ne");
stem_no_event_senti <- melt(stem_no_event_senti_time_df,id.vars="sentiment");
ggplot(data=stem_no_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=20))

# sentiment analysis - virg

virg_senti_time_df <- cbind(senti0_28ve,senti0_28vne$percent,senti2_28ve$percent,senti2_28vne$percent,
                       senti3_28ve$percent,senti3_28vne$percent,senti4_28ve$percent,senti4_28vne$percent);
virg_senti_time_df[,2] <- NULL;
colnames(virg_senti_time_df) <- c("sentiment","0_28e","0_28ne","2_28e","2_28ne","3_27e","3_27ne","4_28e","4_28ne");
virg_senti <- melt(virg_senti_time_df,id.vars="sentiment");
ggplot(data=virg_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=20))

# event only
virg_event_senti_time_df <- cbind(senti0_28ve,senti2_28ve$percent,senti3_28ve$percent,senti4_28ve$percent)
virg_event_senti_time_df[,2] <- NULL;
colnames(virg_event_senti_time_df) <- c("sentiment","0_28e","2_28e","3_27e","4_27e");
virg_event_senti <- melt(virg_event_senti_time_df,id.vars="sentiment");
ggplot(data=virg_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=20))

# no event only
virg_no_event_senti_time_df <- cbind(senti0_28vne,senti2_28vne$percent,senti3_28vne$percent,senti4_28vne$percent)
virg_no_event_senti_time_df[,2] <- NULL;
colnames(virg_no_event_senti_time_df) <- c("sentiment","0_28ne","2_28ne","3_27ne","4_27ne");
virg_no_event_senti <- melt(virg_no_event_senti_time_df,id.vars="sentiment");
ggplot(data=virg_no_event_senti, aes(x=sentiment, y=value, fill=variable)) + geom_bar(stat="identity", position=position_dodge()) + 
  xlab("Terms") + ylab("Count") + ggtitle("Sentiment Analysis") + 
  coord_flip() + theme(axis.text=element_text(size=20))

virg_senti_time_df[1,2:ncol(virg_senti_time_df)]/virg_senti_time_df[2,2:ncol(virg_senti_time_df)] 

stem_senti_time_df[1,2:ncol(stem_senti_time_df)]/stem_senti_time_df[2,2:ncol(stem_senti_time_df)] 

