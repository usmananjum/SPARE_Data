#STEM High school shooting: 39.556, -104.9979

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

coords_stem <- c(-104.9979,39.556);
c0 <- as.vector(destPoint(coords_stem,0,3200));
c30 <- as.vector(destPoint(coords_stem,30,3200));
c90 <- as.vector(destPoint(coords_stem,90,3200));
c180 <- as.vector(destPoint(coords_stem,180,2400));

# stem10_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.0mi");
# stem10_2.df <- twListToDF(stem10_2);
# write.csv(stem10_2.df,file="stem10_2.csv");

stem11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.1mi");
stem11_2.df <- twListToDF(stem11_2);
write.csv(stem11_2.df,file="stem11_2.csv");

stem12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.2mi");
stem12_2.df <- twListToDF(stem12_2);
write.csv(stem12_2.df,file="stem12_2.csv");

stem13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.3mi");
stem13_2.df <- twListToDF(stem13_2);
write.csv(stem13_2.df,file="stem13_2.csv");

stem14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.4mi");
stem14_2.df <- twListToDF(stem14_2);
write.csv(stem14_2.df,file="stem14_2.csv");

stem15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.5mi");
stem15_2.df <- twListToDF(stem15_2);
write.csv(stem15_2.df,file="stem15_2.csv");

stem16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.6mi");
stem16_2.df <- twListToDF(stem16_2);
write.csv(stem16_2.df,file="stem16_2.csv");

stem17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.7mi");
stem17_2.df <- twListToDF(stem17_2);
write.csv(stem17_2.df,file="stem17_2.csv");

stem18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.8mi");
stem18_2.df <- twListToDF(stem18_2);
write.csv(stem18_2.df,file="stem18_2.csv");

stem19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,1.9mi");
stem19_2.df <- twListToDF(stem19_2);
write.csv(stem19_2.df,file="stem19_2.csv");

stem20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.0mi");
stem20_2.df <- twListToDF(stem20_2);
write.csv(stem20_2.df,file="stem20_2.csv");

stem21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.1mi");
stem21_2.df <- twListToDF(stem21_2);
write.csv(stem21_2.df,file="stem21_2.csv");

stem22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.2mi");
stem22_2.df <- twListToDF(stem22_2);
write.csv(stem22_2.df,file="stem22_2.csv");

stem23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.3mi");
stem23_2.df <- twListToDF(stem23_2);
write.csv(stem23_2.df,file="stem23_2.csv");

stem24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.4mi");
stem24_2.df <- twListToDF(stem24_2);
write.csv(stem24_2.df,file="stem24_2.csv");

stem25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.5mi");
stem25_2.df <- twListToDF(stem25_2);
write.csv(stem25_2.df,file="stem25_2.csv");

stem26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.6mi");
stem26_2.df <- twListToDF(stem26_2);
write.csv(stem26_2.df,file="stem26_2.csv");

stem27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.7mi");
stem27_2.df <- twListToDF(stem27_2);
write.csv(stem27_2.df,file="stem27_2.csv");

stem28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.58482,-104.99790,2.8mi");
stem28_2.df <- twListToDF(stem28_2);
write.csv(stem28_2.df,file="stem28_2.csv");

stemnum0 <- data.frame(rbind(nrow(stem11_2.df),nrow(stem12_2.df),nrow(stem13_2.df),nrow(stem14_2.df),nrow(stem15_2.df),nrow(stem16_2.df),
                            nrow(stem17_2.df),nrow(stem18_2.df),nrow(stem19_2.df),nrow(stem20_2.df),nrow(stem21_2.df),nrow(stem22_2.df),nrow(stem23_2.df),
                            nrow(stem24_2.df),nrow(stem25_2.df),nrow(stem26_2.df),nrow(stem27_2.df),nrow(stem28_2.df)))



radius <- seq(1.1,2.8,0.1);
stemnum0 <- cbind(radius,stemnum0);
colnames(stemnum0) <- c("radius","numtweets")
write.csv(stemnum0,file="stemnum0.csv");
