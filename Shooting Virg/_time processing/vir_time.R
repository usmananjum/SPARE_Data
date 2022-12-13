library(lubridate)
library(ggplot2)
library(reshape2)

event_time <- strptime("2019-05-31 16:40:00","%Y-%m-%d %H:%M:%S");



#########  Create a full time sequence tweets dataframe (adds missing days)
full_seq_time <- function(tweets.df) {
  # tweets.df <- time_tweets(tweets.0_5,0.5,time_interval1);
  # start <- as.POSIXct(format(floor_date(tweets.df[1,1],"day"),"%Y-%m-%d %H:%M:%S"),format="%Y-%m-%d %H:%M:%S");
  # stop <- as.POSIXct(format(round_date(tweets.df[nrow(tweets.df),1],"day"),"%Y-%m-%d %H:%M:%S"),format="%Y-%m-%d %H:%M:%S");
  start <- strptime("2019-05-29 00:00:00","%Y-%m-%d %H:%M:%S");
  stop <- strptime("2019-06-02 00:00:00","%Y-%m-%d %H:%M:%S");
  seq_time <- seq.POSIXt(start,stop,by="hour");
  seq_time_ind <- match(tweets.df$Time,seq_time);
  datafusion_tweets.full <- data.frame(seq_time,rep(0,length(seq_time)));
  colnames(datafusion_tweets.full) <- c("Time","Number_of_Tweets");
  datafusion_tweets.full$Number_of_Tweets[seq_time_ind] <- tweets.df$Number_of_Tweets;                                                                              
  return(datafusion_tweets.full)
}

######### Function to group tweets by time_interval: input=time granularity in hours, tweets dataframe with time column names "created"
time_tweets <- function(tweets.df,time_interval){
  time_tweets <- data.frame(table(as.POSIXct(round_date(as.POSIXct(tweets.df$created,format = "%Y-%m-%d %H:%M:%S"),time_interval))));
  time_tweets$Time <- as.POSIXct(time_tweets$Var1);
  time_tweets <- time_tweets[,-1];
  datafusion_tweets <- data.frame(time_tweets$Time,time_tweets$Freq);
  colnames(datafusion_tweets) <- c('Time','Number_of_Tweets');
  return(datafusion_tweets)
}

virg0_11 <- read.csv(file="Shooting Virg/virg0/virg11_2.csv",header=TRUE); #event at 2 mile
virg0_12 <- read.csv(file="Shooting Virg/virg0/virg12_2.csv",header=TRUE); 
virg0_13 <- read.csv(file="Shooting Virg/virg0/virg13_2.csv",header=TRUE);
virg0_14 <- read.csv(file="Shooting Virg/virg0/virg14_2.csv",header=TRUE);
virg0_15 <- read.csv(file="Shooting Virg/virg0/virg15_2.csv",header=TRUE);
virg0_16 <- read.csv(file="Shooting Virg/virg0/virg16_2.csv",header=TRUE);
virg0_17 <- read.csv(file="Shooting Virg/virg0/virg17_2.csv",header=TRUE);
virg0_18 <- read.csv(file="Shooting Virg/virg0/virg18_2.csv",header=TRUE);
virg0_19 <- read.csv(file="Shooting Virg/virg0/virg19_2.csv",header=TRUE); 
virg0_20 <- read.csv(file="Shooting Virg/virg0/virg20_2.csv",header=TRUE);
virg0_21 <- read.csv(file="Shooting Virg/virg0/virg21_2.csv",header=TRUE);
virg0_22 <- read.csv(file="Shooting Virg/virg0/virg22_2.csv",header=TRUE);
virg0_23 <- read.csv(file="Shooting Virg/virg0/virg23_2.csv",header=TRUE);
virg0_24 <- read.csv(file="Shooting Virg/virg0/virg24_2.csv",header=TRUE);
virg0_25 <- read.csv(file="Shooting Virg/virg0/virg25_2.csv",header=TRUE);
virg0_26 <- read.csv(file="Shooting Virg/virg0/virg26_2.csv",header=TRUE);
virg0_27 <- read.csv(file="Shooting Virg/virg0/virg27_2.csv",header=TRUE);
virg0_28 <- read.csv(file="Shooting Virg/virg0/virg28_2.csv",header=TRUE);

time_int <- "1 hour";
virg0_11t <- full_seq_time(time_tweets(virg0_11,time_int));
virg0_12t <- full_seq_time(time_tweets(virg0_12,time_int));
virg0_13t <- full_seq_time(time_tweets(virg0_13,time_int));
virg0_14t <- full_seq_time(time_tweets(virg0_14,time_int));
virg0_15t <- full_seq_time(time_tweets(virg0_15,time_int));
virg0_16t <- full_seq_time(time_tweets(virg0_16,time_int));
virg0_17t <- full_seq_time(time_tweets(virg0_17,time_int));
virg0_18t <- full_seq_time(time_tweets(virg0_18,time_int));
virg0_19t <- full_seq_time(time_tweets(virg0_19,time_int));
virg0_20t <- full_seq_time(time_tweets(virg0_20,time_int));
virg0_21t <- full_seq_time(time_tweets(virg0_21,time_int));
virg0_22t <- full_seq_time(time_tweets(virg0_22,time_int));
virg0_23t <- full_seq_time(time_tweets(virg0_23,time_int));
virg0_24t <- full_seq_time(time_tweets(virg0_24,time_int));
virg0_25t <- full_seq_time(time_tweets(virg0_25,time_int));
virg0_26t <- full_seq_time(time_tweets(virg0_26,time_int));
virg0_27t <- full_seq_time(time_tweets(virg0_27,time_int));
virg0_28t <- full_seq_time(time_tweets(virg0_28,time_int));

event_time2 <- round_date(event_time,time_int);
event_ind <- which(virg0_time$Time==event_time2);

virg0_time <- data.frame(virg0_12t$Time,virg0_11t$Number_of_Tweets,virg0_12t$Number_of_Tweets,virg0_13t$Number_of_Tweets,virg0_14t$Number_of_Tweets,virg0_15t$Number_of_Tweets,
                         virg0_16t$Number_of_Tweets,virg0_17t$Number_of_Tweets,virg0_18t$Number_of_Tweets,virg0_19t$Number_of_Tweets,virg0_20t$Number_of_Tweets,
                         virg0_21t$Number_of_Tweets,virg0_22t$Number_of_Tweets,virg0_23t$Number_of_Tweets,virg0_24t$Number_of_Tweets,virg0_25t$Number_of_Tweets,
                         virg0_26t$Number_of_Tweets,virg0_27t$Number_of_Tweets,virg0_28t$Number_of_Tweets)
colnames(virg0_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

virg0_time_melt <- melt(virg0_time,id.vars = "Time")

ggplot(data = virg0_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="virg Attacks 0 deg")
#write.csv(virg0_time,file="virg0_time.csv");
