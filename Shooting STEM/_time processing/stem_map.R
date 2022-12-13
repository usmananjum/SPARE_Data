library(ggmap)
library(devtools)
library(twitteR)
library(tm)
library(ggplot2)
library(RColorBrewer)
library(geosphere)
library(ggforce)
library(rgeos)
library(ggplot2)
library(rgdal)
library(dismo)
#devtools::install_github("dkahle/ggmap")
devtools::install_github("dkahle/ggmap", ref = "tidyup")

ggmap::register_google(key = "AIzaSyCwjYlp-CVJmXVZplI2BfV_lejcFahbdDM")


coords_stem <- data.frame(cbind(-104.9979,39.556));
colnames(coords_stem) <- c("Longitude","Latitude");
c0 <- as.vector(destPoint(coords_stem,0,3200));
c30 <- as.vector(destPoint(coords_stem,30,3200));
c90 <- as.vector(destPoint(coords_stem,90,3200));
c180 <- as.vector(destPoint(coords_stem,180,2400));

stem_ref_coords <- data.frame(rbind(c0,c30,c90,c180));
colnames(stem_ref_coords) <- c("Longitude","Latitude");

stem_coords_df <- rbind(coords_stem,stem_ref_coords);
rownames(stem_coords_df) <- NULL;
stem_rad <- as.matrix(dist(stem_coords_df));
rad_seq <- seq(0.012,0.027,0.001);
rad_seq <- seq(0.005,0.04,length.out=16)
rad_circle <- rep(rad_seq,times=nrow(stem_ref_coords));
stem_coords_circle1 <- rep(stem_ref_coords$Longitude,each=length(rad_seq));
stem_coords_circle2 <- rep(stem_ref_coords$Latitude,each=length(rad_seq));
stem_coords_circle <- data.frame(cbind(stem_coords_circle1,stem_coords_circle2,rad_circle));
colnames(stem_coords_circle) <- c("Longitude","Latitude","Radius");



stem_map <- get_googlemap(center = c(coords_stem$Longitude,coords_stem$Latitude),zoom = 12, scale = 2,maptype ='roadmap',color = 'color');
p <- ggmap(stem_map)
p + geom_point(data=stem_ref_coords,aes(x = Longitude, y = Latitude),size=3) + geom_point(data=coords_stem,aes(x = Longitude, y = Latitude),size=3,col='red')
  

ggplot() + geom_circle(data=stem_coords_circle,aes(x0 = Longitude, y0 = Latitude, r = Radius)) + 
    geom_point(data=stem_ref_coords,aes(x = Longitude, y = Latitude),size=3) + 
      geom_point(data=coords_stem,aes(x = Longitude , y = Latitude),size=3,col='red') + theme_void()

coordinates(stem_coords_df) <- ~ Longitude + Latitude
projection(stem_coords_df) <- "+init=epsg:4326"

d_mrc <- spTransform(stem_coords_df, CRS = CRS(projection(stem_map)))

plot(stem_map)





