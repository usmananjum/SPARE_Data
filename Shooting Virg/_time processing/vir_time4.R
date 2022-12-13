virg4_11 <- read.csv(file="Shooting Virg/virg4/virg_270_11_2.csv",header=TRUE); #event at 2 mile
virg4_12 <- read.csv(file="Shooting Virg/virg4/virg_270_12_2.csv",header=TRUE); 
virg4_13 <- read.csv(file="Shooting Virg/virg4/virg_270_13_2.csv",header=TRUE);
virg4_14 <- read.csv(file="Shooting Virg/virg4/virg_270_14_2.csv",header=TRUE);
virg4_15 <- read.csv(file="Shooting Virg/virg4/virg_270_15_2.csv",header=TRUE);
virg4_16 <- read.csv(file="Shooting Virg/virg4/virg_270_16_2.csv",header=TRUE);
virg4_17 <- read.csv(file="Shooting Virg/virg4/virg_270_17_2.csv",header=TRUE);
virg4_18 <- read.csv(file="Shooting Virg/virg4/virg_270_18_2.csv",header=TRUE);
virg4_19 <- read.csv(file="Shooting Virg/virg4/virg_270_19_2.csv",header=TRUE); 
virg4_20 <- read.csv(file="Shooting Virg/virg4/virg_270_20_2.csv",header=TRUE);
virg4_21 <- read.csv(file="Shooting Virg/virg4/virg_270_21_2.csv",header=TRUE);
virg4_22 <- read.csv(file="Shooting Virg/virg4/virg_270_22_2.csv",header=TRUE);
virg4_23 <- read.csv(file="Shooting Virg/virg4/virg_270_23_2.csv",header=TRUE);
virg4_24 <- read.csv(file="Shooting Virg/virg4/virg_270_24_2.csv",header=TRUE);
virg4_25 <- read.csv(file="Shooting Virg/virg4/virg_270_25_2.csv",header=TRUE);
virg4_26 <- read.csv(file="Shooting Virg/virg4/virg_270_26_2.csv",header=TRUE);
virg4_27 <- read.csv(file="Shooting Virg/virg4/virg_270_27_2.csv",header=TRUE);
virg4_28 <- read.csv(file="Shooting Virg/virg4/virg_270_28_2.csv",header=TRUE);

time_int <- "1 hour";
virg4_11t <- full_seq_time(time_tweets(virg4_11,time_int));
virg4_12t <- full_seq_time(time_tweets(virg4_12,time_int));
virg4_13t <- full_seq_time(time_tweets(virg4_13,time_int));
virg4_14t <- full_seq_time(time_tweets(virg4_14,time_int));
virg4_15t <- full_seq_time(time_tweets(virg4_15,time_int));
virg4_16t <- full_seq_time(time_tweets(virg4_16,time_int));
virg4_17t <- full_seq_time(time_tweets(virg4_17,time_int));
virg4_18t <- full_seq_time(time_tweets(virg4_18,time_int));
virg4_19t <- full_seq_time(time_tweets(virg4_19,time_int));
virg4_20t <- full_seq_time(time_tweets(virg4_20,time_int));
virg4_21t <- full_seq_time(time_tweets(virg4_21,time_int));
virg4_22t <- full_seq_time(time_tweets(virg4_22,time_int));
virg4_23t <- full_seq_time(time_tweets(virg4_23,time_int));
virg4_24t <- full_seq_time(time_tweets(virg4_24,time_int));
virg4_25t <- full_seq_time(time_tweets(virg4_25,time_int));
virg4_26t <- full_seq_time(time_tweets(virg4_26,time_int));
virg4_27t <- full_seq_time(time_tweets(virg4_27,time_int));
virg4_28t <- full_seq_time(time_tweets(virg4_28,time_int));

virg4_time <- data.frame(virg4_12t$Time,virg4_11t$Number_of_Tweets,virg4_12t$Number_of_Tweets,virg4_13t$Number_of_Tweets,virg4_14t$Number_of_Tweets,virg4_15t$Number_of_Tweets,
                         virg4_16t$Number_of_Tweets,virg4_17t$Number_of_Tweets,virg4_18t$Number_of_Tweets,virg4_19t$Number_of_Tweets,virg4_20t$Number_of_Tweets,
                         virg4_21t$Number_of_Tweets,virg4_22t$Number_of_Tweets,virg4_23t$Number_of_Tweets,virg4_24t$Number_of_Tweets,virg4_25t$Number_of_Tweets,
                         virg4_26t$Number_of_Tweets,virg4_27t$Number_of_Tweets,virg4_28t$Number_of_Tweets)
colnames(virg4_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

virg4_time_melt <- melt(virg4_time,id.vars = "Time")

ggplot() + geom_line(data = virg4_time_melt,aes(Time,value,col=variable)) + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time) + labs(title="virg Attacks 270 deg")
write.csv(virg4_time,file="virg4_time.csv");