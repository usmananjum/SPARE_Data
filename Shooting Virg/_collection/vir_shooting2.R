#c1 coordinates from virg_shooting 36.75089,-76.02167

#Test
virg11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="36.75089,-76.02167,2.8mi");
virg11_2a.df <- twListToDF(virg11_2a);
virg11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.75089,-76.02167,2.8mi");
virg11_2b.df <- twListToDF(virg11_2b);
virg11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.75089,-76.02167,2.8mi");
virg11_2c.df <- twListToDF(virg11_2c);
virg11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="36.75089,-76.02167,2.8mi");
virg11_2d.df <- twListToDF(virg11_2d);
virg11_2e.df <- rbind(virg11_2a.df,virg11_2b.df,virg11_2c.df,virg11_2d.df);
nrow(virg11_2e.df)
####

virg_30_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.1mi");
virg_30_11_2.df <- twListToDF(virg_30_11_2);
write.csv(virg_30_11_2.df,file="virg_30_11_2.csv");

virg_30_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.2mi");
virg_30_12_2.df <- twListToDF(virg_30_12_2);
write.csv(virg_30_12_2.df,file="virg_30_12_2.csv");

virg_30_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.3mi");
virg_30_13_2.df <- twListToDF(virg_30_13_2);
write.csv(virg_30_13_2.df,file="virg_30_13_2.csv");

virg_30_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.4mi");
virg_30_14_2.df <- twListToDF(virg_30_14_2);
write.csv(virg_30_14_2.df,file="virg_30_14_2.csv");

virg_30_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.5mi");
virg_30_15_2.df <- twListToDF(virg_30_15_2);
write.csv(virg_30_15_2.df,file="virg_30_15_2.csv");

virg_30_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.6mi");
virg_30_16_2.df <- twListToDF(virg_30_16_2);
write.csv(virg_30_16_2.df,file="virg_30_16_2.csv");

virg_30_17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.7mi");
virg_30_17_2.df <- twListToDF(virg_30_17_2);
write.csv(virg_30_17_2.df,file="virg_30_17_2.csv");

virg_30_18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.8mi");
virg_30_18_2.df <- twListToDF(virg_30_18_2);
write.csv(virg_30_18_2.df,file="virg_30_18_2.csv");

virg_30_19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,1.9mi");
virg_30_19_2.df <- twListToDF(virg_30_19_2);
write.csv(virg_30_19_2.df,file="virg_30_19_2.csv");

virg_30_20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.0mi");
virg_30_20_2.df <- twListToDF(virg_30_20_2);
write.csv(virg_30_20_2.df,file="virg_30_20_2.csv");

virg_30_21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.1mi");
virg_30_21_2.df <- twListToDF(virg_30_21_2);
write.csv(virg_30_21_2.df,file="virg_30_21_2.csv");

virg_30_22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.2mi");
virg_30_22_2.df <- twListToDF(virg_30_22_2);
write.csv(virg_30_22_2.df,file="virg_30_22_2.csv");

virg_30_23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.3mi");
virg_30_23_2.df <- twListToDF(virg_30_23_2);
write.csv(virg_30_23_2.df,file="virg_30_23_2.csv");

virg_30_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.4mi");
virg_30_24_2.df <- twListToDF(virg_30_24_2);
write.csv(virg_30_24_2.df,file="virg_30_24_2.csv");

virg_30_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.5mi");
virg_30_25_2.df <- twListToDF(virg_30_25_2);
write.csv(virg_30_25_2.df,file="virg_30_25_2.csv");

virg_30_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.6mi");
virg_30_26_2.df <- twListToDF(virg_30_26_2);
write.csv(virg_30_26_2.df,file="virg_30_26_2.csv");

virg_30_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.7mi");
virg_30_27_2.df <- twListToDF(virg_30_27_2);
write.csv(virg_30_27_2.df,file="virg_30_27_2.csv");

virg_30_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.02167,2.8mi");
virg_30_28_2.df <- twListToDF(virg_30_28_2);
write.csv(virg_30_28_2.df,file="virg_30_28_2.csv");

virgnum30 <- data.frame(rbind(nrow(virg_30_11_2.df),nrow(virg_30_12_2.df),nrow(virg_30_13_2.df),nrow(virg_30_14_2.df),nrow(virg_30_15_2.df),nrow(virg_30_16_2.df),
                             nrow(virg_30_17_2.df),nrow(virg_30_18_2.df),nrow(virg_30_19_2.df),nrow(virg_30_20_2.df),nrow(virg_30_21_2.df),nrow(virg_30_22_2.df),nrow(virg_30_23_2.df),
                             nrow(virg_30_24_2.df),nrow(virg_30_25_2.df),nrow(virg_30_26_2.df),nrow(virg_30_27_2.df),nrow(virg_30_28_2.df)))



radius <- seq(1.1,2.8,0.1);
virgnum30 <- cbind(radius,virgnum30);
colnames(virgnum30) <- c("radius","numtweets")
write.csv(virgnum30,file="virgnum30.csv");

