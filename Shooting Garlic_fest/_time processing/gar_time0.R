library(lubridate)
library(ggplot2)
library(reshape2)

event_time_gar <- strptime("2019-07-28 17:40:00","%Y-%m-%d %H:%M:%S");


#########  Create a full time sequence tweets dataframe (adds missing days)
full_seq_time <- function(tweets.df) {
  # tweets.df <- time_tweets(gar0_11,time_int);
  # start <- as.POSIXct(format(floor_date(tweets.df[1,1],"day"),"%Y-%m-%d %H:%M:%S"),format="%Y-%m-%d %H:%M:%S");
  # stop <- as.POSIXct(format(round_date(tweets.df[nrow(tweets.df),1],"day"),"%Y-%m-%d %H:%M:%S"),format="%Y-%m-%d %H:%M:%S");
  start <- strptime("2019-07-27 00:00:00","%Y-%m-%d %H:%M:%S");
  stop <- strptime("2019-07-30 00:00:00","%Y-%m-%d %H:%M:%S");
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

gar0_11 <- read.csv(file="Garlic_fest/gar0/gar11_2.csv",header=TRUE); #event at 2 mile
gar0_12 <- read.csv(file="Garlic_fest/gar0/gar12_2.csv",header=TRUE); 
gar0_13 <- read.csv(file="Garlic_fest/gar0/gar13_2.csv",header=TRUE);
gar0_14 <- read.csv(file="Garlic_fest/gar0/gar14_2.csv",header=TRUE);
gar0_15 <- read.csv(file="Garlic_fest/gar0/gar15_2.csv",header=TRUE);
gar0_16 <- read.csv(file="Garlic_fest/gar0/gar16_2.csv",header=TRUE);
gar0_17 <- read.csv(file="Garlic_fest/gar0/gar17_2.csv",header=TRUE);
gar0_18 <- read.csv(file="Garlic_fest/gar0/gar18_2.csv",header=TRUE);
gar0_19 <- read.csv(file="Garlic_fest/gar0/gar19_2.csv",header=TRUE); 
gar0_20 <- read.csv(file="Garlic_fest/gar0/gar20_2.csv",header=TRUE);
gar0_21 <- read.csv(file="Garlic_fest/gar0/gar21_2.csv",header=TRUE);
gar0_22 <- read.csv(file="Garlic_fest/gar0/gar22_2.csv",header=TRUE);
gar0_23 <- read.csv(file="Garlic_fest/gar0/gar23_2.csv",header=TRUE);
gar0_24 <- read.csv(file="Garlic_fest/gar0/gar24_2.csv",header=TRUE);
gar0_25 <- read.csv(file="Garlic_fest/gar0/gar25_2.csv",header=TRUE);
gar0_26 <- read.csv(file="Garlic_fest/gar0/gar26_2.csv",header=TRUE);
gar0_27 <- read.csv(file="Garlic_fest/gar0/gar27_2.csv",header=TRUE);
gar0_28 <- read.csv(file="Garlic_fest/gar0/gar28_2.csv",header=TRUE);

time_int <- "1 hour";
gar0_11t <- full_seq_time(time_tweets(gar0_11,time_int));
gar0_12t <- full_seq_time(time_tweets(gar0_12,time_int));
gar0_13t <- full_seq_time(time_tweets(gar0_13,time_int));
gar0_14t <- full_seq_time(time_tweets(gar0_14,time_int));
gar0_15t <- full_seq_time(time_tweets(gar0_15,time_int));
gar0_16t <- full_seq_time(time_tweets(gar0_16,time_int));
gar0_17t <- full_seq_time(time_tweets(gar0_17,time_int));
gar0_18t <- full_seq_time(time_tweets(gar0_18,time_int));
gar0_19t <- full_seq_time(time_tweets(gar0_19,time_int));
gar0_20t <- full_seq_time(time_tweets(gar0_20,time_int));
gar0_21t <- full_seq_time(time_tweets(gar0_21,time_int));
gar0_22t <- full_seq_time(time_tweets(gar0_22,time_int));
gar0_23t <- full_seq_time(time_tweets(gar0_23,time_int));
gar0_24t <- full_seq_time(time_tweets(gar0_24,time_int));
gar0_25t <- full_seq_time(time_tweets(gar0_25,time_int));
gar0_26t <- full_seq_time(time_tweets(gar0_26,time_int));
gar0_27t <- full_seq_time(time_tweets(gar0_27,time_int));
gar0_28t <- full_seq_time(time_tweets(gar0_28,time_int));



gar0_time <- data.frame(gar0_12t$Time,gar0_11t$Number_of_Tweets,gar0_12t$Number_of_Tweets,gar0_13t$Number_of_Tweets,gar0_14t$Number_of_Tweets,gar0_15t$Number_of_Tweets,
                         gar0_16t$Number_of_Tweets,gar0_17t$Number_of_Tweets,gar0_18t$Number_of_Tweets,gar0_19t$Number_of_Tweets,gar0_20t$Number_of_Tweets,
                         gar0_21t$Number_of_Tweets,gar0_22t$Number_of_Tweets,gar0_23t$Number_of_Tweets,gar0_24t$Number_of_Tweets,gar0_25t$Number_of_Tweets,
                         gar0_26t$Number_of_Tweets,gar0_27t$Number_of_Tweets,gar0_28t$Number_of_Tweets)
colnames(gar0_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_gar,time_int);
event_ind <- which(gar0_time$Time==event_time2);
gar0_time_melt <- melt(gar0_time,id.vars = "Time")

ggplot(data = gar0_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_gar) + labs(title="gar Attacks 0 deg")
# write.csv(gar0_time,file="gar0_time.csv");
