library(ggplot2)
library(lubridate)
library(reshape2)

gar0_11 <- read.csv(file="Garlic_fest/gar0/gar11_2.csv",header=TRUE);
gar0_12_13 <- read.csv(file="Garlic_fest/gar0/gar12_2.csv",header=TRUE);
gar0_13_14 <- read.csv(file="Garlic_fest/gar0/gar13_2.csv",header=TRUE);
gar0_14_15 <- read.csv(file="Garlic_fest/gar0/gar14_2.csv",header=TRUE);
gar0_15_16 <- read.csv(file="Garlic_fest/gar0/gar15_2.csv",header=TRUE);
gar0_16_17 <- read.csv(file="Garlic_fest/gar0/gar16_2.csv",header=TRUE);
gar0_17_18 <- read.csv(file="Garlic_fest/gar0/gar17_2.csv",header=TRUE);
gar0_18_19 <- read.csv(file="Garlic_fest/gar0/gar18_2.csv",header=TRUE);
gar0_19_20 <- read.csv(file="Garlic_fest/gar0/gar19_2.csv",header=TRUE);
gar0_20_21 <- read.csv(file="Garlic_fest/gar0/gar20_2.csv",header=TRUE);
gar0_21_22 <- read.csv(file="Garlic_fest/gar0/gar21_2.csv",header=TRUE);
gar0_22_23 <- read.csv(file="Garlic_fest/gar0/gar22_2.csv",header=TRUE);
gar0_23_24 <- read.csv(file="Garlic_fest/gar0/gar23_2.csv",header=TRUE);
gar0_24_25 <- read.csv(file="Garlic_fest/gar0/gar24_2.csv",header=TRUE);
gar0_25_26 <- read.csv(file="Garlic_fest/gar0/gar25_2.csv",header=TRUE);
gar0_26_27 <- read.csv(file="Garlic_fest/gar0/gar26_2.csv",header=TRUE);
gar0_27_28 <- read.csv(file="Garlic_fest/gar0/gar27_2.csv",header=TRUE);
gar0_28_29 <- read.csv(file="Garlic_fest/gar0/gar28_2.csv",header=TRUE);

event_time_gar <- strptime("2019-07-28 17:40:00","%Y-%m-%d %H:%M:%S");
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

ev_gar0_11 <- event_tweets(event_time_gar,whrs,wmins,gar0_11);
ev_gar0_12_13 <- event_tweets(event_time_gar,whrs,wmins,gar0_12_13);
ev_gar0_13_14 <- event_tweets(event_time_gar,whrs,wmins,gar0_13_14);
ev_gar0_14_15 <- event_tweets(event_time_gar,whrs,wmins,gar0_14_15);
ev_gar0_15_16 <- event_tweets(event_time_gar,whrs,wmins,gar0_15_16);
ev_gar0_16_17 <- event_tweets(event_time_gar,whrs,wmins,gar0_16_17);
ev_gar0_17_18 <- event_tweets(event_time_gar,whrs,wmins,gar0_17_18);
ev_gar0_18_19 <- event_tweets(event_time_gar,whrs,wmins,gar0_18_19);
ev_gar0_19_20 <- event_tweets(event_time_gar,whrs,wmins,gar0_19_20);
ev_gar0_20_21 <- event_tweets(event_time_gar,whrs,wmins,gar0_20_21);
ev_gar0_21_22 <- event_tweets(event_time_gar,whrs,wmins,gar0_21_22);
ev_gar0_22_23 <- event_tweets(event_time_gar,whrs,wmins,gar0_22_23);
ev_gar0_23_24 <- event_tweets(event_time_gar,whrs,wmins,gar0_23_24);
ev_gar0_24_25 <- event_tweets(event_time_gar,whrs,wmins,gar0_24_25);
ev_gar0_25_26 <- event_tweets(event_time_gar,whrs,wmins,gar0_25_26);
ev_gar0_26_27 <- event_tweets(event_time_gar,whrs,wmins,gar0_26_27);
ev_gar0_27_28 <- event_tweets(event_time_gar,whrs,wmins,gar0_27_28);

nev_gar0_11 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_11);
nev_gar0_12_13 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_12_13);
nev_gar0_13_14 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_13_14);
nev_gar0_14_15 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_14_15);
nev_gar0_15_16 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_15_16);
nev_gar0_16_17 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_16_17);
nev_gar0_17_18 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_17_18);
nev_gar0_18_19 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_18_19);
nev_gar0_19_20 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_19_20);
nev_gar0_20_21 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_20_21);
nev_gar0_21_22 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_21_22);
nev_gar0_22_23 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_22_23);
nev_gar0_23_24 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_23_24);
nev_gar0_24_25 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_24_25);
nev_gar0_25_26 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_25_26);
nev_gar0_26_27 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_26_27);
nev_gar0_27_28 <- nevent_tweets(event_time_gar,whrs,wmins,gar0_27_28);

gar0_temp1 <- rbind(nrow(gar0_11),nrow(gar0_12_13),nrow(gar0_13_14),nrow(gar0_14_15),nrow(gar0_15_16),nrow(gar0_16_17),nrow(gar0_17_18),
                     nrow(gar0_18_19),nrow(gar0_19_20),nrow(gar0_20_21),nrow(gar0_21_22),nrow(gar0_22_23),nrow(gar0_23_24),
                     nrow(gar0_24_25),nrow(gar0_25_26),nrow(gar0_26_27),nrow(gar0_27_28));
gar0_temp2 <- rbind(ev_gar0_11,ev_gar0_12_13,ev_gar0_13_14,ev_gar0_14_15,ev_gar0_15_16,ev_gar0_16_17,ev_gar0_17_18,ev_gar0_18_19,
                     ev_gar0_19_20,ev_gar0_20_21,ev_gar0_21_22,ev_gar0_22_23,ev_gar0_23_24,ev_gar0_24_25,ev_gar0_25_26,ev_gar0_26_27,
                     ev_gar0_27_28);
gar0_temp3 <- rbind(nev_gar0_11,nev_gar0_12_13,nev_gar0_13_14,nev_gar0_14_15,nev_gar0_15_16,nev_gar0_16_17,nev_gar0_17_18,nev_gar0_18_19,
                     nev_gar0_19_20,nev_gar0_20_21,nev_gar0_21_22,nev_gar0_22_23,nev_gar0_23_24,nev_gar0_24_25,nev_gar0_25_26,nev_gar0_26_27,
                     nev_gar0_27_28);

gar0_rownames_char <- c('1.1','1.2-1.3','1.3-1.4','1.4-1.5','1.5-1.6','1.6-1.7','1.7-1.8','1.8-1.9',
                         '1.9-2.0','2.0-2.1','2.1-2.2','2.2-2.3','2.3-2.4','2.4-2.5','2.5-2.6','2.6-2.7');
gar0_rownames <- seq(1.1,2.7,by=0.1);
gar0_event <- data.frame(cbind(gar0_rownames,gar0_temp1,gar0_temp2,gar0_temp3));
rownames(gar0_event) <- NULL;
colnames(gar0_event) <- c('Layer','Total','Post-Event','Pre-Event');
gar0_subset1 <- gar0_event;
gar0_subset1$Total <- NULL;
write.csv(gar0_event,"gar0_event_24.csv");

gar0_event_melt <- melt(gar0_event,id.vars='Layer');

ggplot(gar0_event_melt, aes(Layer,value, col=variable)) + geom_line(size=1.5) + 
  geom_point(size=4) + 
  scale_x_continuous(breaks=seq(1.1,2.7,by=0.1),
                     labels=gar0_rownames) +
  theme(plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=15),axis.title=element_text(size=14,face="bold")) 










