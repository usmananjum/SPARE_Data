# c4 coordinates from gar_shooting 36.99777,-121.62123

#Test
gar11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-29",until ="2019-05-30",geocode="36.99777,-121.62123,2.3mi");
gar11_2a.df <- twListToDF(gar11_2a);
gar11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.99777,-121.62123,2.3mi");
gar11_2b.df <- twListToDF(gar11_2b);
gar11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.99777,-121.62123,2.3mi");
gar11_2c.df <- twListToDF(gar11_2c);
gar11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-06-02",geocode="36.99777,-121.62123,2.3mi");
gar11_2d.df <- twListToDF(gar11_2d);
gar11_2e.df <- rbind(gar11_2a.df,gar11_2b.df,gar11_2c.df,gar11_2d.df);
nrow(gar11_2e.df)
####

gar_270_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.1mi");
gar_270_11_2.df <- twListToDF(gar_270_11_2);
write.csv(gar_270_11_2.df,file="gar_270_11_2.csv"); 

gar_270_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.2mi");
gar_270_12_2.df <- twListToDF(gar_270_12_2);
write.csv(gar_270_12_2.df,file="gar_270_12_2.csv"); 

gar_270_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.3mi");
gar_270_13_2.df <- twListToDF(gar_270_13_2);
write.csv(gar_270_13_2.df,file="gar_270_13_2.csv"); 

gar_270_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.4mi");
gar_270_14_2.df <- twListToDF(gar_270_14_2);
write.csv(gar_270_14_2.df,file="gar_270_14_2.csv"); 

gar_270_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.5mi");
gar_270_15_2.df <- twListToDF(gar_270_15_2);
write.csv(gar_270_15_2.df,file="gar_270_15_2.csv");

gar_270_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.6mi");
gar_270_16_2.df <- twListToDF(gar_270_16_2);
write.csv(gar_270_16_2.df,file="gar_270_16_2.csv");

gar_270_17_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.7mi");
gar_270_17_2.df <- twListToDF(gar_270_17_2a);
write.csv(gar_270_17_2.df,file="gar_270_17_2.csv");

gar_270_18_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.8mi");
gar_270_18_2.df <- twListToDF(gar_270_18_2a);
write.csv(gar_270_18_2.df,file="gar_270_18_2.csv");

gar_270_19_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,1.9mi");
gar_270_19_2.df <- twListToDF(gar_270_19_2a);
write.csv(gar_270_19_2.df,file="gar_270_19_2.csv");

gar_270_20_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.0mi");
gar_270_20_2.df <- twListToDF(gar_270_20_2a);
write.csv(gar_270_20_2.df,file="gar_270_20_2.csv");

gar_270_21_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.1mi");
gar_270_21_2.df <- twListToDF(gar_270_21_2a);
write.csv(gar_270_21_2.df,file="gar_270_21_2.csv");

gar_270_22_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.2mi");
gar_270_22_2.df <- twListToDF(gar_270_22_2a);
write.csv(gar_270_22_2.df,file="gar_270_22_2.csv");

gar_270_23_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.3mi");
gar_270_23_2.df <- twListToDF(gar_270_23_2a);
write.csv(gar_270_23_2.df,file="gar_270_23_2.csv");

gar_270_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.4mi");
gar_270_24_2.df <- twListToDF(gar_270_24_2);
write.csv(gar_270_24_2.df,file="gar_270_24_2.csv");

gar_270_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.5mi");
gar_270_25_2.df <- twListToDF(gar_270_25_2);
write.csv(gar_270_25_2.df,file="gar_270_25_2.csv");

gar_270_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.6mi");
gar_270_26_2.df <- twListToDF(gar_270_26_2);
write.csv(gar_270_26_2.df,file="gar_270_26_2.csv");

gar_270_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.7mi");
gar_270_27_2.df <- twListToDF(gar_270_27_2);
write.csv(gar_270_27_2.df,file="gar_270_27_2.csv");

gar_270_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.62123,2.8mi");
gar_270_28_2.df <- twListToDF(gar_270_28_2);
write.csv(gar_270_28_2.df,file="gar_270_28_2.csv");

garnum270 <- data.frame(rbind(nrow(gar_270_11_2.df),nrow(gar_270_12_2.df),nrow(gar_270_13_2.df),nrow(gar_270_14_2.df),nrow(gar_270_15_2.df),nrow(gar_270_16_2.df),
                              nrow(gar_270_17_2.df),nrow(gar_270_18_2.df),nrow(gar_270_19_2.df),nrow(gar_270_20_2.df),nrow(gar_270_21_2.df),nrow(gar_270_22_2.df),nrow(gar_270_23_2.df),
                              nrow(gar_270_24_2.df),nrow(gar_270_25_2.df),nrow(gar_270_26_2.df),nrow(gar_270_27_2.df),nrow(gar_270_28_2.df)))



radius <- seq(1.1,2.8,0.1);
garnum270 <- cbind(radius,garnum270);
colnames(garnum270) <- c("radius","numtweets")
write.csv(garnum270,file="garnum270.csv");
