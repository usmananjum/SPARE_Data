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

ggmap::register_google(key = "AIzaSyBSd04aiICaUcFiqbq4YDTp7bJwxpEwSdU")


coords_virg <- data.frame(cbind(-76.0575,36.7509));
colnames(coords_virg) <- c("Longitude","Latitude");
c0 <- as.vector(destPoint(coords_virg,0,3200));
c1 <- as.vector(destPoint(coords_virg,90,3200));
c2 <- as.vector(destPoint(coords_virg,180,3200));
c3 <- as.vector(destPoint(coords_virg,270,3200));

virg_ref_coords <- data.frame(rbind(c0,c1,c2,c3));
colnames(virg_ref_coords) <- c("Longitude","Latitude");

virg_coords_df <- rbind(coords_virg,virg_ref_coords);
rownames(virg_coords_df) <- NULL;
virg_rad <- as.matrix(dist(virg_coords_df));
rad_seq <- seq(0.012,0.027,0.001);
rad_seq <- seq(0.005,0.04,length.out=16)
rad_circle <- rep(rad_seq,times=nrow(virg_ref_coords));
virg_coords_circle1 <- rep(virg_ref_coords$Longitude,each=length(rad_seq));
virg_coords_circle2 <- rep(virg_ref_coords$Latitude,each=length(rad_seq));
virg_coords_circle <- data.frame(cbind(virg_coords_circle1,virg_coords_circle2,rad_circle));
colnames(virg_coords_circle) <- c("Longitude","Latitude","Radius");

virg_map <- get_googlemap(center = c(coords_virg$Longitude,coords_virg$Latitude),zoom = 12, scale = 2,maptype ='roadmap',color = 'color');
p <- ggmap(virg_map)
p + geom_point(data=virg_ref_coords,aes(x = Longitude, y = Latitude),size=3) + geom_point(data=coords_virg,aes(x = Longitude, y = Latitude),size=3,col='red')
  







