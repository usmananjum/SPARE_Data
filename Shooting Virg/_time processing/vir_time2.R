virg2_11 <- read.csv(file="virg_shooting/virg2/virg_30_11_2.csv",header=TRUE); #event at 2 mile
virg2_12 <- read.csv(file="virg_shooting/virg2/virg_30_12_2.csv",header=TRUE); 
virg2_13 <- read.csv(file="virg_shooting/virg2/virg_30_13_2.csv",header=TRUE);
virg2_14 <- read.csv(file="virg_shooting/virg2/virg_30_14_2.csv",header=TRUE);
virg2_15 <- read.csv(file="virg_shooting/virg2/virg_30_15_2.csv",header=TRUE);
virg2_16 <- read.csv(file="virg_shooting/virg2/virg_30_16_2.csv",header=TRUE);
virg2_17 <- read.csv(file="virg_shooting/virg2/virg_30_17_2.csv",header=TRUE);
virg2_18 <- read.csv(file="virg_shooting/virg2/virg_30_18_2.csv",header=TRUE);
virg2_19 <- read.csv(file="virg_shooting/virg2/virg_30_19_2.csv",header=TRUE); 
virg2_20 <- read.csv(file="virg_shooting/virg2/virg_30_20_2.csv",header=TRUE);
virg2_21 <- read.csv(file="virg_shooting/virg2/virg_30_21_2.csv",header=TRUE);
virg2_22 <- read.csv(file="virg_shooting/virg2/virg_30_22_2.csv",header=TRUE);
virg2_23 <- read.csv(file="virg_shooting/virg2/virg_30_23_2.csv",header=TRUE);
virg2_24 <- read.csv(file="virg_shooting/virg2/virg_30_24_2.csv",header=TRUE);
virg2_25 <- read.csv(file="virg_shooting/virg2/virg_30_25_2.csv",header=TRUE);
virg2_26 <- read.csv(file="virg_shooting/virg2/virg_30_26_2.csv",header=TRUE);
virg2_27 <- read.csv(file="virg_shooting/virg2/virg_30_27_2.csv",header=TRUE);
virg2_28 <- read.csv(file="virg_shooting/virg2/virg_30_28_2.csv",header=TRUE);

time_int <- "1 hour";
virg2_11t <- full_seq_time(time_tweets(virg2_11,time_int));
virg2_12t <- full_seq_time(time_tweets(virg2_12,time_int));
virg2_13t <- full_seq_time(time_tweets(virg2_13,time_int));
virg2_14t <- full_seq_time(time_tweets(virg2_14,time_int));
virg2_15t <- full_seq_time(time_tweets(virg2_15,time_int));
virg2_16t <- full_seq_time(time_tweets(virg2_16,time_int));
virg2_17t <- full_seq_time(time_tweets(virg2_17,time_int));
virg2_18t <- full_seq_time(time_tweets(virg2_18,time_int));
virg2_19t <- full_seq_time(time_tweets(virg2_19,time_int));
virg2_20t <- full_seq_time(time_tweets(virg2_20,time_int));
virg2_21t <- full_seq_time(time_tweets(virg2_21,time_int));
virg2_22t <- full_seq_time(time_tweets(virg2_22,time_int));
virg2_23t <- full_seq_time(time_tweets(virg2_23,time_int));
virg2_24t <- full_seq_time(time_tweets(virg2_24,time_int));
virg2_25t <- full_seq_time(time_tweets(virg2_25,time_int));
virg2_26t <- full_seq_time(time_tweets(virg2_26,time_int));
virg2_27t <- full_seq_time(time_tweets(virg2_27,time_int));
virg2_28t <- full_seq_time(time_tweets(virg2_28,time_int));

virg2_time <- data.frame(virg2_12t$Time,virg2_11t$Number_of_Tweets,virg2_12t$Number_of_Tweets,virg2_13t$Number_of_Tweets,virg2_14t$Number_of_Tweets,virg2_15t$Number_of_Tweets,
                         virg2_16t$Number_of_Tweets,virg2_17t$Number_of_Tweets,virg2_18t$Number_of_Tweets,virg2_19t$Number_of_Tweets,virg2_20t$Number_of_Tweets,
                         virg2_21t$Number_of_Tweets,virg2_22t$Number_of_Tweets,virg2_23t$Number_of_Tweets,virg2_24t$Number_of_Tweets,virg2_25t$Number_of_Tweets,
                         virg2_26t$Number_of_Tweets,virg2_27t$Number_of_Tweets,virg2_28t$Number_of_Tweets)
colnames(virg2_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

virg2_time_melt <- melt(virg2_time,id.vars = "Time")

ggplot() + geom_line(data = virg2_time_melt,aes(Time,value,col=variable)) + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="virg Attacks 90 deg")
write.csv(virg2_time,file="virg2_time.csv");