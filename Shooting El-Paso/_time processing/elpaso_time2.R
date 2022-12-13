library(lubridate)
library(ggplot2)
library(reshape2)

elpaso2_11 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_11_2.csv",header=TRUE); #event at 2 mile
elpaso2_12 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_12_2.csv",header=TRUE); 
elpaso2_13 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_13_2.csv",header=TRUE);
elpaso2_14 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_14_2.csv",header=TRUE);
elpaso2_15 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_15_2.csv",header=TRUE);
elpaso2_16 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_16_2.csv",header=TRUE);
elpaso2_17 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_17_2.csv",header=TRUE);
elpaso2_18 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_18_2.csv",header=TRUE);
elpaso2_19 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_19_2.csv",header=TRUE); 
elpaso2_20 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_20_2.csv",header=TRUE);
elpaso2_21 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_21_2.csv",header=TRUE);
elpaso2_22 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_22_2.csv",header=TRUE);
elpaso2_23 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_23_2.csv",header=TRUE);
elpaso2_24 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_24_2.csv",header=TRUE);
elpaso2_25 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_25_2.csv",header=TRUE);
elpaso2_26 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_26_2.csv",header=TRUE);
elpaso2_27 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_27_2.csv",header=TRUE);
elpaso2_28 <- read.csv(file="Shooting El-Paso/elpaso2/elpaso_90_28_2.csv",header=TRUE);

time_int <- "1 hour";
elpaso2_11t <- full_seq_time(time_tweets(elpaso2_11,time_int));
elpaso2_12t <- full_seq_time(time_tweets(elpaso2_12,time_int));
elpaso2_13t <- full_seq_time(time_tweets(elpaso2_13,time_int));
elpaso2_14t <- full_seq_time(time_tweets(elpaso2_14,time_int));
elpaso2_15t <- full_seq_time(time_tweets(elpaso2_15,time_int));
elpaso2_16t <- full_seq_time(time_tweets(elpaso2_16,time_int));
elpaso2_17t <- full_seq_time(time_tweets(elpaso2_17,time_int));
elpaso2_18t <- full_seq_time(time_tweets(elpaso2_18,time_int));
elpaso2_19t <- full_seq_time(time_tweets(elpaso2_19,time_int));
elpaso2_20t <- full_seq_time(time_tweets(elpaso2_20,time_int));
elpaso2_21t <- full_seq_time(time_tweets(elpaso2_21,time_int));
elpaso2_22t <- full_seq_time(time_tweets(elpaso2_22,time_int));
elpaso2_23t <- full_seq_time(time_tweets(elpaso2_23,time_int));
elpaso2_24t <- full_seq_time(time_tweets(elpaso2_24,time_int));
elpaso2_25t <- full_seq_time(time_tweets(elpaso2_25,time_int));
elpaso2_26t <- full_seq_time(time_tweets(elpaso2_26,time_int));
elpaso2_27t <- full_seq_time(time_tweets(elpaso2_27,time_int));
elpaso2_28t <- full_seq_time(time_tweets(elpaso2_28,time_int));

elpaso2_time <- data.frame(elpaso2_12t$Time,elpaso2_11t$Number_of_Tweets,elpaso2_12t$Number_of_Tweets,elpaso2_13t$Number_of_Tweets,elpaso2_14t$Number_of_Tweets,elpaso2_15t$Number_of_Tweets,
                        elpaso2_16t$Number_of_Tweets,elpaso2_17t$Number_of_Tweets,elpaso2_18t$Number_of_Tweets,elpaso2_19t$Number_of_Tweets,elpaso2_20t$Number_of_Tweets,
                        elpaso2_21t$Number_of_Tweets,elpaso2_22t$Number_of_Tweets,elpaso2_23t$Number_of_Tweets,elpaso2_24t$Number_of_Tweets,elpaso2_25t$Number_of_Tweets,
                        elpaso2_26t$Number_of_Tweets,elpaso2_27t$Number_of_Tweets,elpaso2_28t$Number_of_Tweets)
colnames(elpaso2_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_elpaso,time_int);
event_ind <- which(elpaso2_time$Time==event_time2);
elpaso2_time_melt <- melt(elpaso2_time,id.vars = "Time")

ggplot(data = elpaso2_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_elpaso) + labs(title="elpaso Attacks 0 deg")
write.csv(elpaso2_time,file="elpaso2_time.csv");
