# virg3_11 <- read.csv(file="virg_shooting/virg3/virg_90_11_2.csv",header=TRUE); #event at 2 mile; 0 tweets
# virg3_12 <- read.csv(file="virg_shooting/virg3/virg_90_12_2.csv",header=TRUE); 
# virg3_13 <- read.csv(file="virg_shooting/virg3/virg_90_13_2.csv",header=TRUE);
# virg3_14 <- read.csv(file="virg_shooting/virg3/virg_90_14_2.csv",header=TRUE);
virg3_15 <- read.csv(file="virg_shooting/virg3/virg_90_15_2.csv",header=TRUE);
virg3_16 <- read.csv(file="virg_shooting/virg3/virg_90_16_2.csv",header=TRUE);
virg3_17 <- read.csv(file="virg_shooting/virg3/virg_90_17_2.csv",header=TRUE);
virg3_18 <- read.csv(file="virg_shooting/virg3/virg_90_18_2.csv",header=TRUE);
virg3_19 <- read.csv(file="virg_shooting/virg3/virg_90_19_2.csv",header=TRUE); 
virg3_20 <- read.csv(file="virg_shooting/virg3/virg_90_20_2.csv",header=TRUE);
virg3_21 <- read.csv(file="virg_shooting/virg3/virg_90_21_2.csv",header=TRUE);
virg3_22 <- read.csv(file="virg_shooting/virg3/virg_90_22_2.csv",header=TRUE);
virg3_23 <- read.csv(file="virg_shooting/virg3/virg_90_23_2.csv",header=TRUE);
virg3_24 <- read.csv(file="virg_shooting/virg3/virg_90_24_2.csv",header=TRUE);
virg3_25 <- read.csv(file="virg_shooting/virg3/virg_90_25_2.csv",header=TRUE);
virg3_26 <- read.csv(file="virg_shooting/virg3/virg_90_26_2.csv",header=TRUE);
virg3_27 <- read.csv(file="virg_shooting/virg3/virg_90_27_2.csv",header=TRUE);
virg3_28 <- read.csv(file="virg_shooting/virg3/virg_90_28_2.csv",header=TRUE);

time_int <- "1 hour";
# virg3_11t <- full_seq_time(time_tweets(virg3_11,time_int));
# virg3_12t <- full_seq_time(time_tweets(virg3_12,time_int));
# virg3_13t <- full_seq_time(time_tweets(virg3_13,time_int));
# virg3_14t <- full_seq_time(time_tweets(virg3_14,time_int));
virg3_15t <- full_seq_time(time_tweets(virg3_15,time_int));
virg3_16t <- full_seq_time(time_tweets(virg3_16,time_int));
virg3_17t <- full_seq_time(time_tweets(virg3_17,time_int));
virg3_18t <- full_seq_time(time_tweets(virg3_18,time_int));
virg3_19t <- full_seq_time(time_tweets(virg3_19,time_int));
virg3_20t <- full_seq_time(time_tweets(virg3_20,time_int));
virg3_21t <- full_seq_time(time_tweets(virg3_21,time_int));
virg3_22t <- full_seq_time(time_tweets(virg3_22,time_int));
virg3_23t <- full_seq_time(time_tweets(virg3_23,time_int));
virg3_24t <- full_seq_time(time_tweets(virg3_24,time_int));
virg3_25t <- full_seq_time(time_tweets(virg3_25,time_int));
virg3_26t <- full_seq_time(time_tweets(virg3_26,time_int));
virg3_27t <- full_seq_time(time_tweets(virg3_27,time_int));
virg3_28t <- full_seq_time(time_tweets(virg3_28,time_int));

virg3_time <- data.frame(virg3_15t$Time,# virg3_11t$Number_of_Tweets,virg3_12t$Number_of_Tweets,virg3_13t$Number_of_Tweets,virg3_14t$Number_of_Tweets,
                         virg3_15t$Number_of_Tweets,
                         virg3_16t$Number_of_Tweets,virg3_17t$Number_of_Tweets,virg3_18t$Number_of_Tweets,virg3_19t$Number_of_Tweets,virg3_20t$Number_of_Tweets,
                         virg3_21t$Number_of_Tweets,virg3_22t$Number_of_Tweets,virg3_23t$Number_of_Tweets,virg3_24t$Number_of_Tweets,virg3_25t$Number_of_Tweets,
                         virg3_26t$Number_of_Tweets,virg3_27t$Number_of_Tweets,virg3_28t$Number_of_Tweets)
colnames(virg3_time) <- c('Time',#'1.1','1.2','1.3','1.4',
                          '1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

virg3_time_melt <- melt(virg3_time,id.vars = "Time")

ggplot() + geom_line(data = virg3_time_melt,aes(Time,value,col=variable)) + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="virg Attacks 180 deg")
write.csv(virg3_time,file="virg3_time.csv");