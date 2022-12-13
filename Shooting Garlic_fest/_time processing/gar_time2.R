library(lubridate)
library(ggplot2)
library(reshape2)

event_time_gar <- strptime("2019-07-28 17:40:00","%Y-%m-%d %H:%M:%S");

gar2_11 <- read.csv(file="Garlic_fest/gar2/gar_90_11_2.csv",header=TRUE); #event at 2 mile
gar2_12 <- read.csv(file="Garlic_fest/gar2/gar_90_12_2.csv",header=TRUE); 
gar2_13 <- read.csv(file="Garlic_fest/gar2/gar_90_13_2.csv",header=TRUE);
gar2_14 <- read.csv(file="Garlic_fest/gar2/gar_90_14_2.csv",header=TRUE);
gar2_15 <- read.csv(file="Garlic_fest/gar2/gar_90_15_2.csv",header=TRUE);
gar2_16 <- read.csv(file="Garlic_fest/gar2/gar_90_16_2.csv",header=TRUE);
gar2_17 <- read.csv(file="Garlic_fest/gar2/gar_90_17_2.csv",header=TRUE);
gar2_18 <- read.csv(file="Garlic_fest/gar2/gar_90_18_2.csv",header=TRUE);
gar2_19 <- read.csv(file="Garlic_fest/gar2/gar_90_19_2.csv",header=TRUE); 
gar2_20 <- read.csv(file="Garlic_fest/gar2/gar_90_20_2.csv",header=TRUE);
gar2_21 <- read.csv(file="Garlic_fest/gar2/gar_90_21_2.csv",header=TRUE);
gar2_22 <- read.csv(file="Garlic_fest/gar2/gar_90_22_2.csv",header=TRUE);
gar2_23 <- read.csv(file="Garlic_fest/gar2/gar_90_23_2.csv",header=TRUE);
gar2_24 <- read.csv(file="Garlic_fest/gar2/gar_90_24_2.csv",header=TRUE);
gar2_25 <- read.csv(file="Garlic_fest/gar2/gar_90_25_2.csv",header=TRUE);
gar2_26 <- read.csv(file="Garlic_fest/gar2/gar_90_26_2.csv",header=TRUE);
gar2_27 <- read.csv(file="Garlic_fest/gar2/gar_90_27_2.csv",header=TRUE);
gar2_28 <- read.csv(file="Garlic_fest/gar2/gar_90_28_2.csv",header=TRUE);

time_int <- "1 hour";
gar2_11t <- full_seq_time(time_tweets(gar2_11,time_int));
gar2_12t <- full_seq_time(time_tweets(gar2_12,time_int));
gar2_13t <- full_seq_time(time_tweets(gar2_13,time_int));
gar2_14t <- full_seq_time(time_tweets(gar2_14,time_int));
gar2_15t <- full_seq_time(time_tweets(gar2_15,time_int));
gar2_16t <- full_seq_time(time_tweets(gar2_16,time_int));
gar2_17t <- full_seq_time(time_tweets(gar2_17,time_int));
gar2_18t <- full_seq_time(time_tweets(gar2_18,time_int));
gar2_19t <- full_seq_time(time_tweets(gar2_19,time_int));
gar2_20t <- full_seq_time(time_tweets(gar2_20,time_int));
gar2_21t <- full_seq_time(time_tweets(gar2_21,time_int));
gar2_22t <- full_seq_time(time_tweets(gar2_22,time_int));
gar2_23t <- full_seq_time(time_tweets(gar2_23,time_int));
gar2_24t <- full_seq_time(time_tweets(gar2_24,time_int));
gar2_25t <- full_seq_time(time_tweets(gar2_25,time_int));
gar2_26t <- full_seq_time(time_tweets(gar2_26,time_int));
gar2_27t <- full_seq_time(time_tweets(gar2_27,time_int));
gar2_28t <- full_seq_time(time_tweets(gar2_28,time_int));

gar2_time <- data.frame(gar2_12t$Time,gar2_11t$Number_of_Tweets,gar2_12t$Number_of_Tweets,gar2_13t$Number_of_Tweets,gar2_14t$Number_of_Tweets,gar2_15t$Number_of_Tweets,
                        gar2_16t$Number_of_Tweets,gar2_17t$Number_of_Tweets,gar2_18t$Number_of_Tweets,gar2_19t$Number_of_Tweets,gar2_20t$Number_of_Tweets,
                        gar2_21t$Number_of_Tweets,gar2_22t$Number_of_Tweets,gar2_23t$Number_of_Tweets,gar2_24t$Number_of_Tweets,gar2_25t$Number_of_Tweets,
                        gar2_26t$Number_of_Tweets,gar2_27t$Number_of_Tweets,gar2_28t$Number_of_Tweets)
colnames(gar2_time) <- c('Time','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2.0','2.1','2.2','2.3','2.4','2.5','2.6','2.7','2.8');

event_time2 <- round_date(event_time_gar,time_int);
event_ind <- which(gar2_time$Time==event_time2);
gar2_time_melt <- melt(gar2_time,id.vars = "Time")

ggplot(data = gar2_time_melt,aes(Time,value,col=variable)) + geom_line() + geom_point() + 
  scale_x_datetime(date_breaks="1 day", date_minor_breaks = "1 hour",date_labels = "%D") + geom_vline(xintercept = event_time_gar) + labs(title="gar Attacks 0 deg")
write.csv(gar2_time,file="gar2_time.csv");
