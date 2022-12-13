library(lubridate)
library(ggplot2)
library(reshape2)

event_time_santa <- strptime("2019-11-14 17:40:00","%Y-%m-%d %H:%M:%S");


#########  Create a full time sequence tweets dataframe (adds missing days)
full_seq_time <- function(tweets.df) {
  # tweets.df <- time_tweets(santa1_11,time_int);
  # start <- as.POSIXct(format(floor_date(tweets.df[1,1],"day"),"%Y-%m-%d %H:%M:%S"),format="%Y-%m-%d %H:%M:%S");
  # stop <- as.POSIXct(format(round_date(tweets.df[nrow(tweets.df),1],"day"),"%Y-%m-%d %H:%M:%S"),format="%Y-%m-%d %H:%M:%S");
  start <- strptime("2019-11-12 00:00:00","%Y-%m-%d %H:%M:%S");
  stop <- strptime("2019-11-18 00:00:00","%Y-%m-%d %H:%M:%S");
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

santa1_10 <- read.csv(file="Santa_clarita/santa1/santa_90_10_2.csv",header=TRUE);
santa1_11 <- read.csv(file="Santa_clarita/santa1/santa_90_11_2.csv",header=TRUE); #event at 2 mile
santa1_12 <- read.csv(file="Santa_clarita/santa1/santa_90_12_2.csv",header=TRUE); 
santa1_13 <- read.csv(file="Santa_clarita/santa1/santa_90_13_2.csv",header=TRUE);
santa1_14 <- read.csv(file="Santa_clarita/santa1/santa_90_14_2.csv",header=TRUE);
santa1_15 <- read.csv(file="Santa_clarita/santa1/santa_90_15_2.csv",header=TRUE);
santa1_16 <- read.csv(file="Santa_clarita/santa1/santa_90_16_2.csv",header=TRUE);
santa1_17 <- read.csv(file="Santa_clarita/santa1/santa_90_17_2.csv",header=TRUE);
santa1_18 <- read.csv(file="Santa_clarita/santa1/santa_90_18_2.csv",header=TRUE);
santa1_19 <- read.csv(file="Santa_clarita/santa1/santa_90_19_2.csv",header=TRUE); 
santa1_20 <- read.csv(file="Santa_clarita/santa1/santa_90_20_2.csv",header=TRUE);
santa1_21 <- read.csv(file="Santa_clarita/santa1/santa_90_21_2.csv",header=TRUE);
santa1_22 <- read.csv(file="Santa_clarita/santa1/santa_90_22_2.csv",header=TRUE);
santa1_23 <- read.csv(file="Santa_clarita/santa1/santa_90_23_2.csv",header=TRUE);
santa1_24 <- read.csv(file="Santa_clarita/santa1/santa_90_24_2.csv",header=TRUE);
santa1_25 <- read.csv(file="Santa_clarita/santa1/santa_90_25_2.csv",header=TRUE);
santa1_26 <- read.csv(file="Santa_clarita/santa1/santa_90_26_2.csv",header=TRUE);
santa1_27 <- read.csv(file="Santa_clarita/santa1/santa_90_27_2.csv",header=TRUE);
santa1_28 <- read.csv(file="Santa_clarita/santa1/santa_90_28_2.csv",header=TRUE);

time_int <- "1 hour";
santa1_10t <- full_seq_time(time_tweets(santa1_10,time_int));
santa1_11t <- full_seq_time(time_tweets(santa1_11,time_int));
santa1_12t <- full_seq_time(time_tweets(santa1_12,time_int));
santa1_13t <- full_seq_time(time_tweets(santa1_13,time_int));
santa1_14t <- full_seq_time(time_tweets(santa1_14,time_int));
santa1_15t <- full_seq_time(time_tweets(santa1_15,time_int));
santa1_16t <- full_seq_time(time_tweets(santa1_16,time_int));
santa1_17t <- full_seq_time(time_tweets(santa1_17,time_int));
santa1_18t <- full_seq_time(time_tweets(santa1_18,time_int));
santa1_19t <- full_seq_time(time_tweets(santa1_19,time_int));
santa1_20t <- full_seq_time(time_tweets(santa1_20,time_int));
santa1_21t <- full_seq_time(time_tweets(santa1_21,time_int));
santa1_22t <- full_seq_time(time_tweets(santa1_22,time_int));
santa1_23t <- full_seq_time(time_tweets(santa1_23,time_int));
santa1_24t <- full_seq_time(time_tweets(santa1_24,time_int));
santa1_25t <- full_seq_time(time_tweets(santa1_25,time_int));
santa1_26t <- full_seq_time(time_tweets(santa1_26,time_int));
santa1_27t <- full_seq_time(time_tweets(santa1_27,time_int));
santa1_28t <- full_seq_time(time_tweets(santa1_28,time_int));



santa1_time <- data.frame(santa1_12t$Time,santa1_10t$Number_of_Tweets,santa1_11t$Number_of_Tweets,santa1_12t$Number_of_Tweets,santa1_13t$Number_of_Tweets,santa1_14t$Number_of_Tweets,santa1_15t$Number_of_Tweets,
                          santa1_16t$Number_of_Tweets,santa1_17t$Number_of_Tweets,santa1_18t$Number_of_Tweets,santa1_19t$Number_of_Tweets,santa1_20t$Number_of_Tweets,
                          santa1_21t$Number_of_Tweets,santa1_22t$Number_of_Tweets,santa1_23t$Number_of_Tweets,santa1_24t$Number_of_Tweets,santa1_25t$Number_of_Tweets,
                          santa1_26t$Number_of_Tweets,santa1_27t$Number_of_Tweets,santa1_28t$Number_of_Tweets)
colnames(santa1_time) <- c('Time','1.0','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_santa,time_int);
event_ind <- which(santa1_time$Time==event_time2);
santa1_time_melt <- melt(santa1_time,id.vars = "Time")

ggplot(data = santa1_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_santa) + labs(title="santa Attacks 0 deg")
write.csv(santa1_time,file="santa1_time.csv");
