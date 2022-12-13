#El-Paso, Texas shooting: 31.7771,-106.3843 Aug 3, 2019 @10:45am 

library(devtools)
library(twitteR)
library(tm)
library(ggplot2)
library(RColorBrewer)
library(geosphere)
library(wordcloud)


api_key <- "LFuKh9ns1021DTGBE8HPWNfWn"

api_secret <- "zUFcfC4z3d9zKSa6tLNut1tLTwmqtH6V7OZgQ8DeXFjLHHqpXO"

access_token <- "849066693519450114-Af2o3UOsPmP0XvqIyksgZFnL7nHui46"

access_token_secret <- "ZYB1s68VNHZV6vOLST35wA58mVV1o1Eu0cr7EMEPcV9cg"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

coords_elpaso <- c(-106.3843,31.7771);
c0 <- as.vector(destPoint(coords_elpaso,0,3200));
c1 <- as.vector(destPoint(coords_elpaso,90,3200));
c2 <- as.vector(destPoint(coords_elpaso,180,3200));
c3 <- as.vector(destPoint(coords_elpaso,270,2400));
c4a <- as.vector(destPoint(coords_elpaso,270,3200));

elpaso10 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.0mi"); 
elpaso10.df <- twListToDF(elpaso10);
write.csv(elpaso10.df,file="elpaso10.csv");

elpaso11 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.1mi"); 
elpaso11.df <- twListToDF(elpaso11);
write.csv(elpaso11.df,file="elpaso11.csv");

elpaso09 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,0.9mi"); 
elpaso09.df <- twListToDF(elpaso09);
write.csv(elpaso09.df,file="elpaso09.csv");

elpaso08 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,0.8mi"); 
elpaso08.df <- twListToDF(elpaso08);
write.csv(elpaso08.df,file="elpaso08.csv");

#Test
elpaso11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-05-31",geocode="31.80596, -106.38430,1.7mi");
elpaso11_2a.df <- twListToDF(elpaso11_2a);
elpaso11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="31.80596, -106.38430,1.7mi");
elpaso11_2b.df <- twListToDF(elpaso11_2b);
elpaso11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="31.80596, -106.38430,1.7mi");
elpaso11_2c.df <- twListToDF(elpaso11_2c);
elpaso11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-07-30",geocode="31.80596, -106.38430,1.7mi");
elpaso11_2d.df <- twListToDF(elpaso11_2d);
elpaso11_2e.df <- rbind(elpaso11_2a.df,elpaso11_2b.df,elpaso11_2c.df,elpaso11_2d.df); 
nrow(elpaso11_2e.df)
write.csv(elpaso11_2.df,file="elpaso11_2.csv");
###

elpaso10_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.0mi");
elpaso10_2.df <- twListToDF(elpaso10_2);
write.csv(elpaso10_2.df,file="elpaso10_2.csv");

elpaso11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.1mi");
elpaso11_2.df <- twListToDF(elpaso11_2);
write.csv(elpaso11_2.df,file="elpaso11_2.csv");

elpaso12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.2mi");
elpaso12_2.df <- twListToDF(elpaso12_2);
write.csv(elpaso12_2.df,file="elpaso12_2.csv");

elpaso13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.3mi");
elpaso13_2.df <- twListToDF(elpaso13_2);
write.csv(elpaso13_2.df,file="elpaso13_2.csv");

elpaso14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.4mi");
elpaso14_2.df <- twListToDF(elpaso14_2);
write.csv(elpaso14_2.df,file="elpaso14_2.csv");

elpaso15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.5mi");
elpaso15_2.df <- twListToDF(elpaso15_2);
write.csv(elpaso15_2.df,file="elpaso15_2.csv");

elpaso16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.6mi");
elpaso16_2.df <- twListToDF(elpaso16_2);
write.csv(elpaso16_2.df,file="elpaso16_2.csv");

elpaso17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.7mi");
elpaso17_2.df <- twListToDF(elpaso17_2);
write.csv(elpaso17_2.df,file="elpaso17_2.csv");

elpaso18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.8mi");
elpaso18_2.df <- twListToDF(elpaso18_2);
write.csv(elpaso18_2.df,file="elpaso18_2.csv");

elpaso19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,1.9mi");
elpaso19_2.df <- twListToDF(elpaso19_2);
write.csv(elpaso19_2.df,file="elpaso19_2.csv");

elpaso20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.0mi");
elpaso20_2.df <- twListToDF(elpaso20_2);
write.csv(elpaso20_2.df,file="elpaso20_2.csv");

elpaso21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.1mi");
elpaso21_2.df <- twListToDF(elpaso21_2);
write.csv(elpaso21_2.df,file="elpaso21_2.csv");

elpaso22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.2mi");
elpaso22_2.df <- twListToDF(elpaso22_2);
write.csv(elpaso22_2.df,file="elpaso22_2.csv");

elpaso23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.3mi");
elpaso23_2.df <- twListToDF(elpaso23_2);
write.csv(elpaso23_2.df,file="elpaso23_2.csv");

elpaso24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.4mi");
elpaso24_2.df <- twListToDF(elpaso24_2);
write.csv(elpaso24_2.df,file="elpaso24_2.csv");

elpaso25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.5mi");
elpaso25_2.df <- twListToDF(elpaso25_2);
write.csv(elpaso25_2.df,file="elpaso25_2.csv");

elpaso26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.6mi");
elpaso26_2.df <- twListToDF(elpaso26_2);
write.csv(elpaso26_2.df,file="elpaso26_2.csv");

elpaso27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.7mi");
elpaso27_2.df <- twListToDF(elpaso27_2);
write.csv(elpaso27_2.df,file="elpaso27_2.csv");

elpaso28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.8mi");
elpaso28_2.df <- twListToDF(elpaso28_2);
write.csv(elpaso28_2.df,file="elpaso28_2.csv");

elpaso29_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.80596,-106.38430,2.9mi");
elpaso29_2.df <- twListToDF(elpaso29_2);
write.csv(elpaso29_2.df,file="elpaso29_2.csv");


elpasonum0 <- data.frame(rbind(nrow(elpaso11_2.df),nrow(elpaso12_2.df),nrow(elpaso13_2.df),nrow(elpaso14_2.df),nrow(elpaso15_2.df),nrow(elpaso16_2.df),
                            nrow(elpaso17_2.df),nrow(elpaso18_2.df),nrow(elpaso19_2.df),nrow(elpaso20_2.df),nrow(elpaso21_2.df),nrow(elpaso22_2.df),nrow(elpaso23_2.df),
                            nrow(elpaso24_2.df),nrow(elpaso25_2.df),nrow(elpaso26_2.df),nrow(elpaso27_2.df),nrow(elpaso28_2.df)))



radius <- seq(1.1,2.8,0.1);
elpasonum0 <- cbind(radius,elpasonum0);
colnames(elpasonum0) <- c("radius","numtweets")
write.csv(elpasonum0,file="elpasonum0.csv");
