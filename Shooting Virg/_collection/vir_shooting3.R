# c2 coordinates from virg_shooting 36.72206,-76.05750

#Test
virg11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="36.72206,-76.05750,2.0mi");
virg11_2a.df <- twListToDF(virg11_2a);
virg11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.72206,-76.05750,2.0mi");
virg11_2b.df <- twListToDF(virg11_2b);
virg11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.72206,-76.05750,2.0mi");
virg11_2c.df <- twListToDF(virg11_2c);
virg11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="36.72206,-76.05750,2.0mi");
virg11_2d.df <- twListToDF(virg11_2d);
virg11_2e.df <- rbind(virg11_2a.df,virg11_2b.df,virg11_2c.df,virg11_2d.df);
nrow(virg11_2e.df)
####

virg_90_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.1mi");
virg_90_11_2.df <- twListToDF(virg_90_11_2);
write.csv(virg_90_11_2.df,file="virg_90_11_2.csv"); # 0 tweets 

virg_90_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.2mi");
virg_90_12_2.df <- twListToDF(virg_90_12_2);
write.csv(virg_90_12_2.df,file="virg_90_12_2.csv"); # 0 tweets

virg_90_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.3mi");
virg_90_13_2.df <- twListToDF(virg_90_13_2);
write.csv(virg_90_13_2.df,file="virg_90_13_2.csv"); # 0 tweets

virg_90_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.4mi");
virg_90_14_2.df <- twListToDF(virg_90_14_2);
write.csv(virg_90_14_2.df,file="virg_90_14_2.csv"); # 0 tweets

virg_90_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.5mi");
virg_90_15_2.df <- twListToDF(virg_90_15_2);
write.csv(virg_90_15_2.df,file="virg_90_15_2.csv");

virg_90_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.6mi");
virg_90_16_2.df <- twListToDF(virg_90_16_2);
write.csv(virg_90_16_2.df,file="virg_90_16_2.csv");

virg_90_17_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.7mi");
virg_90_17_2.df <- twListToDF(virg_90_17_2a);
write.csv(virg_90_17_2.df,file="virg_90_17_2.csv");

virg_90_18_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.8mi");
virg_90_18_2.df <- twListToDF(virg_90_18_2a);
write.csv(virg_90_18_2.df,file="virg_90_18_2.csv");

virg_90_19_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,1.9mi");
virg_90_19_2.df <- twListToDF(virg_90_19_2a);
write.csv(virg_90_19_2.df,file="virg_90_19_2.csv");

virg_90_20_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.0mi");
virg_90_20_2.df <- twListToDF(virg_90_20_2a);
write.csv(virg_90_20_2.df,file="virg_90_20_2.csv");

virg_90_21_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.1mi");
virg_90_21_2.df <- twListToDF(virg_90_21_2a);
write.csv(virg_90_21_2.df,file="virg_90_21_2.csv");

virg_90_22_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.2mi");
virg_90_22_2.df <- twListToDF(virg_90_22_2a);
write.csv(virg_90_22_2.df,file="virg_90_22_2.csv");

virg_90_23_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.3mi");
virg_90_23_2.df <- twListToDF(virg_90_23_2a);
write.csv(virg_90_23_2.df,file="virg_90_23_2.csv");

virg_90_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.4mi");
virg_90_24_2.df <- twListToDF(virg_90_24_2);
write.csv(virg_90_24_2.df,file="virg_90_24_2.csv");

virg_90_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.5mi");
virg_90_25_2.df <- twListToDF(virg_90_25_2);
write.csv(virg_90_25_2.df,file="virg_90_25_2.csv");

virg_90_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.6mi");
virg_90_26_2.df <- twListToDF(virg_90_26_2);
write.csv(virg_90_26_2.df,file="virg_90_26_2.csv");

virg_90_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.7mi");
virg_90_27_2.df <- twListToDF(virg_90_27_2);
write.csv(virg_90_27_2.df,file="virg_90_27_2.csv");

virg_90_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.72206,-76.05750,2.8mi");
virg_90_28_2.df <- twListToDF(virg_90_28_2);
write.csv(virg_90_28_2.df,file="virg_90_28_2.csv");

virgnum90 <- data.frame(rbind(0,0,0,0,nrow(virg_90_15_2.df),nrow(virg_90_16_2.df),
                              nrow(virg_90_17_2.df),nrow(virg_90_18_2.df),nrow(virg_90_19_2.df),nrow(virg_90_20_2.df),nrow(virg_90_21_2.df),nrow(virg_90_22_2.df),nrow(virg_90_23_2.df),
                              nrow(virg_90_24_2.df),nrow(virg_90_25_2.df),nrow(virg_90_26_2.df),nrow(virg_90_27_2.df),nrow(virg_90_28_2.df)))



radius <- seq(1.1,2.8,0.1);
virgnum90 <- cbind(radius,virgnum90);
colnames(virgnum90) <- c("radius","numtweets")
write.csv(virgnum90,file="virgnum90.csv");
