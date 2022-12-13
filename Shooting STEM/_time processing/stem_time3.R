# from stem_time0.R

stem180_11 <- read.csv(file="Shooting stem/stem180/stem_180_11_2.csv",header=TRUE); #event at 2 mile
stem180_12 <- read.csv(file="Shooting stem/stem180/stem_180_12_2.csv",header=TRUE); 
stem180_13 <- read.csv(file="Shooting stem/stem180/stem_180_13_2.csv",header=TRUE);
stem180_14 <- read.csv(file="Shooting stem/stem180/stem_180_14_2.csv",header=TRUE);
stem180_15 <- read.csv(file="Shooting stem/stem180/stem_180_15_2.csv",header=TRUE);
stem180_16 <- read.csv(file="Shooting stem/stem180/stem_180_16_2.csv",header=TRUE);
stem180_17 <- read.csv(file="Shooting stem/stem180/stem_180_17_2.csv",header=TRUE);
stem180_18 <- read.csv(file="Shooting stem/stem180/stem_180_18_2.csv",header=TRUE);
stem180_19 <- read.csv(file="Shooting stem/stem180/stem_180_19_2.csv",header=TRUE); 
stem180_20 <- read.csv(file="Shooting stem/stem180/stem_180_20_2.csv",header=TRUE);
stem180_21 <- read.csv(file="Shooting stem/stem180/stem_180_21_2.csv",header=TRUE);
stem180_22 <- read.csv(file="Shooting stem/stem180/stem_180_22_2.csv",header=TRUE);
stem180_23 <- read.csv(file="Shooting stem/stem180/stem_180_23_2.csv",header=TRUE);
stem180_24 <- read.csv(file="Shooting stem/stem180/stem_180_24_2.csv",header=TRUE);
stem180_25 <- read.csv(file="Shooting stem/stem180/stem_180_25_2.csv",header=TRUE);
stem180_26 <- read.csv(file="Shooting stem/stem180/stem_180_26_2.csv",header=TRUE);
stem180_27 <- read.csv(file="Shooting stem/stem180/stem_180_27_2.csv",header=TRUE);
stem180_28 <- read.csv(file="Shooting stem/stem180/stem_180_28_2.csv",header=TRUE);

time_int <- "1 hour";
stem180_11t <- full_seq_time_stem(time_tweets(stem180_11,time_int));
stem180_12t <- full_seq_time_stem(time_tweets(stem180_12,time_int));
stem180_13t <- full_seq_time_stem(time_tweets(stem180_13,time_int));
stem180_14t <- full_seq_time_stem(time_tweets(stem180_14,time_int));
stem180_15t <- full_seq_time_stem(time_tweets(stem180_15,time_int));
stem180_16t <- full_seq_time_stem(time_tweets(stem180_16,time_int));
stem180_17t <- full_seq_time_stem(time_tweets(stem180_17,time_int));
stem180_18t <- full_seq_time_stem(time_tweets(stem180_18,time_int));
stem180_19t <- full_seq_time_stem(time_tweets(stem180_19,time_int));
stem180_20t <- full_seq_time_stem(time_tweets(stem180_20,time_int));
stem180_21t <- full_seq_time_stem(time_tweets(stem180_21,time_int));
stem180_22t <- full_seq_time_stem(time_tweets(stem180_22,time_int));
stem180_23t <- full_seq_time_stem(time_tweets(stem180_23,time_int));
stem180_24t <- full_seq_time_stem(time_tweets(stem180_24,time_int));
stem180_25t <- full_seq_time_stem(time_tweets(stem180_25,time_int));
stem180_26t <- full_seq_time_stem(time_tweets(stem180_26,time_int));
stem180_27t <- full_seq_time_stem(time_tweets(stem180_27,time_int));
stem180_28t <- full_seq_time_stem(time_tweets(stem180_28,time_int));

event_time2 <- round_date(event_time,time_int);

stem180_time <- data.frame(stem180_12t$Time,stem180_11t$Number_of_Tweets,stem180_12t$Number_of_Tweets,stem180_13t$Number_of_Tweets,stem180_14t$Number_of_Tweets,stem180_15t$Number_of_Tweets,
                          stem180_16t$Number_of_Tweets,stem180_17t$Number_of_Tweets,stem180_18t$Number_of_Tweets,stem180_19t$Number_of_Tweets,stem180_20t$Number_of_Tweets,
                          stem180_21t$Number_of_Tweets,stem180_22t$Number_of_Tweets,stem180_23t$Number_of_Tweets,stem180_24t$Number_of_Tweets,stem180_25t$Number_of_Tweets,
                          stem180_26t$Number_of_Tweets,stem180_27t$Number_of_Tweets,stem180_28t$Number_of_Tweets)
colnames(stem180_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_ind <- which(stem180_time$Time==event_time2);
stem180_time_melt <- melt(stem180_time,id.vars = "Time")

ggplot(data = stem180_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="stem Attacks 180 deg")
write.csv(stem180_time,file="stem180_time.csv");
