#Galic Festival, California shooting: 36.997778, -121.585278 July 28, 2019 @5:40pm

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

coords_gar <- c(-121.585278,36.997778);
c0 <- as.vector(destPoint(coords_gar,0,3200));
c1 <- as.vector(destPoint(coords_gar,90,3200));
c2 <- as.vector(destPoint(coords_gar,180,3200));
c3 <- as.vector(destPoint(coords_gar,270,3200));

gar10 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.0mi"); # c3 test
gar10.df <- twListToDF(gar10);
write.csv(gar10.df,file="gar10.csv");

gar11 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.1mi"); 
gar11.df <- twListToDF(gar11);
write.csv(gar11.df,file="gar11_2.csv");

gar09 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,0.9mi"); 
gar09.df <- twListToDF(gar09);
write.csv(gar09.df,file="gar09.csv");

gar08 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,0.8mi"); 
gar08.df <- twListToDF(gar08);
write.csv(gar08.df,file="gar08.csv");

#Test
gar11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-05-31",geocode="37.02661,-121.58528,1.7mi");
gar11_2a.df <- twListToDF(gar11_2a);
gar11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="37.02661,-121.58528,1.7mi");
gar11_2b.df <- twListToDF(gar11_2b);
gar11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="37.02661,-121.58528,1.7mi");
gar11_2c.df <- twListToDF(gar11_2c);
gar11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-07-30",geocode="37.02661,-121.58528,1.7mi");
gar11_2d.df <- twListToDF(gar11_2d);
gar11_2e.df <- rbind(gar11_2a.df,gar11_2b.df,gar11_2c.df,gar11_2d.df); 
nrow(gar11_2e.df)
write.csv(gar11_2.df,file="gar11_2.csv");
###

gar10 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.0mi");
gar10.df <- twListToDF(gar10);
write.csv(gar10.df,file="gar10_2.csv");

gar11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.1mi");
gar11_2.df <- twListToDF(gar11_2);
write.csv(gar11_2.df,file="gar11_2.csv");

gar12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.2mi");
gar12_2.df <- twListToDF(gar12_2);
write.csv(gar12_2.df,file="gar12_2.csv");

gar13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.3mi");
gar13_2.df <- twListToDF(gar13_2);
write.csv(gar13_2.df,file="gar13_2.csv");

gar14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.4mi");
gar14_2.df <- twListToDF(gar14_2);
write.csv(gar14_2.df,file="gar14_2.csv");

gar15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.5mi");
gar15_2.df <- twListToDF(gar15_2);
write.csv(gar15_2.df,file="gar15_2.csv");

gar16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.6mi");
gar16_2.df <- twListToDF(gar16_2);
write.csv(gar16_2.df,file="gar16_2.csv");

gar17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.7mi");
gar17_2.df <- twListToDF(gar17_2);
write.csv(gar17_2.df,file="gar17_2.csv");

gar18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.8mi");
gar18_2.df <- twListToDF(gar18_2);
write.csv(gar18_2.df,file="gar18_2.csv");

gar19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,1.9mi");
gar19_2.df <- twListToDF(gar19_2);
write.csv(gar19_2.df,file="gar19_2.csv");

gar20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.0mi");
gar20_2.df <- twListToDF(gar20_2);
write.csv(gar20_2.df,file="gar20_2.csv");

gar21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.1mi");
gar21_2.df <- twListToDF(gar21_2);
write.csv(gar21_2.df,file="gar21_2.csv");

gar22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.2mi");
gar22_2.df <- twListToDF(gar22_2);
write.csv(gar22_2.df,file="gar22_2.csv");

gar23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.3mi");
gar23_2.df <- twListToDF(gar23_2);
write.csv(gar23_2.df,file="gar23_2.csv");

gar24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.4mi");
gar24_2.df <- twListToDF(gar24_2);
write.csv(gar24_2.df,file="gar24_2.csv");

gar25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.5mi");
gar25_2.df <- twListToDF(gar25_2);
write.csv(gar25_2.df,file="gar25_2.csv");

gar26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.6mi");
gar26_2.df <- twListToDF(gar26_2);
write.csv(gar26_2.df,file="gar26_2.csv");

gar27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.7mi");
gar27_2.df <- twListToDF(gar27_2);
write.csv(gar27_2.df,file="gar27_2.csv");

gar28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.8mi");
gar28_2.df <- twListToDF(gar28_2);
write.csv(gar28_2.df,file="gar28_2.csv");

gar29_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="37.02661,-121.58528,2.9mi");
gar29_2.df <- twListToDF(gar29_2);
write.csv(gar29_2.df,file="gar29_2.csv");


garnum0 <- data.frame(rbind(nrow(gar11_2.df),nrow(gar12_2.df),nrow(gar13_2.df),nrow(gar14_2.df),nrow(gar15_2.df),nrow(gar16_2.df),
                            nrow(gar17_2.df),nrow(gar18_2.df),nrow(gar19_2.df),nrow(gar20_2.df),nrow(gar21_2.df),nrow(gar22_2.df),nrow(gar23_2.df),
                            nrow(gar24_2.df),nrow(gar25_2.df),nrow(gar26_2.df),nrow(gar27_2.df),nrow(gar28_2.df)))



radius <- seq(1.1,2.8,0.1);
garnum0 <- cbind(radius,garnum0);
colnames(garnum0) <- c("radius","numtweets")
write.csv(garnum0,file="garnum0.csv");
