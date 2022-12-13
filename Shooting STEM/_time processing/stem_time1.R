# from stem_time0.R

stem30_11 <- read.csv(file="Shooting stem/stem30/stem_30_11_2.csv",header=TRUE); #event at 2 mile
stem30_12 <- read.csv(file="Shooting stem/stem30/stem_30_12_2.csv",header=TRUE); 
stem30_13 <- read.csv(file="Shooting stem/stem30/stem_30_13_2.csv",header=TRUE);
stem30_14 <- read.csv(file="Shooting stem/stem30/stem_30_14_2.csv",header=TRUE);
stem30_15 <- read.csv(file="Shooting stem/stem30/stem_30_15_2.csv",header=TRUE);
stem30_16 <- read.csv(file="Shooting stem/stem30/stem_30_16_2.csv",header=TRUE);
stem30_17 <- read.csv(file="Shooting stem/stem30/stem_30_17_2.csv",header=TRUE);
stem30_18 <- read.csv(file="Shooting stem/stem30/stem_30_18_2.csv",header=TRUE);
stem30_19 <- read.csv(file="Shooting stem/stem30/stem_30_19_2.csv",header=TRUE); 
stem30_20 <- read.csv(file="Shooting stem/stem30/stem_30_20_2.csv",header=TRUE);
stem30_21 <- read.csv(file="Shooting stem/stem30/stem_30_21_2.csv",header=TRUE);
stem30_22 <- read.csv(file="Shooting stem/stem30/stem_30_22_2.csv",header=TRUE);
stem30_23 <- read.csv(file="Shooting stem/stem30/stem_30_23_2.csv",header=TRUE);
stem30_24 <- read.csv(file="Shooting stem/stem30/stem_30_24_2.csv",header=TRUE);
stem30_25 <- read.csv(file="Shooting stem/stem30/stem_30_25_2.csv",header=TRUE);
stem30_26 <- read.csv(file="Shooting stem/stem30/stem_30_26_2.csv",header=TRUE);
stem30_27 <- read.csv(file="Shooting stem/stem30/stem_30_27_2.csv",header=TRUE);
stem30_28 <- read.csv(file="Shooting stem/stem30/stem_30_28_2.csv",header=TRUE);

time_int <- "1 hour";
stem30_11t <- full_seq_time_stem(time_tweets(stem30_11,time_int));
stem30_12t <- full_seq_time_stem(time_tweets(stem30_12,time_int));
stem30_13t <- full_seq_time_stem(time_tweets(stem30_13,time_int));
stem30_14t <- full_seq_time_stem(time_tweets(stem30_14,time_int));
stem30_15t <- full_seq_time_stem(time_tweets(stem30_15,time_int));
stem30_16t <- full_seq_time_stem(time_tweets(stem30_16,time_int));
stem30_17t <- full_seq_time_stem(time_tweets(stem30_17,time_int));
stem30_18t <- full_seq_time_stem(time_tweets(stem30_18,time_int));
stem30_19t <- full_seq_time_stem(time_tweets(stem30_19,time_int));
stem30_20t <- full_seq_time_stem(time_tweets(stem30_20,time_int));
stem30_21t <- full_seq_time_stem(time_tweets(stem30_21,time_int));
stem30_22t <- full_seq_time_stem(time_tweets(stem30_22,time_int));
stem30_23t <- full_seq_time_stem(time_tweets(stem30_23,time_int));
stem30_24t <- full_seq_time_stem(time_tweets(stem30_24,time_int));
stem30_25t <- full_seq_time_stem(time_tweets(stem30_25,time_int));
stem30_26t <- full_seq_time_stem(time_tweets(stem30_26,time_int));
stem30_27t <- full_seq_time_stem(time_tweets(stem30_27,time_int));
stem30_28t <- full_seq_time_stem(time_tweets(stem30_28,time_int));

event_time2 <- round_date(event_time,time_int);

stem30_time <- data.frame(stem30_12t$Time,stem30_11t$Number_of_Tweets,stem30_12t$Number_of_Tweets,stem30_13t$Number_of_Tweets,stem30_14t$Number_of_Tweets,stem30_15t$Number_of_Tweets,
                         stem30_16t$Number_of_Tweets,stem30_17t$Number_of_Tweets,stem30_18t$Number_of_Tweets,stem30_19t$Number_of_Tweets,stem30_20t$Number_of_Tweets,
                         stem30_21t$Number_of_Tweets,stem30_22t$Number_of_Tweets,stem30_23t$Number_of_Tweets,stem30_24t$Number_of_Tweets,stem30_25t$Number_of_Tweets,
                         stem30_26t$Number_of_Tweets,stem30_27t$Number_of_Tweets,stem30_28t$Number_of_Tweets)
colnames(stem30_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_ind <- which(stem30_time$Time==event_time2);
stem30_time_melt <- melt(stem30_time,id.vars = "Time")

ggplot(data = stem30_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="stem Attacks 30 deg")
write.csv(stem30_time,file="stem30_time.csv");
