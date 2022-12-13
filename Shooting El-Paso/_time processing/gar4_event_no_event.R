library(ggplot2)
library(lubridate)
library(reshape2)

gar3_11 <- read.csv(file="Garlic_fest/gar3/gar_270_11_2.csv",header=TRUE);
gar3_12_13 <- read.csv(file="Garlic_fest/gar3/gar_270_12_2.csv",header=TRUE);
gar3_13_14 <- read.csv(file="Garlic_fest/gar3/gar_270_13_2.csv",header=TRUE);
gar3_14_15 <- read.csv(file="Garlic_fest/gar3/gar_270_14_2.csv",header=TRUE);
gar3_15_16 <- read.csv(file="Garlic_fest/gar3/gar_270_15_2.csv",header=TRUE);
gar3_16_17 <- read.csv(file="Garlic_fest/gar3/gar_270_16_2.csv",header=TRUE);
gar3_17_18 <- read.csv(file="Garlic_fest/gar3/gar_270_17_2.csv",header=TRUE);
gar3_18_19 <- read.csv(file="Garlic_fest/gar3/gar_270_18_2.csv",header=TRUE);
gar3_19_20 <- read.csv(file="Garlic_fest/gar3/gar_270_19_2.csv",header=TRUE);
gar3_20_21 <- read.csv(file="Garlic_fest/gar3/gar_270_20_2.csv",header=TRUE);
gar3_21_22 <- read.csv(file="Garlic_fest/gar3/gar_270_21_2.csv",header=TRUE);
gar3_22_23 <- read.csv(file="Garlic_fest/gar3/gar_270_22_2.csv",header=TRUE);
gar3_23_24 <- read.csv(file="Garlic_fest/gar3/gar_270_23_2.csv",header=TRUE);
gar3_24_25 <- read.csv(file="Garlic_fest/gar3/gar_270_24_2.csv",header=TRUE);
gar3_25_26 <- read.csv(file="Garlic_fest/gar3/gar_270_25_2.csv",header=TRUE);
gar3_26_27 <- read.csv(file="Garlic_fest/gar3/gar_270_26_2.csv",header=TRUE);
gar3_27_28 <- read.csv(file="Garlic_fest/gar3/gar_270_27_2.csv",header=TRUE);
gar3_28_29 <- read.csv(file="Garlic_fest/gar3/gar_270_28_2.csv",header=TRUE);

event_time_gar <- strptime("2019-07-28 17:40:00","%Y-%m-%d %H:%M:%S");
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

ev_gar3_11 <- event_tweets(event_time_gar,whrs,wmins,gar3_11);
ev_gar3_12_13 <- event_tweets(event_time_gar,whrs,wmins,gar3_12_13);
ev_gar3_13_14 <- event_tweets(event_time_gar,whrs,wmins,gar3_13_14);
ev_gar3_14_15 <- event_tweets(event_time_gar,whrs,wmins,gar3_14_15);
ev_gar3_15_16 <- event_tweets(event_time_gar,whrs,wmins,gar3_15_16);
ev_gar3_16_17 <- event_tweets(event_time_gar,whrs,wmins,gar3_16_17);
ev_gar3_17_18 <- event_tweets(event_time_gar,whrs,wmins,gar3_17_18);
ev_gar3_18_19 <- event_tweets(event_time_gar,whrs,wmins,gar3_18_19);
ev_gar3_19_20 <- event_tweets(event_time_gar,whrs,wmins,gar3_19_20);
ev_gar3_20_21 <- event_tweets(event_time_gar,whrs,wmins,gar3_20_21);
ev_gar3_21_22 <- event_tweets(event_time_gar,whrs,wmins,gar3_21_22);
ev_gar3_22_23 <- event_tweets(event_time_gar,whrs,wmins,gar3_22_23);
ev_gar3_23_24 <- event_tweets(event_time_gar,whrs,wmins,gar3_23_24);
ev_gar3_24_25 <- event_tweets(event_time_gar,whrs,wmins,gar3_24_25);
ev_gar3_25_26 <- event_tweets(event_time_gar,whrs,wmins,gar3_25_26);
ev_gar3_26_27 <- event_tweets(event_time_gar,whrs,wmins,gar3_26_27);
ev_gar3_27_28 <- event_tweets(event_time_gar,whrs,wmins,gar3_27_28);

nev_gar3_11 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_11);
nev_gar3_12_13 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_12_13);
nev_gar3_13_14 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_13_14);
nev_gar3_14_15 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_14_15);
nev_gar3_15_16 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_15_16);
nev_gar3_16_17 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_16_17);
nev_gar3_17_18 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_17_18);
nev_gar3_18_19 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_18_19);
nev_gar3_19_20 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_19_20);
nev_gar3_20_21 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_20_21);
nev_gar3_21_22 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_21_22);
nev_gar3_22_23 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_22_23);
nev_gar3_23_24 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_23_24);
nev_gar3_24_25 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_24_25);
nev_gar3_25_26 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_25_26);
nev_gar3_26_27 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_26_27);
nev_gar3_27_28 <- nevent_tweets(event_time_gar,whrs,wmins,gar3_27_28);

gar3_temp1 <- rbind(nrow(gar3_11),nrow(gar3_12_13),nrow(gar3_13_14),nrow(gar3_14_15),nrow(gar3_15_16),nrow(gar3_16_17),nrow(gar3_17_18),
                    nrow(gar3_18_19),nrow(gar3_19_20),nrow(gar3_20_21),nrow(gar3_21_22),nrow(gar3_22_23),nrow(gar3_23_24),
                    nrow(gar3_24_25),nrow(gar3_25_26),nrow(gar3_26_27),nrow(gar3_27_28));
gar3_temp2 <- rbind(ev_gar3_11,ev_gar3_12_13,ev_gar3_13_14,ev_gar3_14_15,ev_gar3_15_16,ev_gar3_16_17,ev_gar3_17_18,ev_gar3_18_19,
                    ev_gar3_19_20,ev_gar3_20_21,ev_gar3_21_22,ev_gar3_22_23,ev_gar3_23_24,ev_gar3_24_25,ev_gar3_25_26,ev_gar3_26_27,
                    ev_gar3_27_28);
gar3_temp3 <- rbind(nev_gar3_11,nev_gar3_12_13,nev_gar3_13_14,nev_gar3_14_15,nev_gar3_15_16,nev_gar3_16_17,nev_gar3_17_18,nev_gar3_18_19,
                    nev_gar3_19_20,nev_gar3_20_21,nev_gar3_21_22,nev_gar3_22_23,nev_gar3_23_24,nev_gar3_24_25,nev_gar3_25_26,nev_gar3_26_27,
                    nev_gar3_27_28);

gar3_rownames_char <- c('1.1','1.2-1.3','1.3-1.4','1.4-1.5','1.5-1.6','1.6-1.7','1.7-1.8','1.8-1.9',
                        '1.9-2.0','2.0-2.1','2.1-2.2','2.2-2.3','2.3-2.4','2.4-2.5','2.5-2.6','2.6-2.7');
gar3_rownames <- seq(1.1,2.7,by=0.1);
gar3_event <- data.frame(cbind(gar3_rownames,gar3_temp1,gar3_temp2,gar3_temp3));
rownames(gar3_event) <- NULL;
colnames(gar3_event) <- c('Layer','Total','Post-Event','Pre-Event');
gar3_subset1 <- gar3_event;
gar3_subset1$Total <- NULL;
write.csv(gar3_event,"gar3_event_3.csv");

gar3_event_melt <- melt(gar3_event,id.vars='Layer');

ggplot(gar3_event_melt, aes(Layer,value, col=variable)) + geom_line(size=1.5) + 
  geom_point(size=4) + 
  scale_x_continuous(breaks=seq(1.1,2.7,by=0.1),
                     labels=gar3_rownames) +
  theme(plot.title = element_text(size=18, face = 'bold'),axis.text=element_text(size=15),axis.title=element_text(size=14,face="bold")) 










