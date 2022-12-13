library(ggplot2)
library(lubridate)
library(reshape2)

virg4_11 <- read.csv(file="Shooting virg/virg4/virg_270_11_2.csv",header=TRUE);
# virg4_12_13 <- read.csv(file="Shooting virg/virg4/virg4_12_13.csv",header=TRUE);
# virg4_13_14 <- read.csv(file="Shooting virg/virg4/virg4_13_14.csv",header=TRUE);
# virg4_14_15 <- read.csv(file="Shooting virg/virg4/virg4_14_15.csv",header=TRUE);
# virg4_15_16 <- read.csv(file="Shooting virg/virg4/virg4_15_16.csv",header=TRUE);
# virg4_16_17 <- read.csv(file="Shooting virg/virg4/virg4_16_17.csv",header=TRUE);
# virg4_17_18 <- read.csv(file="Shooting virg/virg4/virg4_17_18.csv",header=TRUE);
# virg4_18_19 <- read.csv(file="Shooting virg/virg4/virg4_18_19.csv",header=TRUE);
# virg4_19_20 <- read.csv(file="Shooting virg/virg4/virg4_19_20.csv",header=TRUE);
# virg4_20_21 <- read.csv(file="Shooting virg/virg4/virg4_20_21.csv",header=TRUE);
# virg4_21_22 <- read.csv(file="Shooting virg/virg4/virg4_21_22.csv",header=TRUE);
# virg4_22_23 <- read.csv(file="Shooting virg/virg4/virg4_22_23.csv",header=TRUE);
# virg4_23_24 <- read.csv(file="Shooting virg/virg4/virg4_23_24.csv",header=TRUE);
# virg4_24_25 <- read.csv(file="Shooting virg/virg4/virg4_24_25.csv",header=TRUE);
# virg4_25_26 <- read.csv(file="Shooting virg/virg4/virg4_25_26.csv",header=TRUE);
# virg4_26_27 <- read.csv(file="Shooting virg/virg4/virg4_26_27.csv",header=TRUE);

virg4_12_13 <- read.csv(file="Shooting virg/virg4/virg_270_12_2.csv",header=TRUE);
virg4_13_14 <- read.csv(file="Shooting virg/virg4/virg_270_13_2.csv",header=TRUE);
virg4_14_15 <- read.csv(file="Shooting virg/virg4/virg_270_14_2.csv",header=TRUE);
virg4_15_16 <- read.csv(file="Shooting virg/virg4/virg_270_15_2.csv",header=TRUE);
virg4_16_17 <- read.csv(file="Shooting virg/virg4/virg_270_16_2.csv",header=TRUE);
virg4_17_18 <- read.csv(file="Shooting virg/virg4/virg_270_17_2.csv",header=TRUE);
virg4_18_19 <- read.csv(file="Shooting virg/virg4/virg_270_18_2.csv",header=TRUE);
virg4_19_20 <- read.csv(file="Shooting virg/virg4/virg_270_19_2.csv",header=TRUE);
virg4_20_21 <- read.csv(file="Shooting virg/virg4/virg_270_20_2.csv",header=TRUE);
virg4_21_22 <- read.csv(file="Shooting virg/virg4/virg_270_21_2.csv",header=TRUE);
virg4_22_23 <- read.csv(file="Shooting virg/virg4/virg_270_22_2.csv",header=TRUE);
virg4_23_24 <- read.csv(file="Shooting virg/virg4/virg_270_23_2.csv",header=TRUE);
virg4_24_25 <- read.csv(file="Shooting virg/virg4/virg_270_24_2.csv",header=TRUE);
virg4_25_26 <- read.csv(file="Shooting virg/virg4/virg_270_25_2.csv",header=TRUE);
virg4_26_27 <- read.csv(file="Shooting virg/virg4/virg_270_26_2.csv",header=TRUE);
virg4_27_28 <- read.csv(file="Shooting virg/virg4/virg_270_27_2.csv",header=TRUE);
virg4_28_29 <- read.csv(file="Shooting virg/virg4/virg_270_28_2.csv",header=TRUE);

event_time_virg <- strptime("2019-05-31 16:44:00","%Y-%m-%d %H:%M:%S");
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

ev_virg4_11 <- event_tweets(event_time_virg,whrs,wmins,virg4_11);
ev_virg4_12_13 <- event_tweets(event_time_virg,whrs,wmins,virg4_12_13);
ev_virg4_13_14 <- event_tweets(event_time_virg,whrs,wmins,virg4_13_14);
ev_virg4_14_15 <- event_tweets(event_time_virg,whrs,wmins,virg4_14_15);
ev_virg4_15_16 <- event_tweets(event_time_virg,whrs,wmins,virg4_15_16);
ev_virg4_16_17 <- event_tweets(event_time_virg,whrs,wmins,virg4_16_17);
ev_virg4_17_18 <- event_tweets(event_time_virg,whrs,wmins,virg4_17_18);
ev_virg4_18_19 <- event_tweets(event_time_virg,whrs,wmins,virg4_18_19);
ev_virg4_19_20 <- event_tweets(event_time_virg,whrs,wmins,virg4_19_20);
ev_virg4_20_21 <- event_tweets(event_time_virg,whrs,wmins,virg4_20_21);
ev_virg4_21_22 <- event_tweets(event_time_virg,whrs,wmins,virg4_21_22);
ev_virg4_22_23 <- event_tweets(event_time_virg,whrs,wmins,virg4_22_23);
ev_virg4_23_24 <- event_tweets(event_time_virg,whrs,wmins,virg4_23_24);
ev_virg4_24_25 <- event_tweets(event_time_virg,whrs,wmins,virg4_24_25);
ev_virg4_25_26 <- event_tweets(event_time_virg,whrs,wmins,virg4_25_26);
ev_virg4_26_27 <- event_tweets(event_time_virg,whrs,wmins,virg4_26_27);
ev_virg4_27_28 <- event_tweets(event_time_virg,whrs,wmins,virg4_27_28);
ev_virg4_28_29 <- event_tweets(event_time_virg,whrs,wmins,virg4_28_29);

nev_virg4_11 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_11);
nev_virg4_12_13 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_12_13);
nev_virg4_13_14 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_13_14);
nev_virg4_14_15 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_14_15);
nev_virg4_15_16 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_15_16);
nev_virg4_16_17 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_16_17);
nev_virg4_17_18 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_17_18);
nev_virg4_18_19 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_18_19);
nev_virg4_19_20 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_19_20);
nev_virg4_20_21 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_20_21);
nev_virg4_21_22 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_21_22);
nev_virg4_22_23 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_22_23);
nev_virg4_23_24 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_23_24);
nev_virg4_24_25 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_24_25);
nev_virg4_25_26 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_25_26);
nev_virg4_26_27 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_26_27);
nev_virg4_27_28 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_27_28);
nev_virg4_28_29 <- nevent_tweets(event_time_virg,whrs,wmins,virg4_28_29);

virg4_temp1 <- rbind(nrow(virg4_11),nrow(virg4_12_13),nrow(virg4_13_14),nrow(virg4_14_15),nrow(virg4_15_16),nrow(virg4_16_17),nrow(virg4_17_18),
                     nrow(virg4_18_19),nrow(virg4_19_20),nrow(virg4_20_21),nrow(virg4_21_22),nrow(virg4_22_23),nrow(virg4_23_24),
                     nrow(virg4_24_25),nrow(virg4_25_26),nrow(virg4_26_27),nrow(virg4_27_28),nrow(virg4_28_29));
virg4_temp2 <- rbind(ev_virg4_11,ev_virg4_12_13,ev_virg4_13_14,ev_virg4_14_15,ev_virg4_15_16,ev_virg4_16_17,ev_virg4_17_18,ev_virg4_18_19,
                     ev_virg4_19_20,ev_virg4_20_21,ev_virg4_21_22,ev_virg4_22_23,ev_virg4_23_24,ev_virg4_24_25,ev_virg4_25_26,ev_virg4_26_27,
                     ev_virg4_27_28,ev_virg4_28_29);
virg4_temp3 <- rbind(nev_virg4_11,nev_virg4_12_13,nev_virg4_13_14,nev_virg4_14_15,nev_virg4_15_16,nev_virg4_16_17,nev_virg4_17_18,nev_virg4_18_19,
                     nev_virg4_19_20,nev_virg4_20_21,nev_virg4_21_22,nev_virg4_22_23,nev_virg4_23_24,nev_virg4_24_25,nev_virg4_25_26,nev_virg4_26_27,
                     nev_virg4_27_28,nev_virg4_28_29);

virg4_rownames_char <- c('1.1','1.2-1.3','1.3-1.4','1.4-1.5','1.5-1.6','1.6-1.7','1.7-1.8','1.8-1.9',
                         '1.9-2.0','2.0-2.1','2.1-2.2','2.2-2.3','2.3-2.4','2.4-2.5','2.5-2.6','2.6-2.7');
virg4_rownames <- seq(1.1,2.8,by=0.1);
virg4_event <- data.frame(cbind(virg4_rownames,virg4_temp1,virg4_temp2,virg4_temp3));
rownames(virg4_event) <- NULL;
colnames(virg4_event) <- c('Layer','Total','Post-Event','Pre-Event');
virg4_subset1 <- virg4_event;
virg4_subset1$Total <- NULL;
write.csv(virg4_event,"virg4_event_24.csv");

virg4_event_melt <- melt(virg4_event,id.vars='Layer');

ggplot(virg4_event_melt, aes(Layer,value, col=variable)) + geom_line(size=1.5) + 
  geom_point(size=4) + 
  scale_x_continuous(breaks=seq(1.1,2.8,by=0.1),
                     labels=virg4_rownames) +
  theme(plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=15),axis.title=element_text(size=14,face="bold")) 










