event_time <- strptime("2019-05-07 13:53:00","%Y-%m-%d %H:%M:%S");

#########  Create a full time sequence tweets dataframe (adds missing days)
full_seq_time_stem <- function(tweets.df) {
  start <- strptime("2019-05-06 00:00:00","%Y-%m-%d %H:%M:%S");
  stop <- strptime("2019-05-11 00:00:00","%Y-%m-%d %H:%M:%S");
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

stem0_11 <- read.csv(file="Shooting stem/stem0/stem11_2.csv",header=TRUE); #event at 2 mile
stem0_12 <- read.csv(file="Shooting stem/stem0/stem12_2.csv",header=TRUE); 
stem0_13 <- read.csv(file="Shooting stem/stem0/stem13_2.csv",header=TRUE);
stem0_14 <- read.csv(file="Shooting stem/stem0/stem14_2.csv",header=TRUE);
stem0_15 <- read.csv(file="Shooting stem/stem0/stem15_2.csv",header=TRUE);
stem0_16 <- read.csv(file="Shooting stem/stem0/stem16_2.csv",header=TRUE);
stem0_17 <- read.csv(file="Shooting stem/stem0/stem17_2.csv",header=TRUE);
stem0_18 <- read.csv(file="Shooting stem/stem0/stem18_2.csv",header=TRUE);
stem0_19 <- read.csv(file="Shooting stem/stem0/stem19_2.csv",header=TRUE); 
stem0_20 <- read.csv(file="Shooting stem/stem0/stem20_2.csv",header=TRUE);
stem0_21 <- read.csv(file="Shooting stem/stem0/stem21_2.csv",header=TRUE);
stem0_22 <- read.csv(file="Shooting stem/stem0/stem22_2.csv",header=TRUE);
stem0_23 <- read.csv(file="Shooting stem/stem0/stem23_2.csv",header=TRUE);
stem0_24 <- read.csv(file="Shooting stem/stem0/stem24_2.csv",header=TRUE);
stem0_25 <- read.csv(file="Shooting stem/stem0/stem25_2.csv",header=TRUE);
stem0_26 <- read.csv(file="Shooting stem/stem0/stem26_2.csv",header=TRUE);
stem0_27 <- read.csv(file="Shooting stem/stem0/stem27_2.csv",header=TRUE);
stem0_28 <- read.csv(file="Shooting stem/stem0/stem28_2.csv",header=TRUE);

time_int <- "1 hour";
stem0_11t <- full_seq_time_stem(time_tweets(stem0_11,time_int));
stem0_12t <- full_seq_time_stem(time_tweets(stem0_12,time_int));
stem0_13t <- full_seq_time_stem(time_tweets(stem0_13,time_int));
stem0_14t <- full_seq_time_stem(time_tweets(stem0_14,time_int));
stem0_15t <- full_seq_time_stem(time_tweets(stem0_15,time_int));
stem0_16t <- full_seq_time_stem(time_tweets(stem0_16,time_int));
stem0_17t <- full_seq_time_stem(time_tweets(stem0_17,time_int));
stem0_18t <- full_seq_time_stem(time_tweets(stem0_18,time_int));
stem0_19t <- full_seq_time_stem(time_tweets(stem0_19,time_int));
stem0_20t <- full_seq_time_stem(time_tweets(stem0_20,time_int));
stem0_21t <- full_seq_time_stem(time_tweets(stem0_21,time_int));
stem0_22t <- full_seq_time_stem(time_tweets(stem0_22,time_int));
stem0_23t <- full_seq_time_stem(time_tweets(stem0_23,time_int));
stem0_24t <- full_seq_time_stem(time_tweets(stem0_24,time_int));
stem0_25t <- full_seq_time_stem(time_tweets(stem0_25,time_int));
stem0_26t <- full_seq_time_stem(time_tweets(stem0_26,time_int));
stem0_27t <- full_seq_time_stem(time_tweets(stem0_27,time_int));
stem0_28t <- full_seq_time_stem(time_tweets(stem0_28,time_int));

event_time2 <- round_date(event_time,time_int);

stem0_time <- data.frame(stem0_12t$Time,stem0_11t$Number_of_Tweets,stem0_12t$Number_of_Tweets,stem0_13t$Number_of_Tweets,stem0_14t$Number_of_Tweets,stem0_15t$Number_of_Tweets,
                         stem0_16t$Number_of_Tweets,stem0_17t$Number_of_Tweets,stem0_18t$Number_of_Tweets,stem0_19t$Number_of_Tweets,stem0_20t$Number_of_Tweets,
                         stem0_21t$Number_of_Tweets,stem0_22t$Number_of_Tweets,stem0_23t$Number_of_Tweets,stem0_24t$Number_of_Tweets,stem0_25t$Number_of_Tweets,
                         stem0_26t$Number_of_Tweets,stem0_27t$Number_of_Tweets,stem0_28t$Number_of_Tweets)
colnames(stem0_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_ind <- which(stem0_time$Time==event_time2);
stem0_time_melt <- melt(stem0_time,id.vars = "Time")

ggplot(data = stem0_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="stem Attacks 0 deg")
#write.csv(stem0_time,file="stem0_time.csv");
