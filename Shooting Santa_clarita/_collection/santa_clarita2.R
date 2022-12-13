# Saugus High School shooting, 	santa_90_ Clarita, California, U.S. 11-14-2019 @ 34.42, -118.52

library(devtools)
library(twitteR)
library(tm)
library(ggplot2)
library(RColorBrewer)
library(geosphere)
library(wordcloud)

#setwd("D://Documents from Lenovo/R") 

api_key <- "LFuKh9ns1021DTGBE8HPWNfWn"

api_secret <- "zUFcfC4z3d9zKSa6tLNut1tLTwmqtH6V7OZgQ8DeXFjLHHqpXO"

access_token <- "849066693519450114-Af2o3UOsPmP0XvqIyksgZFnL7nHui46"

access_token_secret <- "ZYB1s68VNHZV6vOLST35wA58mVV1o1Eu0cr7EMEPcV9cg"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

santa_90_10_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.0mi");
santa_90_10_2.df <- twListToDF(santa_90_10_2);
write.csv(santa_90_10_2.df,file="santa_90_10_2.csv");

santa_90_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.1mi");
santa_90_11_2.df <- twListToDF(santa_90_11_2);
write.csv(santa_90_11_2.df,file="santa_90_11_2.csv");

santa_90_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.2mi");
santa_90_12_2.df <- twListToDF(santa_90_12_2);
write.csv(santa_90_12_2.df,file="santa_90_12_2.csv");

santa_90_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.3mi");
santa_90_13_2.df <- twListToDF(santa_90_13_2);
write.csv(santa_90_13_2.df,file="santa_90_13_2.csv");

santa_90_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.4mi");
santa_90_14_2.df <- twListToDF(santa_90_14_2);
write.csv(santa_90_14_2.df,file="santa_90_14_2.csv");

santa_90_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.5mi");
santa_90_15_2.df <- twListToDF(santa_90_15_2);
write.csv(santa_90_15_2.df,file="santa_90_15_2.csv");

santa_90_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.6mi");
santa_90_16_2.df <- twListToDF(santa_90_16_2);
write.csv(santa_90_16_2.df,file="santa_90_16_2.csv");

santa_90_17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.7mi");
santa_90_17_2.df <- twListToDF(santa_90_17_2);
write.csv(santa_90_17_2.df,file="santa_90_17_2.csv");

santa_90_18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.8mi");
santa_90_18_2.df <- twListToDF(santa_90_18_2);
write.csv(santa_90_18_2.df,file="santa_90_18_2.csv");

santa_90_19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,1.9mi");
santa_90_19_2.df <- twListToDF(santa_90_19_2);
write.csv(santa_90_19_2.df,file="santa_90_19_2.csv");

santa_90_20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.0mi");
santa_90_20_2.df <- twListToDF(santa_90_20_2);
write.csv(santa_90_20_2.df,file="santa_90_20_2.csv");

santa_90_21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.1mi");
santa_90_21_2.df <- twListToDF(santa_90_21_2);
write.csv(santa_90_21_2.df,file="santa_90_21_2.csv");

santa_90_22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.2mi");
santa_90_22_2.df <- twListToDF(santa_90_22_2);
write.csv(santa_90_22_2.df,file="santa_90_22_2.csv");

santa_90_23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.3mi");
santa_90_23_2.df <- twListToDF(santa_90_23_2);
write.csv(santa_90_23_2.df,file="santa_90_23_2.csv");

santa_90_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.4mi");
santa_90_24_2.df <- twListToDF(santa_90_24_2);
write.csv(santa_90_24_2.df,file="santa_90_24_2.csv");

santa_90_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.5mi");
santa_90_25_2.df <- twListToDF(santa_90_25_2);
write.csv(santa_90_25_2.df,file="santa_90_25_2.csv");

santa_90_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.6mi");
santa_90_26_2.df <- twListToDF(santa_90_26_2);
write.csv(santa_90_26_2.df,file="santa_90_26_2.csv");

santa_90_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.7mi");
santa_90_27_2.df <- twListToDF(santa_90_27_2);
write.csv(santa_90_27_2.df,file="santa_90_27_2.csv");

santa_90_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.4200,-118.4852,2.8mi");
santa_90_28_2.df <- twListToDF(santa_90_28_2);
write.csv(santa_90_28_2.df,file="santa_90_28_2.csv");

santa_90_num0 <- data.frame(rbind(nrow(santa_90_11_2.df),nrow(santa_90_12_2.df),nrow(santa_90_13_2.df),nrow(santa_90_14_2.df),nrow(santa_90_15_2.df),nrow(santa_90_16_2.df),
                              nrow(santa_90_17_2.df),nrow(santa_90_18_2.df),nrow(santa_90_19_2.df),nrow(santa_90_20_2.df),nrow(santa_90_21_2.df),nrow(santa_90_22_2.df),nrow(santa_90_23_2.df),
                              nrow(santa_90_24_2.df),nrow(santa_90_25_2.df),nrow(santa_90_26_2.df),nrow(santa_90_27_2.df),nrow(santa_90_28_2.df)))



radius <- seq(1.1,2.8,0.1);
santa_90_num0 <- cbind(radius,santa_90_num0);
colnames(santa_90_num0) <- c("radius","numtweets")
write.csv(santa_90_num0,file="santa_90_num0.csv");