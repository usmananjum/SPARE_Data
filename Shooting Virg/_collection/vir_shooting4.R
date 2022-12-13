# c4 coordinates from virg_shooting 36.75089,-76.09333

#Test
virg11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="36.75089,-76.09333,2.3mi");
virg11_2a.df <- twListToDF(virg11_2a);
virg11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.75089,-76.09333,2.3mi");
virg11_2b.df <- twListToDF(virg11_2b);
virg11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.75089,-76.09333,2.3mi");
virg11_2c.df <- twListToDF(virg11_2c);
virg11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="36.75089,-76.09333,2.3mi");
virg11_2d.df <- twListToDF(virg11_2d);
virg11_2e.df <- rbind(virg11_2a.df,virg11_2b.df,virg11_2c.df,virg11_2d.df);
nrow(virg11_2e.df)
####

virg_270_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.1mi");
virg_270_11_2.df <- twListToDF(virg_270_11_2);
write.csv(virg_270_11_2.df,file="virg_270_11_2.csv"); 

virg_270_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.2mi");
virg_270_12_2.df <- twListToDF(virg_270_12_2);
write.csv(virg_270_12_2.df,file="virg_270_12_2.csv"); 

virg_270_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.3mi");
virg_270_13_2.df <- twListToDF(virg_270_13_2);
write.csv(virg_270_13_2.df,file="virg_270_13_2.csv"); 

virg_270_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.4mi");
virg_270_14_2.df <- twListToDF(virg_270_14_2);
write.csv(virg_270_14_2.df,file="virg_270_14_2.csv"); 

virg_270_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.5mi");
virg_270_15_2.df <- twListToDF(virg_270_15_2);
write.csv(virg_270_15_2.df,file="virg_270_15_2.csv");

virg_270_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.6mi");
virg_270_16_2.df <- twListToDF(virg_270_16_2);
write.csv(virg_270_16_2.df,file="virg_270_16_2.csv");

virg_270_17_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.7mi");
virg_270_17_2.df <- twListToDF(virg_270_17_2a);
write.csv(virg_270_17_2.df,file="virg_270_17_2.csv");

virg_270_18_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.8mi");
virg_270_18_2.df <- twListToDF(virg_270_18_2a);
write.csv(virg_270_18_2.df,file="virg_270_18_2.csv");

virg_270_19_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,1.9mi");
virg_270_19_2.df <- twListToDF(virg_270_19_2a);
write.csv(virg_270_19_2.df,file="virg_270_19_2.csv");

virg_270_20_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.0mi");
virg_270_20_2.df <- twListToDF(virg_270_20_2a);
write.csv(virg_270_20_2.df,file="virg_270_20_2.csv");

virg_270_21_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.1mi");
virg_270_21_2.df <- twListToDF(virg_270_21_2a);
write.csv(virg_270_21_2.df,file="virg_270_21_2.csv");

virg_270_22_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.2mi");
virg_270_22_2.df <- twListToDF(virg_270_22_2a);
write.csv(virg_270_22_2.df,file="virg_270_22_2.csv");

virg_270_23_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.3mi");
virg_270_23_2.df <- twListToDF(virg_270_23_2a);
write.csv(virg_270_23_2.df,file="virg_270_23_2.csv");

virg_270_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.4mi");
virg_270_24_2.df <- twListToDF(virg_270_24_2);
write.csv(virg_270_24_2.df,file="virg_270_24_2.csv");

virg_270_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.5mi");
virg_270_25_2.df <- twListToDF(virg_270_25_2);
write.csv(virg_270_25_2.df,file="virg_270_25_2.csv");

virg_270_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.6mi");
virg_270_26_2.df <- twListToDF(virg_270_26_2);
write.csv(virg_270_26_2.df,file="virg_270_26_2.csv");

virg_270_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.7mi");
virg_270_27_2.df <- twListToDF(virg_270_27_2);
write.csv(virg_270_27_2.df,file="virg_270_27_2.csv");

virg_270_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-06-02",geocode="36.75089,-76.09333,2.8mi");
virg_270_28_2.df <- twListToDF(virg_270_28_2);
write.csv(virg_270_28_2.df,file="virg_270_28_2.csv");

virgnum270 <- data.frame(rbind(nrow(virg_270_11_2.df),nrow(virg_270_12_2.df),nrow(virg_270_13_2.df),nrow(virg_270_14_2.df),nrow(virg_270_15_2.df),nrow(virg_270_16_2.df),
                              nrow(virg_270_17_2.df),nrow(virg_270_18_2.df),nrow(virg_270_19_2.df),nrow(virg_270_20_2.df),nrow(virg_270_21_2.df),nrow(virg_270_22_2.df),nrow(virg_270_23_2.df),
                              nrow(virg_270_24_2.df),nrow(virg_270_25_2.df),nrow(virg_270_26_2.df),nrow(virg_270_27_2.df),nrow(virg_270_28_2.df)))



radius <- seq(1.1,2.8,0.1);
virgnum270 <- cbind(radius,virgnum270);
colnames(virgnum270) <- c("radius","numtweets")
write.csv(virgnum270,file="virgnum270.csv");
