#Virginia Beach shooting: 36.7509, -76.0575 May 31, 2019 @4:40pm

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

coords_virg <- c(-76.0575,36.7509);
c0 <- as.vector(destPoint(coords_virg,0,3200));
c1 <- as.vector(destPoint(coords_virg,90,3200));
c2 <- as.vector(destPoint(coords_virg,180,3200));
c3 <- as.vector(destPoint(coords_virg,270,3200));

virg10 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75090,-76.07542,3.1mi"); # c3 test
virg10.df <- twListToDF(virg10);
write.csv(virg10.df,file="virg10.csv");

virg11 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75090,-76.07542,1.1mi"); # c3 test
virg11.df <- twListToDF(virg11);
write.csv(virg11.df,file="virg11_2.csv");

virg09 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75090,-76.07542,0.9mi"); # c3 test
virg09.df <- twListToDF(virg09);
write.csv(virg09.df,file="virg09.csv");

virg08 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75090,-76.07542,0.8mi"); # c3 test
virg08.df <- twListToDF(virg08);
write.csv(virg08.df,file="virg08.csv");

#Test
virg11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="36.77974,-76.05750,1.7mi");
virg11_2a.df <- twListToDF(virg11_2a);
virg11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.77974,-76.05750,1.7mi");
virg11_2b.df <- twListToDF(virg11_2b);
virg11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.77974,-76.05750,1.7mi");
virg11_2c.df <- twListToDF(virg11_2c);
virg11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="36.77974,-76.05750,1.7mi");
virg11_2d.df <- twListToDF(virg11_2d);
virg11_2e.df <- rbind(virg11_2a.df,virg11_2b.df,virg11_2c.df,virg11_2d.df); 
nrow(virg11_2e.df)
write.csv(virg11_2.df,file="virg11_2.csv");
###

virg11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.1mi");
virg11_2.df <- twListToDF(virg11_2);
write.csv(virg11_2.df,file="virg11_2.csv");

virg12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.2mi");
virg12_2.df <- twListToDF(virg12_2);
write.csv(virg12_2.df,file="virg12_2.csv");

virg13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.3mi");
virg13_2.df <- twListToDF(virg13_2);
write.csv(virg13_2.df,file="virg13_2.csv");

virg14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.4mi");
virg14_2.df <- twListToDF(virg14_2);
write.csv(virg14_2.df,file="virg14_2.csv");

virg15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.5mi");
virg15_2.df <- twListToDF(virg15_2);
write.csv(virg15_2.df,file="virg15_2.csv");

virg16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.6mi");
virg16_2.df <- twListToDF(virg16_2);
write.csv(virg16_2.df,file="virg16_2.csv");

virg17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.7mi");
virg17_2.df <- twListToDF(virg17_2);
write.csv(virg17_2.df,file="virg17_2.csv");

virg18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.8mi");
virg18_2.df <- twListToDF(virg18_2);
write.csv(virg18_2.df,file="virg18_2.csv");

virg19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,1.9mi");
virg19_2.df <- twListToDF(virg19_2);
write.csv(virg19_2.df,file="virg19_2.csv");

virg20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.0mi");
virg20_2.df <- twListToDF(virg20_2);
write.csv(virg20_2.df,file="virg20_2.csv");

virg21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.1mi");
virg21_2.df <- twListToDF(virg21_2);
write.csv(virg21_2.df,file="virg21_2.csv");

virg22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.2mi");
virg22_2.df <- twListToDF(virg22_2);
write.csv(virg22_2.df,file="virg22_2.csv");

virg23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.3mi");
virg23_2.df <- twListToDF(virg23_2);
write.csv(virg23_2.df,file="virg23_2.csv");

virg24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.4mi");
virg24_2.df <- twListToDF(virg24_2);
write.csv(virg24_2.df,file="virg24_2.csv");

virg25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.5mi");
virg25_2.df <- twListToDF(virg25_2);
write.csv(virg25_2.df,file="virg25_2.csv");

virg26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.6mi");
virg26_2.df <- twListToDF(virg26_2);
write.csv(virg26_2.df,file="virg26_2.csv");

virg27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.7mi");
virg27_2.df <- twListToDF(virg27_2);
write.csv(virg27_2.df,file="virg27_2.csv");

virg28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.77974,-76.05750,2.8mi");
virg28_2.df <- twListToDF(virg28_2);
write.csv(virg28_2.df,file="virg28_2.csv");

virgnum0 <- data.frame(rbind(nrow(virg11_2.df),nrow(virg12_2.df),nrow(virg13_2.df),nrow(virg14_2.df),nrow(virg15_2.df),nrow(virg16_2.df),
                            nrow(virg17_2.df),nrow(virg18_2.df),nrow(virg19_2.df),nrow(virg20_2.df),nrow(virg21_2.df),nrow(virg22_2.df),nrow(virg23_2.df),
                            nrow(virg24_2.df),nrow(virg25_2.df),nrow(virg26_2.df),nrow(virg27_2.df),nrow(virg28_2.df)))



radius <- seq(1.1,2.8,0.1);
virgnum0 <- cbind(radius,virgnum0);
colnames(virgnum0) <- c("radius","numtweets")
write.csv(virgnum0,file="virgnum0.csv");
