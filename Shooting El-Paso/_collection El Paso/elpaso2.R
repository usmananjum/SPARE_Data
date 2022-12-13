#c1 coordinates from elpaso_shooting 31.7771,-106.3505

#Test
elpaso11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-05-30",geocode="31.7771,-106.3505,2.8mi");
elpaso11_2a.df <- twListToDF(elpaso11_2a);
elpaso11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="31.7771,-106.3505,2.8mi");
elpaso11_2b.df <- twListToDF(elpaso11_2b);
elpaso11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="31.7771,-106.3505,2.8mi");
elpaso11_2c.df <- twListToDF(elpaso11_2c);
elpaso11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-07-30",geocode="31.7771,-106.3505,2.8mi");
elpaso11_2d.df <- twListToDF(elpaso11_2d);
elpaso11_2e.df <- rbind(elpaso11_2a.df,elpaso11_2b.df,elpaso11_2c.df,elpaso11_2d.df);
nrow(elpaso11_2e.df)
####

elpaso_30_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.1mi");
elpaso_30_11_2.df <- twListToDF(elpaso_30_11_2);
write.csv(elpaso_30_11_2.df,file="elpaso_30_11_2.csv");

elpaso_30_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.2mi");
elpaso_30_12_2.df <- twListToDF(elpaso_30_12_2);
write.csv(elpaso_30_12_2.df,file="elpaso_30_12_2.csv");

elpaso_30_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.3mi");
elpaso_30_13_2.df <- twListToDF(elpaso_30_13_2);
write.csv(elpaso_30_13_2.df,file="elpaso_30_13_2.csv");

elpaso_30_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.4mi");
elpaso_30_14_2.df <- twListToDF(elpaso_30_14_2);
write.csv(elpaso_30_14_2.df,file="elpaso_30_14_2.csv");

elpaso_30_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.5mi");
elpaso_30_15_2.df <- twListToDF(elpaso_30_15_2);
write.csv(elpaso_30_15_2.df,file="elpaso_30_15_2.csv");

elpaso_30_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.6mi");
elpaso_30_16_2.df <- twListToDF(elpaso_30_16_2);
write.csv(elpaso_30_16_2.df,file="elpaso_30_16_2.csv");

elpaso_30_17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.7mi");
elpaso_30_17_2.df <- twListToDF(elpaso_30_17_2);
write.csv(elpaso_30_17_2.df,file="elpaso_30_17_2.csv");

elpaso_30_18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.8mi");
elpaso_30_18_2.df <- twListToDF(elpaso_30_18_2);
write.csv(elpaso_30_18_2.df,file="elpaso_30_18_2.csv");

elpaso_30_19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,1.9mi");
elpaso_30_19_2.df <- twListToDF(elpaso_30_19_2);
write.csv(elpaso_30_19_2.df,file="elpaso_30_19_2.csv");

elpaso_30_20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.0mi");
elpaso_30_20_2.df <- twListToDF(elpaso_30_20_2);
write.csv(elpaso_30_20_2.df,file="elpaso_30_20_2.csv");

elpaso_30_21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.1mi");
elpaso_30_21_2.df <- twListToDF(elpaso_30_21_2);
write.csv(elpaso_30_21_2.df,file="elpaso_30_21_2.csv");

elpaso_30_22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.2mi");
elpaso_30_22_2.df <- twListToDF(elpaso_30_22_2);
write.csv(elpaso_30_22_2.df,file="elpaso_30_22_2.csv");

elpaso_30_23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.3mi");
elpaso_30_23_2.df <- twListToDF(elpaso_30_23_2);
write.csv(elpaso_30_23_2.df,file="elpaso_30_23_2.csv");

elpaso_30_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.4mi");
elpaso_30_24_2.df <- twListToDF(elpaso_30_24_2);
write.csv(elpaso_30_24_2.df,file="elpaso_30_24_2.csv");

elpaso_30_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.5mi");
elpaso_30_25_2.df <- twListToDF(elpaso_30_25_2);
write.csv(elpaso_30_25_2.df,file="elpaso_30_25_2.csv");

elpaso_30_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.6mi");
elpaso_30_26_2.df <- twListToDF(elpaso_30_26_2);
write.csv(elpaso_30_26_2.df,file="elpaso_30_26_2.csv");

elpaso_30_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.7mi");
elpaso_30_27_2.df <- twListToDF(elpaso_30_27_2);
write.csv(elpaso_30_27_2.df,file="elpaso_30_27_2.csv");

elpaso_30_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.3505,2.8mi");
elpaso_30_28_2.df <- twListToDF(elpaso_30_28_2);
write.csv(elpaso_30_28_2.df,file="elpaso_30_28_2.csv");

elpasonum30 <- data.frame(rbind(nrow(elpaso_30_11_2.df),nrow(elpaso_30_12_2.df),nrow(elpaso_30_13_2.df),nrow(elpaso_30_14_2.df),nrow(elpaso_30_15_2.df),nrow(elpaso_30_16_2.df),
                             nrow(elpaso_30_17_2.df),nrow(elpaso_30_18_2.df),nrow(elpaso_30_19_2.df),nrow(elpaso_30_20_2.df),nrow(elpaso_30_21_2.df),nrow(elpaso_30_22_2.df),nrow(elpaso_30_23_2.df),
                             nrow(elpaso_30_24_2.df),nrow(elpaso_30_25_2.df),nrow(elpaso_30_26_2.df),nrow(elpaso_30_27_2.df),nrow(elpaso_30_28_2.df)))



radius <- seq(1.1,2.8,0.1);
elpasonum30 <- cbind(radius,elpasonum30);
colnames(elpasonum30) <- c("radius","numtweets")
write.csv(elpasonum30,file="elpasonum30.csv");

