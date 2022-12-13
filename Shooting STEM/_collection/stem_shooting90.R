# c90 coordinates from stem_shooting

stem_90_11_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,1.1mi");
stem_90_11_2.df <- twListToDF(stem_90_11_2);
write.csv(stem_90_11_2.df,file="stem_90_11_2.csv"); 

stem_90_12_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,1.2mi");
stem_90_12_2.df <- twListToDF(stem_90_12_2);
write.csv(stem_90_12_2.df,file="stem_90_12_2.csv");

stem_90_13_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,1.3mi");
stem_90_13_2.df <- twListToDF(stem_90_13_2);
write.csv(stem_90_13_2.df,file="stem_90_13_2.csv");

stem_90_14_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,1.4mi");
stem_90_14_2.df <- twListToDF(stem_90_14_2);
write.csv(stem_90_14_2.df,file="stem_90_14_2.csv");

stem_90_15_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,1.5mi");
stem_90_15_2.df <- twListToDF(stem_90_15_2);
write.csv(stem_90_15_2.df,file="stem_90_15_2.csv");

stem_90_16_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,1.6mi");
stem_90_16_2.df <- twListToDF(stem_90_16_2);
write.csv(stem_90_16_2.df,file="stem_90_16_2.csv");

stem_90_17_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,1.7mi");
stem_90_17_2a.df <- twListToDF(stem_90_17_2a);
stem_90_17_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,1.7mi");
stem_90_17_2b.df <- twListToDF(stem_90_17_2b);
stem_90_17_2.df <- rbind(stem_90_17_2a.df,stem_90_17_2b.df);
write.csv(stem_90_17_2.df,file="stem_90_17_2.csv");

stem_90_18_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,1.8mi");
stem_90_18_2a.df <- twListToDF(stem_90_18_2a);
stem_90_18_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,1.8mi");
stem_90_18_2b.df <- twListToDF(stem_90_18_2b);
stem_90_18_2.df <- rbind(stem_90_18_2a.df,stem_90_18_2b.df);
write.csv(stem_90_18_2.df,file="stem_90_18_2.csv");

stem_90_19_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,1.9mi");
stem_90_19_2a.df <- twListToDF(stem_90_19_2a);
stem_90_19_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,1.9mi");
stem_90_19_2b.df <- twListToDF(stem_90_19_2b);
stem_90_19_2.df <- rbind(stem_90_19_2a.df,stem_90_19_2b.df);
write.csv(stem_90_19_2.df,file="stem_90_19_2.csv");

stem_90_20_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,2.0mi");
stem_90_20_2a.df <- twListToDF(stem_90_20_2a);
stem_90_20_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,2.0mi");
stem_90_20_2b.df <- twListToDF(stem_90_20_2b);
stem_90_20_2.df <- rbind(stem_90_20_2a.df,stem_90_20_2b.df);
write.csv(stem_90_20_2.df,file="stem_90_20_2.csv");

stem_90_21_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,2.1mi");
stem_90_21_2a.df <- twListToDF(stem_90_21_2a);
stem_90_21_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,2.1mi");
stem_90_21_2b.df <- twListToDF(stem_90_21_2b);
stem_90_21_2.df <- rbind(stem_90_21_2a.df,stem_90_21_2b.df);
write.csv(stem_90_21_2.df,file="stem_90_21_2.csv");

stem_90_22_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,2.2mi");
stem_90_22_2a.df <- twListToDF(stem_90_22_2a);
stem_90_22_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,2.2mi");
stem_90_22_2b.df <- twListToDF(stem_90_22_2b);
stem_90_22_2.df <- rbind(stem_90_22_2a.df,stem_90_22_2b.df);
write.csv(stem_90_22_2.df,file="stem_90_22_2.csv");

stem_90_23_2a <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-09",geocode="39.55599,-104.96067,2.3mi");
stem_90_23_2a.df <- twListToDF(stem_90_23_2a);
stem_90_23_2b <- searchTwitter(searchString=" ",n=2000000,since="2019-05-09",until ="2019-05-10",geocode="39.55599,-104.96067,2.3mi");
stem_90_23_2b.df <- twListToDF(stem_90_23_2b);
stem_90_23_2.df <- rbind(stem_90_23_2a.df,stem_90_23_2b.df);
write.csv(stem_90_23_2.df,file="stem_90_23_2.csv");

stem_90_24_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,2.4mi");
stem_90_24_2.df <- twListToDF(stem_90_24_2);
write.csv(stem_90_24_2.df,file="stem_90_24_2.csv");

stem_90_25_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,2.5mi");
stem_90_25_2.df <- twListToDF(stem_90_25_2);
write.csv(stem_90_25_2.df,file="stem_90_25_2.csv");

stem_90_26_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,2.6mi");
stem_90_26_2.df <- twListToDF(stem_90_26_2);
write.csv(stem_90_26_2.df,file="stem_90_26_2.csv");

stem_90_27_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,2.7mi");
stem_90_27_2.df <- twListToDF(stem_90_27_2);
write.csv(stem_90_27_2.df,file="stem_90_27_2.csv");

stem_90_28_2 <- searchTwitter(searchString=" ",n=2000000,since="2019-05-06",until ="2019-05-10",geocode="39.55599,-104.96067,2.8mi");
stem_90_28_2.df <- twListToDF(stem_90_28_2);
write.csv(stem_90_28_2.df,file="stem_90_28_2.csv");

stemnum90 <- data.frame(rbind(nrow(stem_90_11_2.df),nrow(stem_90_12_2.df),nrow(stem_90_13_2.df),nrow(stem_90_14_2.df),nrow(stem_90_15_2.df),nrow(stem_90_16_2.df),
                              nrow(stem_90_17_2.df),nrow(stem_90_18_2.df),nrow(stem_90_19_2.df),nrow(stem_90_20_2.df),nrow(stem_90_21_2.df),nrow(stem_90_22_2.df),nrow(stem_90_23_2.df),
                              nrow(stem_90_24_2.df),nrow(stem_90_25_2.df),nrow(stem_90_26_2.df),nrow(stem_90_27_2.df),nrow(stem_90_28_2.df)))



radius <- seq(1.1,2.8,0.1);
stemnum90 <- cbind(radius,stemnum90);
colnames(stemnum90) <- c("radius","numtweets")
write.csv(stemnum90,file="stemnum90.csv");
