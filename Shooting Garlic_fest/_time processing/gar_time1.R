library(lubridate)
library(ggplot2)
library(reshape2)

event_time_gar <- strptime("2019-07-28 17:40:00","%Y-%m-%d %H:%M:%S");

gar1_11 <- read.csv(file="Garlic_fest/gar1/gar_30_11_2.csv",header=TRUE); #event at 2 mile
gar1_12 <- read.csv(file="Garlic_fest/gar1/gar_30_12_2.csv",header=TRUE); 
gar1_13 <- read.csv(file="Garlic_fest/gar1/gar_30_13_2.csv",header=TRUE);
gar1_14 <- read.csv(file="Garlic_fest/gar1/gar_30_14_2.csv",header=TRUE);
gar1_15 <- read.csv(file="Garlic_fest/gar1/gar_30_15_2.csv",header=TRUE);
gar1_16 <- read.csv(file="Garlic_fest/gar1/gar_30_16_2.csv",header=TRUE);
gar1_17 <- read.csv(file="Garlic_fest/gar1/gar_30_17_2.csv",header=TRUE);
gar1_18 <- read.csv(file="Garlic_fest/gar1/gar_30_18_2.csv",header=TRUE);
gar1_19 <- read.csv(file="Garlic_fest/gar1/gar_30_19_2.csv",header=TRUE); 
gar1_20 <- read.csv(file="Garlic_fest/gar1/gar_30_20_2.csv",header=TRUE);
gar1_21 <- read.csv(file="Garlic_fest/gar1/gar_30_21_2.csv",header=TRUE);
gar1_22 <- read.csv(file="Garlic_fest/gar1/gar_30_22_2.csv",header=TRUE);
gar1_23 <- read.csv(file="Garlic_fest/gar1/gar_30_23_2.csv",header=TRUE);
gar1_24 <- read.csv(file="Garlic_fest/gar1/gar_30_24_2.csv",header=TRUE);
gar1_25 <- read.csv(file="Garlic_fest/gar1/gar_30_25_2.csv",header=TRUE);
gar1_26 <- read.csv(file="Garlic_fest/gar1/gar_30_26_2.csv",header=TRUE);
gar1_27 <- read.csv(file="Garlic_fest/gar1/gar_30_27_2.csv",header=TRUE);
gar1_28 <- read.csv(file="Garlic_fest/gar1/gar_30_28_2.csv",header=TRUE);

time_int <- "1 hour";
gar1_11t <- full_seq_time(time_tweets(gar1_11,time_int));
gar1_12t <- full_seq_time(time_tweets(gar1_12,time_int));
gar1_13t <- full_seq_time(time_tweets(gar1_13,time_int));
gar1_14t <- full_seq_time(time_tweets(gar1_14,time_int));
gar1_15t <- full_seq_time(time_tweets(gar1_15,time_int));
gar1_16t <- full_seq_time(time_tweets(gar1_16,time_int));
gar1_17t <- full_seq_time(time_tweets(gar1_17,time_int));
gar1_18t <- full_seq_time(time_tweets(gar1_18,time_int));
gar1_19t <- full_seq_time(time_tweets(gar1_19,time_int));
gar1_20t <- full_seq_time(time_tweets(gar1_20,time_int));
gar1_21t <- full_seq_time(time_tweets(gar1_21,time_int));
gar1_22t <- full_seq_time(time_tweets(gar1_22,time_int));
gar1_23t <- full_seq_time(time_tweets(gar1_23,time_int));
gar1_24t <- full_seq_time(time_tweets(gar1_24,time_int));
gar1_25t <- full_seq_time(time_tweets(gar1_25,time_int));
gar1_26t <- full_seq_time(time_tweets(gar1_26,time_int));
gar1_27t <- full_seq_time(time_tweets(gar1_27,time_int));
gar1_28t <- full_seq_time(time_tweets(gar1_28,time_int));

gar1_time <- data.frame(gar1_12t$Time,gar1_11t$Number_of_Tweets,gar1_12t$Number_of_Tweets,gar1_13t$Number_of_Tweets,gar1_14t$Number_of_Tweets,gar1_15t$Number_of_Tweets,
                        gar1_16t$Number_of_Tweets,gar1_17t$Number_of_Tweets,gar1_18t$Number_of_Tweets,gar1_19t$Number_of_Tweets,gar1_20t$Number_of_Tweets,
                        gar1_21t$Number_of_Tweets,gar1_22t$Number_of_Tweets,gar1_23t$Number_of_Tweets,gar1_24t$Number_of_Tweets,gar1_25t$Number_of_Tweets,
                        gar1_26t$Number_of_Tweets,gar1_27t$Number_of_Tweets,gar1_28t$Number_of_Tweets)
colnames(gar1_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_gar,time_int);
event_ind <- which(gar1_time$Time==event_time2);
gar1_time_melt <- melt(gar1_time,id.vars = "Time")

ggplot(data = gar1_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_gar) + labs(title="gar Attacks 0 deg")
write.csv(gar1_time,file="gar1_time.csv");
