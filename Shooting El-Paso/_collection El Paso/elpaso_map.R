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


coords_elpaso <- data.frame(cbind(-106.3843,31.7771));
colnames(coords_elpaso) <- c("Longitude","Latitude");
c0 <- as.vector(destPoint(coords_elpaso,0,3200));
c30 <- as.vector(destPoint(coords_elpaso,90,3200));
c90 <- as.vector(destPoint(coords_elpaso,180,3200));
c180 <- as.vector(destPoint(coords_elpaso,270,2400));

elpaso_ref_coords <- data.frame(rbind(c0,c30,c90,c180));
colnames(elpaso_ref_coords) <- c("Longitude","Latitude");

elpaso_map <- get_googlemap(center = c(coords_elpaso$Longitude,coords_elpaso$Latitude),zoom = 12, scale = 2,maptype ='roadmap',color = 'color');
p <- ggmap(elpaso_map)
p + geom_point(data=elpaso_ref_coords,aes(x = Longitude, y = Latitude),size=3) + geom_point(data=coords_elpaso,aes(x = Longitude, y = Latitude),size=3,col='red')


elpaso_coords_df <- rbind(coords_elpaso,elpaso_ref_coords);
rownames(elpaso_coords_df) <- NULL;
elpaso_rad <- as.matrix(dist(elpaso_coords_df));
rad_seq <- seq(0.012,0.027,0.001);
rad_seq <- seq(0.005,0.04,length.out=16)
rad_circle <- rep(rad_seq,times=nrow(elpaso_ref_coords));
elpaso_coords_circle1 <- rep(elpaso_ref_coords$Longitude,each=length(rad_seq));
elpaso_coords_circle2 <- rep(elpaso_ref_coords$Latitude,each=length(rad_seq));
elpaso_coords_circle <- data.frame(cbind(elpaso_coords_circle1,elpaso_coords_circle2,rad_circle));
colnames(elpaso_coords_circle) <- c("Longitude","Latitude","Radius");

ggplot() + geom_circle(data=elpaso_coords_circle,aes(x0 = Longitude, y0 = Latitude, r = Radius)) + 
    geom_point(data=elpaso_ref_coords,aes(x = Longitude, y = Latitude),size=3) + 
      geom_point(data=coords_elpaso,aes(x = Longitude , y = Latitude),size=3,col='red') + theme_void()

coordinates(elpaso_coords_df) <- ~ Longitude + Latitude
projection(elpaso_coords_df) <- "+init=epsg:4326"

d_mrc <- spTransform(elpaso_coords_df, CRS = CRS(projection(elpaso_map)))

plot(elpaso_map)





