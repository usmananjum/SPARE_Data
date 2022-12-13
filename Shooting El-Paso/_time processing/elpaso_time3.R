library(lubridate)
library(ggplot2)
library(reshape2)

elpaso3_11 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_11_2.csv",header=TRUE); #event at 2 mile
elpaso3_12 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_12_2.csv",header=TRUE); 
elpaso3_13 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_13_2.csv",header=TRUE);
elpaso3_14 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_14_2.csv",header=TRUE);
elpaso3_15 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_15_2.csv",header=TRUE);
elpaso3_16 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_16_2.csv",header=TRUE);
elpaso3_17 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_17_2.csv",header=TRUE);
elpaso3_18 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_18_2.csv",header=TRUE);
elpaso3_19 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_19_2.csv",header=TRUE); 
elpaso3_20 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_20_2.csv",header=TRUE);
elpaso3_21 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_21_2.csv",header=TRUE);
elpaso3_22 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_22_2.csv",header=TRUE);
elpaso3_23 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_23_2.csv",header=TRUE);
elpaso3_24 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_24_2.csv",header=TRUE);
elpaso3_25 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_25_2.csv",header=TRUE);
elpaso3_26 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_26_2.csv",header=TRUE);
elpaso3_27 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_27_2.csv",header=TRUE);
elpaso3_28 <- read.csv(file="Shooting El-Paso/elpaso3/elpaso_270_28_2.csv",header=TRUE);

time_int <- "1 hour";
elpaso3_11t <- full_seq_time(time_tweets(elpaso3_11,time_int));
elpaso3_12t <- full_seq_time(time_tweets(elpaso3_12,time_int));
elpaso3_13t <- full_seq_time(time_tweets(elpaso3_13,time_int));
elpaso3_14t <- full_seq_time(time_tweets(elpaso3_14,time_int));
elpaso3_15t <- full_seq_time(time_tweets(elpaso3_15,time_int));
elpaso3_16t <- full_seq_time(time_tweets(elpaso3_16,time_int));
elpaso3_17t <- full_seq_time(time_tweets(elpaso3_17,time_int));
elpaso3_18t <- full_seq_time(time_tweets(elpaso3_18,time_int));
elpaso3_19t <- full_seq_time(time_tweets(elpaso3_19,time_int));
elpaso3_20t <- full_seq_time(time_tweets(elpaso3_20,time_int));
elpaso3_21t <- full_seq_time(time_tweets(elpaso3_21,time_int));
elpaso3_22t <- full_seq_time(time_tweets(elpaso3_22,time_int));
elpaso3_23t <- full_seq_time(time_tweets(elpaso3_23,time_int));
elpaso3_24t <- full_seq_time(time_tweets(elpaso3_24,time_int));
elpaso3_25t <- full_seq_time(time_tweets(elpaso3_25,time_int));
elpaso3_26t <- full_seq_time(time_tweets(elpaso3_26,time_int));
elpaso3_27t <- full_seq_time(time_tweets(elpaso3_27,time_int));
elpaso3_28t <- full_seq_time(time_tweets(elpaso3_28,time_int));

elpaso3_time <- data.frame(elpaso3_12t$Time,elpaso3_11t$Number_of_Tweets,elpaso3_12t$Number_of_Tweets,elpaso3_13t$Number_of_Tweets,elpaso3_14t$Number_of_Tweets,elpaso3_15t$Number_of_Tweets,
                        elpaso3_16t$Number_of_Tweets,elpaso3_17t$Number_of_Tweets,elpaso3_18t$Number_of_Tweets,elpaso3_19t$Number_of_Tweets,elpaso3_20t$Number_of_Tweets,
                        elpaso3_21t$Number_of_Tweets,elpaso3_22t$Number_of_Tweets,elpaso3_23t$Number_of_Tweets,elpaso3_24t$Number_of_Tweets,elpaso3_25t$Number_of_Tweets,
                        elpaso3_26t$Number_of_Tweets,elpaso3_27t$Number_of_Tweets,elpaso3_28t$Number_of_Tweets)
colnames(elpaso3_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_elpaso,time_int);
event_ind <- which(elpaso3_time$Time==event_time2);
elpaso3_time_melt <- melt(elpaso3_time,id.vars = "Time")

ggplot(data = elpaso3_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_elpaso) + labs(title="elpaso Attacks 0 deg")
write.csv(elpaso3_time,file="elpaso3_time.csv");
