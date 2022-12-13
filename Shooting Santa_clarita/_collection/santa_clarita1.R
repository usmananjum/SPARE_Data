# Saugus High School shooting, 	Santa Clarita, California, U.S. 11-14-2019 @ 34.42, -118.52

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

coords_santa <- c(-118.52,34.42);
c0 <- as.vector(destPoint(coords_santa,0,3200)); 
c90 <- as.vector(destPoint(coords_santa,90,3200));
c180 <- as.vector(destPoint(coords_santa,180,3200));
c270 <- as.vector(destPoint(coords_santa,270,3200));
c30 <- as.vector(destPoint(coords_santa,30,2400));

santa10_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.0mi");
santa10_2.df <- twListToDF(santa10_2);
write.csv(santa10_2.df,file="santa10_2.csv");

santa11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.1mi");
santa10_2.df <- twListToDF(santa11_2);
write.csv(santa11_2.df,file="santa11_2.csv");

santa12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.2mi");
santa12_2.df <- twListToDF(santa12_2);
write.csv(santa12_2.df,file="santa12_2.csv");

santa13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.3mi");
santa13_2.df <- twListToDF(santa13_2);
write.csv(santa13_2.df,file="santa13_2.csv");

santa14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.4mi");
santa14_2.df <- twListToDF(santa14_2);
write.csv(santa14_2.df,file="santa14_2.csv");

santa15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.5mi");
santa15_2.df <- twListToDF(santa15_2);
write.csv(santa15_2.df,file="santa15_2.csv");

santa16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.6mi");
santa16_2.df <- twListToDF(santa16_2);
write.csv(santa16_2.df,file="santa16_2.csv");

santa17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.7mi");
santa17_2.df <- twListToDF(santa17_2);
write.csv(santa17_2.df,file="santa17_2.csv");

santa18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.8mi");
santa18_2.df <- twListToDF(santa18_2);
write.csv(santa18_2.df,file="santa18_2.csv");

santa19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,1.9mi");
santa19_2.df <- twListToDF(santa19_2);
write.csv(santa19_2.df,file="santa19_2.csv");

santa20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.0mi");
santa20_2.df <- twListToDF(santa20_2);
write.csv(santa20_2.df,file="santa20_2.csv");

santa21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.1mi");
santa21_2.df <- twListToDF(santa21_2);
write.csv(santa21_2.df,file="santa21_2.csv");

santa22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.2mi");
santa22_2.df <- twListToDF(santa22_2);
write.csv(santa22_2.df,file="santa22_2.csv");

santa23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.3mi");
santa23_2.df <- twListToDF(santa23_2);
write.csv(santa23_2.df,file="santa23_2.csv");

santa24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.4mi");
santa24_2.df <- twListToDF(santa24_2);
write.csv(santa24_2.df,file="santa24_2.csv");

santa25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.5mi");
santa25_2.df <- twListToDF(santa25_2);
write.csv(santa25_2.df,file="santa25_2.csv");

santa26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.6mi");
santa26_2.df <- twListToDF(santa26_2);
write.csv(santa26_2.df,file="santa26_2.csv");

santa27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.7mi");
santa27_2.df <- twListToDF(santa27_2);
write.csv(santa27_2.df,file="santa27_2.csv");

santa28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-11-12",until ="2019-11-17",geocode="34.44885,-118.52000,2.8mi");
santa28_2.df <- twListToDF(santa28_2);
write.csv(santa28_2.df,file="santa28_2.csv");

santanum0 <- data.frame(rbind(nrow(santa11_2.df),nrow(santa12_2.df),nrow(santa13_2.df),nrow(santa14_2.df),nrow(santa15_2.df),nrow(santa16_2.df),
                             nrow(santa17_2.df),nrow(santa18_2.df),nrow(santa19_2.df),nrow(santa20_2.df),nrow(santa21_2.df),nrow(santa22_2.df),nrow(santa23_2.df),
                             nrow(santa24_2.df),nrow(santa25_2.df),nrow(santa26_2.df),nrow(santa27_2.df),nrow(santa28_2.df)))



radius <- seq(1.1,2.8,0.1);
santanum0 <- cbind(radius,santanum0);
colnames(santanum0) <- c("radius","numtweets")
write.csv(santanum0,file="santanum0.csv");