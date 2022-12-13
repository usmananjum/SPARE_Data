# from stem_time0.R

stem90_11 <- read.csv(file="Shooting stem/stem90/stem_90_11_2.csv",header=TRUE); #event at 2 mile
stem90_12 <- read.csv(file="Shooting stem/stem90/stem_90_12_2.csv",header=TRUE); 
stem90_13 <- read.csv(file="Shooting stem/stem90/stem_90_13_2.csv",header=TRUE);
stem90_14 <- read.csv(file="Shooting stem/stem90/stem_90_14_2.csv",header=TRUE);
stem90_15 <- read.csv(file="Shooting stem/stem90/stem_90_15_2.csv",header=TRUE);
stem90_16 <- read.csv(file="Shooting stem/stem90/stem_90_16_2.csv",header=TRUE);
stem90_17 <- read.csv(file="Shooting stem/stem90/stem_90_17_2.csv",header=TRUE);
stem90_18 <- read.csv(file="Shooting stem/stem90/stem_90_18_2.csv",header=TRUE);
stem90_19 <- read.csv(file="Shooting stem/stem90/stem_90_19_2.csv",header=TRUE); 
stem90_20 <- read.csv(file="Shooting stem/stem90/stem_90_20_2.csv",header=TRUE);
stem90_21 <- read.csv(file="Shooting stem/stem90/stem_90_21_2.csv",header=TRUE);
stem90_22 <- read.csv(file="Shooting stem/stem90/stem_90_22_2.csv",header=TRUE);
stem90_23 <- read.csv(file="Shooting stem/stem90/stem_90_23_2.csv",header=TRUE);
stem90_24 <- read.csv(file="Shooting stem/stem90/stem_90_24_2.csv",header=TRUE);
stem90_25 <- read.csv(file="Shooting stem/stem90/stem_90_25_2.csv",header=TRUE);
stem90_26 <- read.csv(file="Shooting stem/stem90/stem_90_26_2.csv",header=TRUE);
stem90_27 <- read.csv(file="Shooting stem/stem90/stem_90_27_2.csv",header=TRUE);
stem90_28 <- read.csv(file="Shooting stem/stem90/stem_90_28_2.csv",header=TRUE);

time_int <- "1 hour";
stem90_11t <- full_seq_time_stem(time_tweets(stem90_11,time_int));
stem90_12t <- full_seq_time_stem(time_tweets(stem90_12,time_int));
stem90_13t <- full_seq_time_stem(time_tweets(stem90_13,time_int));
stem90_14t <- full_seq_time_stem(time_tweets(stem90_14,time_int));
stem90_15t <- full_seq_time_stem(time_tweets(stem90_15,time_int));
stem90_16t <- full_seq_time_stem(time_tweets(stem90_16,time_int));
stem90_17t <- full_seq_time_stem(time_tweets(stem90_17,time_int));
stem90_18t <- full_seq_time_stem(time_tweets(stem90_18,time_int));
stem90_19t <- full_seq_time_stem(time_tweets(stem90_19,time_int));
stem90_20t <- full_seq_time_stem(time_tweets(stem90_20,time_int));
stem90_21t <- full_seq_time_stem(time_tweets(stem90_21,time_int));
stem90_22t <- full_seq_time_stem(time_tweets(stem90_22,time_int));
stem90_23t <- full_seq_time_stem(time_tweets(stem90_23,time_int));
stem90_24t <- full_seq_time_stem(time_tweets(stem90_24,time_int));
stem90_25t <- full_seq_time_stem(time_tweets(stem90_25,time_int));
stem90_26t <- full_seq_time_stem(time_tweets(stem90_26,time_int));
stem90_27t <- full_seq_time_stem(time_tweets(stem90_27,time_int));
stem90_28t <- full_seq_time_stem(time_tweets(stem90_28,time_int));

event_time2 <- round_date(event_time,time_int);

stem90_time <- data.frame(stem90_12t$Time,stem90_11t$Number_of_Tweets,stem90_12t$Number_of_Tweets,stem90_13t$Number_of_Tweets,stem90_14t$Number_of_Tweets,stem90_15t$Number_of_Tweets,
                          stem90_16t$Number_of_Tweets,stem90_17t$Number_of_Tweets,stem90_18t$Number_of_Tweets,stem90_19t$Number_of_Tweets,stem90_20t$Number_of_Tweets,
                          stem90_21t$Number_of_Tweets,stem90_22t$Number_of_Tweets,stem90_23t$Number_of_Tweets,stem90_24t$Number_of_Tweets,stem90_25t$Number_of_Tweets,
                          stem90_26t$Number_of_Tweets,stem90_27t$Number_of_Tweets,stem90_28t$Number_of_Tweets)
colnames(stem90_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_ind <- which(stem90_time$Time==event_time2);
stem90_time_melt <- melt(stem90_time,id.vars = "Time")

ggplot(data = stem90_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="stem Attacks 90 deg")
write.csv(stem90_time,file="stem90_time.csv");
