library(ggplot2)
library(lubridate)
library(reshape2)

stem180_11 <- read.csv(file="Shooting STEM/stem180/stem_180_11_2.csv",header=TRUE);
# stem180_12_13 <- read.csv(file="Shooting STEM/stem180/stem180_12_13.csv",header=TRUE);
# stem180_13_14 <- read.csv(file="Shooting STEM/stem180/stem180_13_14.csv",header=TRUE);
# stem180_14_15 <- read.csv(file="Shooting STEM/stem180/stem180_14_15.csv",header=TRUE);
# stem180_15_16 <- read.csv(file="Shooting STEM/stem180/stem180_15_16.csv",header=TRUE);
# stem180_16_17 <- read.csv(file="Shooting STEM/stem180/stem180_16_17.csv",header=TRUE);
# stem180_17_18 <- read.csv(file="Shooting STEM/stem180/stem180_17_18.csv",header=TRUE);
# stem180_18_19 <- read.csv(file="Shooting STEM/stem180/stem180_18_19.csv",header=TRUE);
# stem180_19_20 <- read.csv(file="Shooting STEM/stem180/stem180_19_20.csv",header=TRUE);
# stem180_20_21 <- read.csv(file="Shooting STEM/stem180/stem180_20_21.csv",header=TRUE);
# stem180_21_22 <- read.csv(file="Shooting STEM/stem180/stem180_21_22.csv",header=TRUE);
# stem180_22_23 <- read.csv(file="Shooting STEM/stem180/stem180_22_23.csv",header=TRUE);
# stem180_23_24 <- read.csv(file="Shooting STEM/stem180/stem180_23_24.csv",header=TRUE);
# stem180_24_25 <- read.csv(file="Shooting STEM/stem180/stem180_24_25.csv",header=TRUE);
# stem180_25_26 <- read.csv(file="Shooting STEM/stem180/stem180_25_26.csv",header=TRUE);
# stem180_26_27 <- read.csv(file="Shooting STEM/stem180/stem180_26_27.csv",header=TRUE);

stem180_12_13 <- read.csv(file="Shooting STEM/stem180/stem_180_12_2.csv",header=TRUE);
stem180_13_14 <- read.csv(file="Shooting STEM/stem180/stem_180_13_2.csv",header=TRUE);
stem180_14_15 <- read.csv(file="Shooting STEM/stem180/stem_180_13_2.csv",header=TRUE);
stem180_15_16 <- read.csv(file="Shooting STEM/stem180/stem_180_15_2.csv",header=TRUE);
stem180_16_17 <- read.csv(file="Shooting STEM/stem180/stem_180_16_2.csv",header=TRUE);
stem180_17_18 <- read.csv(file="Shooting STEM/stem180/stem_180_17_2.csv",header=TRUE);
stem180_18_19 <- read.csv(file="Shooting STEM/stem180/stem_180_18_2.csv",header=TRUE);
stem180_19_20 <- read.csv(file="Shooting STEM/stem180/stem_180_19_2.csv",header=TRUE);
stem180_20_21 <- read.csv(file="Shooting STEM/stem180/stem_180_20_2.csv",header=TRUE);
stem180_21_22 <- read.csv(file="Shooting STEM/stem180/stem_180_21_2.csv",header=TRUE);
stem180_22_23 <- read.csv(file="Shooting STEM/stem180/stem_180_22_2.csv",header=TRUE);
stem180_23_24 <- read.csv(file="Shooting STEM/stem180/stem_180_23_2.csv",header=TRUE);
stem180_24_25 <- read.csv(file="Shooting STEM/stem180/stem_180_24_2.csv",header=TRUE);
stem180_25_26 <- read.csv(file="Shooting STEM/stem180/stem_180_25_2.csv",header=TRUE);
stem180_26_27 <- read.csv(file="Shooting STEM/stem180/stem_180_26_2.csv",header=TRUE);
stem180_27_28 <- read.csv(file="Shooting STEM/stem180/stem_180_26_2.csv",header=TRUE);

event_time_stem <- strptime("2019-05-07 13:53:00","%Y-%m-%d %H:%M:%S");
whrs <- 24; wmins <- 0;

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

ev_stem180_11 <- event_tweets(event_time_stem,whrs,wmins,stem180_11);
ev_stem180_12_13 <- event_tweets(event_time_stem,whrs,wmins,stem180_12_13);
ev_stem180_13_14 <- event_tweets(event_time_stem,whrs,wmins,stem180_13_14);
ev_stem180_14_15 <- event_tweets(event_time_stem,whrs,wmins,stem180_14_15);
ev_stem180_15_16 <- event_tweets(event_time_stem,whrs,wmins,stem180_15_16);
ev_stem180_16_17 <- event_tweets(event_time_stem,whrs,wmins,stem180_16_17);
ev_stem180_17_18 <- event_tweets(event_time_stem,whrs,wmins,stem180_17_18);
ev_stem180_18_19 <- event_tweets(event_time_stem,whrs,wmins,stem180_18_19);
ev_stem180_19_20 <- event_tweets(event_time_stem,whrs,wmins,stem180_19_20);
ev_stem180_20_21 <- event_tweets(event_time_stem,whrs,wmins,stem180_20_21);
ev_stem180_21_22 <- event_tweets(event_time_stem,whrs,wmins,stem180_21_22);
ev_stem180_22_23 <- event_tweets(event_time_stem,whrs,wmins,stem180_22_23);
ev_stem180_23_24 <- event_tweets(event_time_stem,whrs,wmins,stem180_23_24);
ev_stem180_24_25 <- event_tweets(event_time_stem,whrs,wmins,stem180_24_25);
ev_stem180_25_26 <- event_tweets(event_time_stem,whrs,wmins,stem180_25_26);
ev_stem180_26_27 <- event_tweets(event_time_stem,whrs,wmins,stem180_26_27);
ev_stem180_27_28 <- event_tweets(event_time_stem,whrs,wmins,stem180_27_28);

nev_stem180_11 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_11);
nev_stem180_12_13 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_12_13);
nev_stem180_13_14 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_13_14);
nev_stem180_14_15 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_14_15);
nev_stem180_15_16 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_15_16);
nev_stem180_16_17 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_16_17);
nev_stem180_17_18 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_17_18);
nev_stem180_18_19 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_18_19);
nev_stem180_19_20 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_19_20);
nev_stem180_20_21 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_20_21);
nev_stem180_21_22 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_21_22);
nev_stem180_22_23 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_22_23);
nev_stem180_23_24 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_23_24);
nev_stem180_24_25 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_24_25);
nev_stem180_25_26 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_25_26);
nev_stem180_26_27 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_26_27);
nev_stem180_27_28 <- nevent_tweets(event_time_stem,whrs,wmins,stem180_27_28);

stem180_temp1 <- rbind(nrow(stem180_11),nrow(stem180_12_13),nrow(stem180_13_14),nrow(stem180_14_15),nrow(stem180_15_16),nrow(stem180_16_17),nrow(stem180_17_18),
                      nrow(stem180_18_19),nrow(stem180_19_20),nrow(stem180_20_21),nrow(stem180_21_22),nrow(stem180_22_23),nrow(stem180_23_24),
                      nrow(stem180_24_25),nrow(stem180_25_26),nrow(stem180_26_27),nrow(stem180_27_28));
stem180_temp2 <- rbind(ev_stem180_11,ev_stem180_12_13,ev_stem180_13_14,ev_stem180_14_15,ev_stem180_15_16,ev_stem180_16_17,ev_stem180_17_18,ev_stem180_18_19,
                      ev_stem180_19_20,ev_stem180_20_21,ev_stem180_21_22,ev_stem180_22_23,ev_stem180_23_24,ev_stem180_24_25,ev_stem180_25_26,ev_stem180_26_27,
                      ev_stem180_27_28);
stem180_temp3 <- rbind(nev_stem180_11,nev_stem180_12_13,nev_stem180_13_14,nev_stem180_14_15,nev_stem180_15_16,nev_stem180_16_17,nev_stem180_17_18,nev_stem180_18_19,
                      nev_stem180_19_20,nev_stem180_20_21,nev_stem180_21_22,nev_stem180_22_23,nev_stem180_23_24,nev_stem180_24_25,nev_stem180_25_26,nev_stem180_26_27,
                      nev_stem180_27_28);

stem180_rownames_char <- c('1.1','1.2-1.3','1.3-1.4','1.4-1.5','1.5-1.6','1.6-1.7','1.7-1.8','1.8-1.9',
                          '1.9-2.0','2.0-2.1','2.1-2.2','2.2-2.3','2.3-2.4','2.4-2.5','2.5-2.6','2.6-2.7');
stem180_rownames <- seq(1.1,2.7,by=0.1);
stem180_event <- data.frame(cbind(stem180_rownames,stem180_temp1,stem180_temp2,stem180_temp3));
rownames(stem180_event) <- NULL;
colnames(stem180_event) <- c('Layer','Total','Post-Event','Pre-Event');
stem180_subset1 <- stem180_event;
stem180_subset1$Total <- NULL;
write.csv(stem180_event,"stem180_event_24.csv")


stem180_event_melt <- melt(stem180_event,id.vars='Layer');

ggplot(stem180_event_melt, aes(Layer,value, col=variable)) + geom_line(size=1.5) + 
  geom_point(size=4) + 
  scale_x_continuous(breaks=seq(1.1,2.7,by=0.1),
                     labels=stem180_rownames) +
  theme(plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=15),axis.title=element_text(size=14,face="bold")) 










