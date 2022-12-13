library(lubridate)
library(ggplot2)
library(reshape2)

event_time_gar <- strptime("2019-07-28 17:40:00","%Y-%m-%d %H:%M:%S");

gar3_11 <- read.csv(file="Garlic_fest/gar3/gar_270_11_2.csv",header=TRUE); #event at 2 mile
gar3_12 <- read.csv(file="Garlic_fest/gar3/gar_270_12_2.csv",header=TRUE); 
gar3_13 <- read.csv(file="Garlic_fest/gar3/gar_270_13_2.csv",header=TRUE);
gar3_14 <- read.csv(file="Garlic_fest/gar3/gar_270_14_2.csv",header=TRUE);
gar3_15 <- read.csv(file="Garlic_fest/gar3/gar_270_15_2.csv",header=TRUE);
gar3_16 <- read.csv(file="Garlic_fest/gar3/gar_270_16_2.csv",header=TRUE);
gar3_17 <- read.csv(file="Garlic_fest/gar3/gar_270_17_2.csv",header=TRUE);
gar3_18 <- read.csv(file="Garlic_fest/gar3/gar_270_18_2.csv",header=TRUE);
gar3_19 <- read.csv(file="Garlic_fest/gar3/gar_270_19_2.csv",header=TRUE); 
gar3_20 <- read.csv(file="Garlic_fest/gar3/gar_270_20_2.csv",header=TRUE);
gar3_21 <- read.csv(file="Garlic_fest/gar3/gar_270_21_2.csv",header=TRUE);
gar3_22 <- read.csv(file="Garlic_fest/gar3/gar_270_22_2.csv",header=TRUE);
gar3_23 <- read.csv(file="Garlic_fest/gar3/gar_270_23_2.csv",header=TRUE);
gar3_24 <- read.csv(file="Garlic_fest/gar3/gar_270_24_2.csv",header=TRUE);
gar3_25 <- read.csv(file="Garlic_fest/gar3/gar_270_25_2.csv",header=TRUE);
gar3_26 <- read.csv(file="Garlic_fest/gar3/gar_270_26_2.csv",header=TRUE);
gar3_27 <- read.csv(file="Garlic_fest/gar3/gar_270_27_2.csv",header=TRUE);
gar3_28 <- read.csv(file="Garlic_fest/gar3/gar_270_28_2.csv",header=TRUE);

time_int <- "1 hour";
gar3_11t <- full_seq_time(time_tweets(gar3_11,time_int));
gar3_12t <- full_seq_time(time_tweets(gar3_12,time_int));
gar3_13t <- full_seq_time(time_tweets(gar3_13,time_int));
gar3_14t <- full_seq_time(time_tweets(gar3_14,time_int));
gar3_15t <- full_seq_time(time_tweets(gar3_15,time_int));
gar3_16t <- full_seq_time(time_tweets(gar3_16,time_int));
gar3_17t <- full_seq_time(time_tweets(gar3_17,time_int));
gar3_18t <- full_seq_time(time_tweets(gar3_18,time_int));
gar3_19t <- full_seq_time(time_tweets(gar3_19,time_int));
gar3_20t <- full_seq_time(time_tweets(gar3_20,time_int));
gar3_21t <- full_seq_time(time_tweets(gar3_21,time_int));
gar3_22t <- full_seq_time(time_tweets(gar3_22,time_int));
gar3_23t <- full_seq_time(time_tweets(gar3_23,time_int));
gar3_24t <- full_seq_time(time_tweets(gar3_24,time_int));
gar3_25t <- full_seq_time(time_tweets(gar3_25,time_int));
gar3_26t <- full_seq_time(time_tweets(gar3_26,time_int));
gar3_27t <- full_seq_time(time_tweets(gar3_27,time_int));
gar3_28t <- full_seq_time(time_tweets(gar3_28,time_int));

gar3_time <- data.frame(gar3_12t$Time,gar3_11t$Number_of_Tweets,gar3_12t$Number_of_Tweets,gar3_13t$Number_of_Tweets,gar3_14t$Number_of_Tweets,gar3_15t$Number_of_Tweets,
                        gar3_16t$Number_of_Tweets,gar3_17t$Number_of_Tweets,gar3_18t$Number_of_Tweets,gar3_19t$Number_of_Tweets,gar3_20t$Number_of_Tweets,
                        gar3_21t$Number_of_Tweets,gar3_22t$Number_of_Tweets,gar3_23t$Number_of_Tweets,gar3_24t$Number_of_Tweets,gar3_25t$Number_of_Tweets,
                        gar3_26t$Number_of_Tweets,gar3_27t$Number_of_Tweets,gar3_28t$Number_of_Tweets)
colnames(gar3_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_gar,time_int);
event_ind <- which(gar3_time$Time==event_time2);
gar3_time_melt <- melt(gar3_time,id.vars = "Time")

ggplot(data = gar3_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_gar) + labs(title="gar Attacks 0 deg")
write.csv(gar3_time,file="gar3_time.csv");
