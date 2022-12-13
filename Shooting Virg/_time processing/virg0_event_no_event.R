library(ggplot2)
library(lubridate)
library(reshape2)

virg0_11 <- read.csv(file="Shooting virg/virg0/virg12_2.csv",header=TRUE);
# virg0_12_13 <- read.csv(file="Shooting virg/virg0/virg0_12_13.csv",header=TRUE);
# virg0_13_14 <- read.csv(file="Shooting virg/virg0/virg0_13_14.csv",header=TRUE);
# virg0_14_15 <- read.csv(file="Shooting virg/virg0/virg0_14_15.csv",header=TRUE);
# virg0_15_16 <- read.csv(file="Shooting virg/virg0/virg0_15_16.csv",header=TRUE);
# virg0_16_17 <- read.csv(file="Shooting virg/virg0/virg0_16_17.csv",header=TRUE);
# virg0_17_18 <- read.csv(file="Shooting virg/virg0/virg0_17_18.csv",header=TRUE);
# virg0_18_19 <- read.csv(file="Shooting virg/virg0/virg0_18_19.csv",header=TRUE);
# virg0_19_20 <- read.csv(file="Shooting virg/virg0/virg0_19_20.csv",header=TRUE);
# virg0_20_21 <- read.csv(file="Shooting virg/virg0/virg0_20_21.csv",header=TRUE);
# virg0_21_22 <- read.csv(file="Shooting virg/virg0/virg0_21_22.csv",header=TRUE);
# virg0_22_23 <- read.csv(file="Shooting virg/virg0/virg0_22_23.csv",header=TRUE);
# virg0_23_24 <- read.csv(file="Shooting virg/virg0/virg0_23_24.csv",header=TRUE);
# virg0_24_25 <- read.csv(file="Shooting virg/virg0/virg0_24_25.csv",header=TRUE);
# virg0_25_26 <- read.csv(file="Shooting virg/virg0/virg0_25_26.csv",header=TRUE);
# virg0_26_27 <- read.csv(file="Shooting virg/virg0/virg0_26_27.csv",header=TRUE);

virg0_12_13 <- read.csv(file="Shooting virg/virg0/virg12_2.csv",header=TRUE);
virg0_13_14 <- read.csv(file="Shooting virg/virg0/virg13_2.csv",header=TRUE);
virg0_14_15 <- read.csv(file="Shooting virg/virg0/virg14_2.csv",header=TRUE);
virg0_15_16 <- read.csv(file="Shooting virg/virg0/virg15_2.csv",header=TRUE);
virg0_16_17 <- read.csv(file="Shooting virg/virg0/virg16_2.csv",header=TRUE);
virg0_17_18 <- read.csv(file="Shooting virg/virg0/virg17_2.csv",header=TRUE);
virg0_18_19 <- read.csv(file="Shooting virg/virg0/virg18_2.csv",header=TRUE);
virg0_19_20 <- read.csv(file="Shooting virg/virg0/virg19_2.csv",header=TRUE);
virg0_20_21 <- read.csv(file="Shooting virg/virg0/virg20_2.csv",header=TRUE);
virg0_21_22 <- read.csv(file="Shooting virg/virg0/virg21_2.csv",header=TRUE);
virg0_22_23 <- read.csv(file="Shooting virg/virg0/virg22_2.csv",header=TRUE);
virg0_23_24 <- read.csv(file="Shooting virg/virg0/virg23_2.csv",header=TRUE);
virg0_24_25 <- read.csv(file="Shooting virg/virg0/virg24_2.csv",header=TRUE);
virg0_25_26 <- read.csv(file="Shooting virg/virg0/virg25_2.csv",header=TRUE);
virg0_26_27 <- read.csv(file="Shooting virg/virg0/virg26_2.csv",header=TRUE);
virg0_27_28 <- read.csv(file="Shooting virg/virg0/virg27_2.csv",header=TRUE);
virg0_28_29 <- read.csv(file="Shooting virg/virg0/virg28_2.csv",header=TRUE);

event_time_virg <- strptime("2019-05-31 16:44:00","%Y-%m-%d %H:%M:%S");
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

ev_virg0_11 <- event_tweets(event_time_virg,whrs,wmins,virg0_11);
ev_virg0_12_13 <- event_tweets(event_time_virg,whrs,wmins,virg0_12_13);
ev_virg0_13_14 <- event_tweets(event_time_virg,whrs,wmins,virg0_13_14);
ev_virg0_14_15 <- event_tweets(event_time_virg,whrs,wmins,virg0_14_15);
ev_virg0_15_16 <- event_tweets(event_time_virg,whrs,wmins,virg0_15_16);
ev_virg0_16_17 <- event_tweets(event_time_virg,whrs,wmins,virg0_16_17);
ev_virg0_17_18 <- event_tweets(event_time_virg,whrs,wmins,virg0_17_18);
ev_virg0_18_19 <- event_tweets(event_time_virg,whrs,wmins,virg0_18_19);
ev_virg0_19_20 <- event_tweets(event_time_virg,whrs,wmins,virg0_19_20);
ev_virg0_20_21 <- event_tweets(event_time_virg,whrs,wmins,virg0_20_21);
ev_virg0_21_22 <- event_tweets(event_time_virg,whrs,wmins,virg0_21_22);
ev_virg0_22_23 <- event_tweets(event_time_virg,whrs,wmins,virg0_22_23);
ev_virg0_23_24 <- event_tweets(event_time_virg,whrs,wmins,virg0_23_24);
ev_virg0_24_25 <- event_tweets(event_time_virg,whrs,wmins,virg0_24_25);
ev_virg0_25_26 <- event_tweets(event_time_virg,whrs,wmins,virg0_25_26);
ev_virg0_26_27 <- event_tweets(event_time_virg,whrs,wmins,virg0_26_27);
ev_virg0_27_28 <- event_tweets(event_time_virg,whrs,wmins,virg0_27_28);
ev_virg0_28_29 <- event_tweets(event_time_virg,whrs,wmins,virg0_28_29);

nev_virg0_11 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_11);
nev_virg0_12_13 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_12_13);
nev_virg0_13_14 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_13_14);
nev_virg0_14_15 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_14_15);
nev_virg0_15_16 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_15_16);
nev_virg0_16_17 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_16_17);
nev_virg0_17_18 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_17_18);
nev_virg0_18_19 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_18_19);
nev_virg0_19_20 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_19_20);
nev_virg0_20_21 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_20_21);
nev_virg0_21_22 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_21_22);
nev_virg0_22_23 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_22_23);
nev_virg0_23_24 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_23_24);
nev_virg0_24_25 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_24_25);
nev_virg0_25_26 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_25_26);
nev_virg0_26_27 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_26_27);
nev_virg0_27_28 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_27_28);
nev_virg0_28_29 <- nevent_tweets(event_time_virg,whrs,wmins,virg0_28_29);

virg0_temp1 <- rbind(nrow(virg0_11),nrow(virg0_12_13),nrow(virg0_13_14),nrow(virg0_14_15),nrow(virg0_15_16),nrow(virg0_16_17),nrow(virg0_17_18),
                     nrow(virg0_18_19),nrow(virg0_19_20),nrow(virg0_20_21),nrow(virg0_21_22),nrow(virg0_22_23),nrow(virg0_23_24),
                     nrow(virg0_24_25),nrow(virg0_25_26),nrow(virg0_26_27),nrow(virg0_27_28),nrow(virg0_28_29));
virg0_temp2 <- rbind(ev_virg0_11,ev_virg0_12_13,ev_virg0_13_14,ev_virg0_14_15,ev_virg0_15_16,ev_virg0_16_17,ev_virg0_17_18,ev_virg0_18_19,
                     ev_virg0_19_20,ev_virg0_20_21,ev_virg0_21_22,ev_virg0_22_23,ev_virg0_23_24,ev_virg0_24_25,ev_virg0_25_26,ev_virg0_26_27,
                     ev_virg0_27_28,ev_virg0_28_29);
virg0_temp3 <- rbind(nev_virg0_11,nev_virg0_12_13,nev_virg0_13_14,nev_virg0_14_15,nev_virg0_15_16,nev_virg0_16_17,nev_virg0_17_18,nev_virg0_18_19,
                     nev_virg0_19_20,nev_virg0_20_21,nev_virg0_21_22,nev_virg0_22_23,nev_virg0_23_24,nev_virg0_24_25,nev_virg0_25_26,nev_virg0_26_27,
                     nev_virg0_27_28,nev_virg0_28_29);

virg0_rownames_char <- c('1.1','1.2-1.3','1.3-1.4','1.4-1.5','1.5-1.6','1.6-1.7','1.7-1.8','1.8-1.9',
                         '1.9-2.0','2.0-2.1','2.1-2.2','2.2-2.3','2.3-2.4','2.4-2.5','2.5-2.6','2.6-2.7');
virg0_rownames <- seq(1.1,2.8,by=0.1);
virg0_event <- data.frame(cbind(virg0_rownames,virg0_temp1,virg0_temp2,virg0_temp3));
rownames(virg0_event) <- NULL;
colnames(virg0_event) <- c('Layer','Total','Post-Event','Pre-Event');
virg0_subset1 <- virg0_event;
virg0_subset1$Total <- NULL;
write.csv(virg0_event,"virg0_event_3.csv");

virg0_event_melt <- melt(virg0_event,id.vars='Layer');

ggplot(virg0_event_melt, aes(Layer,value, col=variable)) + geom_line(size=1.5) + 
  geom_point(size=4) + 
  scale_x_continuous(breaks=seq(1.1,2.8,by=0.1),
                     labels=virg0_rownames) +
  theme(plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=15),axis.title=element_text(size=14,face="bold")) 










