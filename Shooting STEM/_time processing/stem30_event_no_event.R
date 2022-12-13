library(ggplot2)
library(lubridate)
library(reshape2)

stem30_11 <- read.csv(file="Shooting STEM/stem30/stem_30_11_2.csv",header=TRUE);
# stem30_12_13 <- read.csv(file="Shooting STEM/stem30/stem30_12_13.csv",header=TRUE);
# stem30_13_14 <- read.csv(file="Shooting STEM/stem30/stem30_13_14.csv",header=TRUE);
# stem30_14_15 <- read.csv(file="Shooting STEM/stem30/stem30_14_15.csv",header=TRUE);
# stem30_15_16 <- read.csv(file="Shooting STEM/stem30/stem30_15_16.csv",header=TRUE);
# stem30_16_17 <- read.csv(file="Shooting STEM/stem30/stem30_16_17.csv",header=TRUE);
# stem30_17_18 <- read.csv(file="Shooting STEM/stem30/stem30_17_18.csv",header=TRUE);
# stem30_18_19 <- read.csv(file="Shooting STEM/stem30/stem30_18_19.csv",header=TRUE);
# stem30_19_20 <- read.csv(file="Shooting STEM/stem30/stem30_19_20.csv",header=TRUE);
# stem30_20_21 <- read.csv(file="Shooting STEM/stem30/stem30_20_21.csv",header=TRUE);
# stem30_21_22 <- read.csv(file="Shooting STEM/stem30/stem30_21_22.csv",header=TRUE);
# stem30_22_23 <- read.csv(file="Shooting STEM/stem30/stem30_22_23.csv",header=TRUE);
# stem30_23_24 <- read.csv(file="Shooting STEM/stem30/stem30_23_24.csv",header=TRUE);
# stem30_24_25 <- read.csv(file="Shooting STEM/stem30/stem30_24_25.csv",header=TRUE);
# stem30_25_26 <- read.csv(file="Shooting STEM/stem30/stem30_25_26.csv",header=TRUE);
# stem30_26_27 <- read.csv(file="Shooting STEM/stem30/stem30_26_27.csv",header=TRUE);

stem30_12_13 <- read.csv(file="Shooting STEM/stem30/stem_30_12_2.csv",header=TRUE);
stem30_13_14 <- read.csv(file="Shooting STEM/stem30/stem_30_13_2.csv",header=TRUE);
stem30_14_15 <- read.csv(file="Shooting STEM/stem30/stem_30_14_2.csv",header=TRUE);
stem30_15_16 <- read.csv(file="Shooting STEM/stem30/stem_30_15_2.csv",header=TRUE);
stem30_16_17 <- read.csv(file="Shooting STEM/stem30/stem_30_16_2.csv",header=TRUE);
stem30_17_18 <- read.csv(file="Shooting STEM/stem30/stem_30_17_2.csv",header=TRUE);
stem30_18_19 <- read.csv(file="Shooting STEM/stem30/stem_30_18_2.csv",header=TRUE);
stem30_19_20 <- read.csv(file="Shooting STEM/stem30/stem_30_19_2.csv",header=TRUE);
stem30_20_21 <- read.csv(file="Shooting STEM/stem30/stem_30_20_2.csv",header=TRUE);
stem30_21_22 <- read.csv(file="Shooting STEM/stem30/stem_30_21_2.csv",header=TRUE);
stem30_22_23 <- read.csv(file="Shooting STEM/stem30/stem_30_22_2.csv",header=TRUE);
stem30_23_24 <- read.csv(file="Shooting STEM/stem30/stem_30_23_2.csv",header=TRUE);
stem30_24_25 <- read.csv(file="Shooting STEM/stem30/stem_30_24_2.csv",header=TRUE);
stem30_25_26 <- read.csv(file="Shooting STEM/stem30/stem_30_25_2.csv",header=TRUE);
stem30_26_27 <- read.csv(file="Shooting STEM/stem30/stem_30_26_2.csv",header=TRUE);
stem30_27_28 <- read.csv(file="Shooting STEM/stem30/stem_30_27_2.csv",header=TRUE);

event_time_stem <- strptime("2019-05-07 13:53:00","%Y-%m-%d %H:%M:%S");
whrs <- 3; wmins <- 0;

event_tweets <- function(event_time,win_hrs,win_min,tweet_df)  {
  del_time <- event_time + win_hrs*60*60 + win_min*60;
  ev_tweets <- subset(tweet_df, as.POSIXct(tweet_df$created) > as.POSIXct(event_time) & as.POSIXct(tweet_df$created) < as.POSIXct(del_time));
  return(nrow(ev_tweets))
}

nevent_tweets <- function(event_time,win_hrs,win_min,tweet_df)  {
  del_time <- event_time - win_hrs*60*60 - win_min*60;
  nev_tweets <- subset(tweet_df, as.POSIXct(tweet_df$created) > as.POSIXct(del_time) & as.POSIXct(tweet_df$created) < as.POSIXct(event_time));
  return(nrow(nev_tweets))
}

ev_stem30_11 <- event_tweets(event_time_stem,whrs,wmins,stem30_11);
ev_stem30_12_13 <- event_tweets(event_time_stem,whrs,wmins,stem30_12_13);
ev_stem30_13_14 <- event_tweets(event_time_stem,whrs,wmins,stem30_13_14);
ev_stem30_14_15 <- event_tweets(event_time_stem,whrs,wmins,stem30_14_15);
ev_stem30_15_16 <- event_tweets(event_time_stem,whrs,wmins,stem30_15_16);
ev_stem30_16_17 <- event_tweets(event_time_stem,whrs,wmins,stem30_16_17);
ev_stem30_17_18 <- event_tweets(event_time_stem,whrs,wmins,stem30_17_18);
ev_stem30_18_19 <- event_tweets(event_time_stem,whrs,wmins,stem30_18_19);
ev_stem30_19_20 <- event_tweets(event_time_stem,whrs,wmins,stem30_19_20);
ev_stem30_20_21 <- event_tweets(event_time_stem,whrs,wmins,stem30_20_21);
ev_stem30_21_22 <- event_tweets(event_time_stem,whrs,wmins,stem30_21_22);
ev_stem30_22_23 <- event_tweets(event_time_stem,whrs,wmins,stem30_22_23);
ev_stem30_23_24 <- event_tweets(event_time_stem,whrs,wmins,stem30_23_24);
ev_stem30_24_25 <- event_tweets(event_time_stem,whrs,wmins,stem30_24_25);
ev_stem30_25_26 <- event_tweets(event_time_stem,whrs,wmins,stem30_25_26);
ev_stem30_26_27 <- event_tweets(event_time_stem,whrs,wmins,stem30_26_27);
ev_stem30_27_28 <- event_tweets(event_time_stem,whrs,wmins,stem30_27_28);

nev_stem30_11 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_11);
nev_stem30_12_13 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_12_13);
nev_stem30_13_14 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_13_14);
nev_stem30_14_15 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_14_15);
nev_stem30_15_16 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_15_16);
nev_stem30_16_17 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_16_17);
nev_stem30_17_18 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_17_18);
nev_stem30_18_19 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_18_19);
nev_stem30_19_20 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_19_20);
nev_stem30_20_21 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_20_21);
nev_stem30_21_22 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_21_22);
nev_stem30_22_23 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_22_23);
nev_stem30_23_24 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_23_24);
nev_stem30_24_25 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_24_25);
nev_stem30_25_26 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_25_26);
nev_stem30_26_27 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_26_27);
nev_stem30_27_28 <- nevent_tweets(event_time_stem,whrs,wmins,stem30_27_28);

stem30_temp1 <- rbind(nrow(stem30_11),nrow(stem30_12_13),nrow(stem30_13_14),nrow(stem30_14_15),nrow(stem30_15_16),nrow(stem30_16_17),nrow(stem30_17_18),
                     nrow(stem30_18_19),nrow(stem30_19_20),nrow(stem30_20_21),nrow(stem30_21_22),nrow(stem30_22_23),nrow(stem30_23_24),
                     nrow(stem30_24_25),nrow(stem30_25_26),nrow(stem30_26_27),nrow(stem30_27_28));
stem30_temp2 <- rbind(ev_stem30_11,ev_stem30_12_13,ev_stem30_13_14,ev_stem30_14_15,ev_stem30_15_16,ev_stem30_16_17,ev_stem30_17_18,ev_stem30_18_19,
                     ev_stem30_19_20,ev_stem30_20_21,ev_stem30_21_22,ev_stem30_22_23,ev_stem30_23_24,ev_stem30_24_25,ev_stem30_25_26,ev_stem30_26_27,
                     ev_stem30_27_28);
stem30_temp3 <- rbind(nev_stem30_11,nev_stem30_12_13,nev_stem30_13_14,nev_stem30_14_15,nev_stem30_15_16,nev_stem30_16_17,nev_stem30_17_18,nev_stem30_18_19,
                     nev_stem30_19_20,nev_stem30_20_21,nev_stem30_21_22,nev_stem30_22_23,nev_stem30_23_24,nev_stem30_24_25,nev_stem30_25_26,nev_stem30_26_27,
                     nev_stem30_27_28);

stem30_rownames_char <- c('1.1','1.2-1.3','1.3-1.4','1.4-1.5','1.5-1.6','1.6-1.7','1.7-1.8','1.8-1.9',
                         '1.9-2.0','2.0-2.1','2.1-2.2','2.2-2.3','2.3-2.4','2.4-2.5','2.5-2.6','2.6-2.7');
stem30_rownames <- seq(1.1,2.7,by=0.1);
stem30_event <- data.frame(cbind(stem30_rownames,stem30_temp1,stem30_temp2,stem30_temp3));
rownames(stem30_event) <- NULL;
colnames(stem30_event) <- c('Layer','Total','Post-Event','Pre-Event');
stem30_subset1 <- stem30_event;
stem30_subset1$Total <- NULL;
write.csv(stem30_event,"stem30_event_3.csv")

stem30_event_melt <- melt(stem30_event,id.vars='Layer');

ggplot(stem30_event_melt, aes(Layer,value, col=variable)) + geom_line(size=1.5) + 
  geom_point(size=4) + 
  scale_x_continuous(breaks=seq(1.1,2.7,by=0.1),
                     labels=stem30_rownames) +
  theme(plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=15),axis.title=element_text(size=14,face="bold")) 










