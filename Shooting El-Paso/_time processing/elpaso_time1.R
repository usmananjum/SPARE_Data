library(lubridate)
library(ggplot2)
library(reshape2)

elpaso1_11 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_11_2.csv",header=TRUE); #event at 2 mile
elpaso1_12 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_12_2.csv",header=TRUE); 
elpaso1_13 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_13_2.csv",header=TRUE);
elpaso1_14 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_14_2.csv",header=TRUE);
elpaso1_15 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_15_2.csv",header=TRUE);
elpaso1_16 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_16_2.csv",header=TRUE);
elpaso1_17 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_17_2.csv",header=TRUE);
elpaso1_18 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_18_2.csv",header=TRUE);
elpaso1_19 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_19_2.csv",header=TRUE); 
elpaso1_20 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_20_2.csv",header=TRUE);
elpaso1_21 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_21_2.csv",header=TRUE);
elpaso1_22 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_22_2.csv",header=TRUE);
elpaso1_23 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_23_2.csv",header=TRUE);
elpaso1_24 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_24_2.csv",header=TRUE);
elpaso1_25 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_25_2.csv",header=TRUE);
elpaso1_26 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_26_2.csv",header=TRUE);
elpaso1_27 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_27_2.csv",header=TRUE);
elpaso1_28 <- read.csv(file="Shooting El-Paso/elpaso1/elpaso_30_28_2.csv",header=TRUE);

time_int <- "1 hour";
elpaso1_11t <- full_seq_time(time_tweets(elpaso1_11,time_int));
elpaso1_12t <- full_seq_time(time_tweets(elpaso1_12,time_int));
elpaso1_13t <- full_seq_time(time_tweets(elpaso1_13,time_int));
elpaso1_14t <- full_seq_time(time_tweets(elpaso1_14,time_int));
elpaso1_15t <- full_seq_time(time_tweets(elpaso1_15,time_int));
elpaso1_16t <- full_seq_time(time_tweets(elpaso1_16,time_int));
elpaso1_17t <- full_seq_time(time_tweets(elpaso1_17,time_int));
elpaso1_18t <- full_seq_time(time_tweets(elpaso1_18,time_int));
elpaso1_19t <- full_seq_time(time_tweets(elpaso1_19,time_int));
elpaso1_20t <- full_seq_time(time_tweets(elpaso1_20,time_int));
elpaso1_21t <- full_seq_time(time_tweets(elpaso1_21,time_int));
elpaso1_22t <- full_seq_time(time_tweets(elpaso1_22,time_int));
elpaso1_23t <- full_seq_time(time_tweets(elpaso1_23,time_int));
elpaso1_24t <- full_seq_time(time_tweets(elpaso1_24,time_int));
elpaso1_25t <- full_seq_time(time_tweets(elpaso1_25,time_int));
elpaso1_26t <- full_seq_time(time_tweets(elpaso1_26,time_int));
elpaso1_27t <- full_seq_time(time_tweets(elpaso1_27,time_int));
elpaso1_28t <- full_seq_time(time_tweets(elpaso1_28,time_int));

elpaso1_time <- data.frame(elpaso1_12t$Time,elpaso1_11t$Number_of_Tweets,elpaso1_12t$Number_of_Tweets,elpaso1_13t$Number_of_Tweets,elpaso1_14t$Number_of_Tweets,elpaso1_15t$Number_of_Tweets,
                        elpaso1_16t$Number_of_Tweets,elpaso1_17t$Number_of_Tweets,elpaso1_18t$Number_of_Tweets,elpaso1_19t$Number_of_Tweets,elpaso1_20t$Number_of_Tweets,
                        elpaso1_21t$Number_of_Tweets,elpaso1_22t$Number_of_Tweets,elpaso1_23t$Number_of_Tweets,elpaso1_24t$Number_of_Tweets,elpaso1_25t$Number_of_Tweets,
                        elpaso1_26t$Number_of_Tweets,elpaso1_27t$Number_of_Tweets,elpaso1_28t$Number_of_Tweets)
colnames(elpaso1_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_elpaso,time_int);
event_ind <- which(elpaso1_time$Time==event_time2);
elpaso1_time_melt <- melt(elpaso1_time,id.vars = "Time")

ggplot(data = elpaso1_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_elpaso) + labs(title="elpaso Attacks 0 deg")
write.csv(elpaso1_time,file="elpaso1_time.csv");
