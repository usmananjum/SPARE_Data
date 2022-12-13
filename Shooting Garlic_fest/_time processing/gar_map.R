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

ggmap::register_google(key = "AIzaSyCbRuE6f19KfbnpHv1XY4feiVZTap0hfVM")


coords_gar <- data.frame(cbind(-121.585278,36.997778));
colnames(coords_gar) <- c("Longitude","Latitude");
c0 <- as.vector(destPoint(coords_gar,0,3200));
c30 <- as.vector(destPoint(coords_gar,90,3200));
c90 <- as.vector(destPoint(coords_gar,180,3200));
c180 <- as.vector(destPoint(coords_gar,270,3200));
# from matlab circle_trilateration.m: 
# gar_tri <- c(-120.4067,68.9875); distm(coords_gar,gar_tri,fun=distHaversine);

gar_ref_coords <- data.frame(rbind(c0,c30,c90,c180));
colnames(gar_ref_coords) <- c("Longitude","Latitude");

gar_coords_df <- rbind(coords_gar,gar_ref_coords);
rownames(gar_coords_df) <- NULL;
gar_rad <- as.matrix(dist(gar_coords_df));
rad_seq <- seq(0.012,0.027,0.001);
rad_seq <- seq(0.005,0.04,length.out=16)
rad_circle <- rep(rad_seq,times=nrow(gar_ref_coords));
gar_coords_circle1 <- rep(gar_ref_coords$Longitude,each=length(rad_seq));
gar_coords_circle2 <- rep(gar_ref_coords$Latitude,each=length(rad_seq));
gar_coords_circle <- data.frame(cbind(gar_coords_circle1,gar_coords_circle2,rad_circle));
colnames(gar_coords_circle) <- c("Longitude","Latitude","Radius");

gar_map <- get_googlemap(center = c(coords_gar$Longitude,coords_gar$Latitude),zoom = 12, scale = 2,maptype ='roadmap',color = 'color');
p <- ggmap(gar_map)
p + geom_point(data=gar_ref_coords,aes(x = Longitude, y = Latitude),size=3) + geom_point(data=coords_gar,aes(x = Longitude, y = Latitude),size=3,col='red')
  

ggplot() + geom_circle(data=gar_coords_circle,aes(x0 = Longitude, y0 = Latitude, r = Radius)) + 
    geom_point(data=gar_ref_coords,aes(x = Longitude, y = Latitude),size=3) + 
      geom_point(data=coords_gar,aes(x = Longitude , y = Latitude),size=3,col='red') + theme_void()

coordinates(gar_coords_df) <- ~ Longitude + Latitude
projection(gar_coords_df) <- "+init=epsg:4326"

d_mrc <- spTransform(gar_coords_df, CRS = CRS(projection(gar_map)))

plot(gar_map)





