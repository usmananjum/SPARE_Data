#c1 coordinates from gar_shooting 36.99777,-121.54933

#Test
gar11_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-05-30",geocode="36.99777,-121.54933,2.8mi");
gar11_2a.df <- twListToDF(gar11_2a);
gar11_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-30",until ="2019-05-31",geocode="36.99777,-121.54933,2.8mi");
gar11_2b.df <- twListToDF(gar11_2b);
gar11_2c <- searchTwitter(searchString=" ",n=2000000,since="2019-05-31",until ="2019-06-01",geocode="36.99777,-121.54933,2.8mi");
gar11_2c.df <- twListToDF(gar11_2c);
gar11_2d <- searchTwitter(searchString=" ",n=2000000,since="2019-06-01",until ="2019-07-30",geocode="36.99777,-121.54933,2.8mi");
gar11_2d.df <- twListToDF(gar11_2d);
gar11_2e.df <- rbind(gar11_2a.df,gar11_2b.df,gar11_2c.df,gar11_2d.df);
nrow(gar11_2e.df)
####

gar_30_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.1mi");
gar_30_11_2.df <- twListToDF(gar_30_11_2);
write.csv(gar_30_11_2.df,file="gar_30_11_2.csv");

gar_30_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.2mi");
gar_30_12_2.df <- twListToDF(gar_30_12_2);
write.csv(gar_30_12_2.df,file="gar_30_12_2.csv");

gar_30_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.3mi");
gar_30_13_2.df <- twListToDF(gar_30_13_2);
write.csv(gar_30_13_2.df,file="gar_30_13_2.csv");

gar_30_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.4mi");
gar_30_14_2.df <- twListToDF(gar_30_14_2);
write.csv(gar_30_14_2.df,file="gar_30_14_2.csv");

gar_30_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.5mi");
gar_30_15_2.df <- twListToDF(gar_30_15_2);
write.csv(gar_30_15_2.df,file="gar_30_15_2.csv");

gar_30_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.6mi");
gar_30_16_2.df <- twListToDF(gar_30_16_2);
write.csv(gar_30_16_2.df,file="gar_30_16_2.csv");

gar_30_17_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.7mi");
gar_30_17_2.df <- twListToDF(gar_30_17_2);
write.csv(gar_30_17_2.df,file="gar_30_17_2.csv");

gar_30_18_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.8mi");
gar_30_18_2.df <- twListToDF(gar_30_18_2);
write.csv(gar_30_18_2.df,file="gar_30_18_2.csv");

gar_30_19_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,1.9mi");
gar_30_19_2.df <- twListToDF(gar_30_19_2);
write.csv(gar_30_19_2.df,file="gar_30_19_2.csv");

gar_30_20_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.0mi");
gar_30_20_2.df <- twListToDF(gar_30_20_2);
write.csv(gar_30_20_2.df,file="gar_30_20_2.csv");

gar_30_21_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.1mi");
gar_30_21_2.df <- twListToDF(gar_30_21_2);
write.csv(gar_30_21_2.df,file="gar_30_21_2.csv");

gar_30_22_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.2mi");
gar_30_22_2.df <- twListToDF(gar_30_22_2);
write.csv(gar_30_22_2.df,file="gar_30_22_2.csv");

gar_30_23_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.3mi");
gar_30_23_2.df <- twListToDF(gar_30_23_2);
write.csv(gar_30_23_2.df,file="gar_30_23_2.csv");

gar_30_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.4mi");
gar_30_24_2.df <- twListToDF(gar_30_24_2);
write.csv(gar_30_24_2.df,file="gar_30_24_2.csv");

gar_30_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.5mi");
gar_30_25_2.df <- twListToDF(gar_30_25_2);
write.csv(gar_30_25_2.df,file="gar_30_25_2.csv");

gar_30_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.6mi");
gar_30_26_2.df <- twListToDF(gar_30_26_2);
write.csv(gar_30_26_2.df,file="gar_30_26_2.csv");

gar_30_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.7mi");
gar_30_27_2.df <- twListToDF(gar_30_27_2);
write.csv(gar_30_27_2.df,file="gar_30_27_2.csv");

gar_30_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-07-27",until ="2019-07-30",geocode="36.99777,-121.54933,2.8mi");
gar_30_28_2.df <- twListToDF(gar_30_28_2);
write.csv(gar_30_28_2.df,file="gar_30_28_2.csv");

garnum30 <- data.frame(rbind(nrow(gar_30_11_2.df),nrow(gar_30_12_2.df),nrow(gar_30_13_2.df),nrow(gar_30_14_2.df),nrow(gar_30_15_2.df),nrow(gar_30_16_2.df),
                             nrow(gar_30_17_2.df),nrow(gar_30_18_2.df),nrow(gar_30_19_2.df),nrow(gar_30_20_2.df),nrow(gar_30_21_2.df),nrow(gar_30_22_2.df),nrow(gar_30_23_2.df),
                             nrow(gar_30_24_2.df),nrow(gar_30_25_2.df),nrow(gar_30_26_2.df),nrow(gar_30_27_2.df),nrow(gar_30_28_2.df)))



radius <- seq(1.1,2.8,0.1);
garnum30 <- cbind(radius,garnum30);
colnames(garnum30) <- c("radius","numtweets")
write.csv(garnum30,file="garnum30.csv");

