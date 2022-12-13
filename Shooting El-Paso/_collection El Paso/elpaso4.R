# c4 coordinates from elpaso_shooting 31.7771,-106.4096

#Test
elpaso11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="31.7771,-106.4096,2.3mi");
elpaso11_2a.df <- twListToDF(elpaso11_2a);
elpaso11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="31.7771,-106.4096,2.3mi");
elpaso11_2b.df <- twListToDF(elpaso11_2b);
elpaso11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="31.7771,-106.4096,2.3mi");
elpaso11_2c.df <- twListToDF(elpaso11_2c);
elpaso11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="31.7771,-106.4096,2.3mi");
elpaso11_2d.df <- twListToDF(elpaso11_2d);
elpaso11_2e.df <- rbind(elpaso11_2a.df,elpaso11_2b.df,elpaso11_2c.df,elpaso11_2d.df);
nrow(elpaso11_2e.df)
####

elpaso_270_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.1mi");
elpaso_270_11_2.df <- twListToDF(elpaso_270_11_2);
write.csv(elpaso_270_11_2.df,file="elpaso_270_11_2.csv"); 

elpaso_270_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.2mi");
elpaso_270_12_2.df <- twListToDF(elpaso_270_12_2);
write.csv(elpaso_270_12_2.df,file="elpaso_270_12_2.csv"); 

elpaso_270_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.3mi");
elpaso_270_13_2.df <- twListToDF(elpaso_270_13_2);
write.csv(elpaso_270_13_2.df,file="elpaso_270_13_2.csv"); 

elpaso_270_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.4mi");
elpaso_270_14_2.df <- twListToDF(elpaso_270_14_2);
write.csv(elpaso_270_14_2.df,file="elpaso_270_14_2.csv"); 

elpaso_270_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.5mi");
elpaso_270_15_2.df <- twListToDF(elpaso_270_15_2);
write.csv(elpaso_270_15_2.df,file="elpaso_270_15_2.csv");

elpaso_270_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.6mi");
elpaso_270_16_2.df <- twListToDF(elpaso_270_16_2);
write.csv(elpaso_270_16_2.df,file="elpaso_270_16_2.csv");

elpaso_270_17_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.7mi");
elpaso_270_17_2.df <- twListToDF(elpaso_270_17_2a);
write.csv(elpaso_270_17_2.df,file="elpaso_270_17_2.csv");

elpaso_270_18_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.8mi");
elpaso_270_18_2.df <- twListToDF(elpaso_270_18_2a);
write.csv(elpaso_270_18_2.df,file="elpaso_270_18_2.csv");

elpaso_270_19_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,1.9mi");
elpaso_270_19_2.df <- twListToDF(elpaso_270_19_2a);
write.csv(elpaso_270_19_2.df,file="elpaso_270_19_2.csv");

elpaso_270_20_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.0mi");
elpaso_270_20_2.df <- twListToDF(elpaso_270_20_2a);
write.csv(elpaso_270_20_2.df,file="elpaso_270_20_2.csv");

elpaso_270_21_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.1mi");
elpaso_270_21_2.df <- twListToDF(elpaso_270_21_2a);
write.csv(elpaso_270_21_2.df,file="elpaso_270_21_2.csv");

elpaso_270_22_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.2mi");
elpaso_270_22_2.df <- twListToDF(elpaso_270_22_2a);
write.csv(elpaso_270_22_2.df,file="elpaso_270_22_2.csv");

elpaso_270_23_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.3mi");
elpaso_270_23_2.df <- twListToDF(elpaso_270_23_2a);
write.csv(elpaso_270_23_2.df,file="elpaso_270_23_2.csv");

elpaso_270_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.4mi");
elpaso_270_24_2.df <- twListToDF(elpaso_270_24_2);
write.csv(elpaso_270_24_2.df,file="elpaso_270_24_2.csv");

elpaso_270_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.5mi");
elpaso_270_25_2.df <- twListToDF(elpaso_270_25_2);
write.csv(elpaso_270_25_2.df,file="elpaso_270_25_2.csv");

elpaso_270_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.6mi");
elpaso_270_26_2.df <- twListToDF(elpaso_270_26_2);
write.csv(elpaso_270_26_2.df,file="elpaso_270_26_2.csv");

elpaso_270_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.7mi");
elpaso_270_27_2.df <- twListToDF(elpaso_270_27_2);
write.csv(elpaso_270_27_2.df,file="elpaso_270_27_2.csv");

elpaso_270_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-08-02",until ="2019-08-05",geocode="31.7771,-106.4096,2.8mi");
elpaso_270_28_2.df <- twListToDF(elpaso_270_28_2);
write.csv(elpaso_270_28_2.df,file="elpaso_270_28_2.csv");

elpasonum270 <- data.frame(rbind(nrow(elpaso_270_11_2.df),nrow(elpaso_270_12_2.df),nrow(elpaso_270_13_2.df),nrow(elpaso_270_14_2.df),nrow(elpaso_270_15_2.df),nrow(elpaso_270_16_2.df),
                              nrow(elpaso_270_17_2.df),nrow(elpaso_270_18_2.df),nrow(elpaso_270_19_2.df),nrow(elpaso_270_20_2.df),nrow(elpaso_270_21_2.df),nrow(elpaso_270_22_2.df),nrow(elpaso_270_23_2.df),
                              nrow(elpaso_270_24_2.df),nrow(elpaso_270_25_2.df),nrow(elpaso_270_26_2.df),nrow(elpaso_270_27_2.df),nrow(elpaso_270_28_2.df)))



radius <- seq(1.1,2.8,0.1);
elpasonum270 <- cbind(radius,elpasonum270);
colnames(elpasonum270) <- c("radius","numtweets")
write.csv(elpasonum270,file="elpasonum270.csv");
