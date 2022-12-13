# c2 coordinates from gar_shooting 36.96894,-121.58528

#Test
gar11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="36.96894,-121.58528,2.0mi");
gar11_2a.df <- twListToDF(gar11_2a);
gar11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.96894,-121.58528,2.0mi");
gar11_2b.df <- twListToDF(gar11_2b);
gar11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.96894,-121.58528,2.0mi");
gar11_2c.df <- twListToDF(gar11_2c);
gar11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="36.96894,-121.58528,2.0mi");
gar11_2d.df <- twListToDF(gar11_2d);
gar11_2e.df <- rbind(gar11_2a.df,gar11_2b.df,gar11_2c.df,gar11_2d.df);
nrow(gar11_2e.df)
####

gar_90_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.1mi");
gar_90_11_2.df <- twListToDF(gar_90_11_2);
write.csv(gar_90_11_2.df,file="gar_90_11_2.csv"); 

gar_90_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.2mi");
gar_90_12_2.df <- twListToDF(gar_90_12_2);
write.csv(gar_90_12_2.df,file="gar_90_12_2.csv"); 

gar_90_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.3mi");
gar_90_13_2.df <- twListToDF(gar_90_13_2);
write.csv(gar_90_13_2.df,file="gar_90_13_2.csv"); 

gar_90_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.4mi");
gar_90_14_2.df <- twListToDF(gar_90_14_2);
write.csv(gar_90_14_2.df,file="gar_90_14_2.csv"); 

gar_90_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.5mi");
gar_90_15_2.df <- twListToDF(gar_90_15_2);
write.csv(gar_90_15_2.df,file="gar_90_15_2.csv");

gar_90_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.6mi");
gar_90_16_2.df <- twListToDF(gar_90_16_2);
write.csv(gar_90_16_2.df,file="gar_90_16_2.csv");

gar_90_17_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.7mi");
gar_90_17_2.df <- twListToDF(gar_90_17_2a);
write.csv(gar_90_17_2.df,file="gar_90_17_2.csv");

gar_90_18_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.8mi");
gar_90_18_2.df <- twListToDF(gar_90_18_2a);
write.csv(gar_90_18_2.df,file="gar_90_18_2.csv");

gar_90_19_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,1.9mi");
gar_90_19_2.df <- twListToDF(gar_90_19_2a);
write.csv(gar_90_19_2.df,file="gar_90_19_2.csv");

gar_90_20_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.0mi");
gar_90_20_2.df <- twListToDF(gar_90_20_2a);
write.csv(gar_90_20_2.df,file="gar_90_20_2.csv");

gar_90_21_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.1mi");
gar_90_21_2.df <- twListToDF(gar_90_21_2a);
write.csv(gar_90_21_2.df,file="gar_90_21_2.csv");

gar_90_22_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.2mi");
gar_90_22_2.df <- twListToDF(gar_90_22_2a);
write.csv(gar_90_22_2.df,file="gar_90_22_2.csv");

gar_90_23_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.3mi");
gar_90_23_2.df <- twListToDF(gar_90_23_2a);
write.csv(gar_90_23_2.df,file="gar_90_23_2.csv");

gar_90_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.4mi");
gar_90_24_2.df <- twListToDF(gar_90_24_2);
write.csv(gar_90_24_2.df,file="gar_90_24_2.csv");

gar_90_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.5mi");
gar_90_25_2.df <- twListToDF(gar_90_25_2);
write.csv(gar_90_25_2.df,file="gar_90_25_2.csv");

gar_90_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.6mi");
gar_90_26_2.df <- twListToDF(gar_90_26_2);
write.csv(gar_90_26_2.df,file="gar_90_26_2.csv");

gar_90_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.7mi");
gar_90_27_2.df <- twListToDF(gar_90_27_2);
write.csv(gar_90_27_2.df,file="gar_90_27_2.csv");

gar_90_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.96894,-121.58528,2.8mi");
gar_90_28_2.df <- twListToDF(gar_90_28_2);
write.csv(gar_90_28_2.df,file="gar_90_28_2.csv");

garnum90 <- data.frame(rbind(0,0,0,0,nrow(gar_90_15_2.df),nrow(gar_90_16_2.df),
                              nrow(gar_90_17_2.df),nrow(gar_90_18_2.df),nrow(gar_90_19_2.df),nrow(gar_90_20_2.df),nrow(gar_90_21_2.df),nrow(gar_90_22_2.df),nrow(gar_90_23_2.df),
                              nrow(gar_90_24_2.df),nrow(gar_90_25_2.df),nrow(gar_90_26_2.df),nrow(gar_90_27_2.df),nrow(gar_90_28_2.df)))



radius <- seq(1.1,2.8,0.1);
garnum90 <- cbind(radius,garnum90);
colnames(garnum90) <- c("radius","numtweets")
write.csv(garnum90,file="garnum90.csv");
