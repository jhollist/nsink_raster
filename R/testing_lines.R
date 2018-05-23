#Add in multiple segements to see how this works.
library(sf)
library(dplyr)
l1 <- matrix(c(3,5,3,4), ncol = 2, byrow = TRUE)
l2 <- matrix(c(3,4,3,2), ncol = 2, byrow = TRUE)
l3 <- matrix(c(3,2,3,0), ncol = 2, byrow = TRUE)
ml1 <- list(l1,l2,l3)
simple_line <- st_multilinestring(ml1)
simple_line_sfc <- st_sfc(simple_line)
simple_line_sf <- st_sf(geometery = simple_line_sfc) %>%
  mutate(cols = c("red","green","blue"))

x2 <- c(0,1,2,2,3)
y2 <- c(5,4,3,2,1)
simple_line2 <- st_linestring(as.matrix(data.frame(x2,y2)))
simple_line2_sfc <- st_sfc(simple_line2)
simple_line2_sf <- st_sf(id = 1, geometry = simple_line2_sfc)

simple_sym_diff <- st_sym_difference(simple_line_sf, simple_line2_sf)
simple_dff <- st_difference(simple_line2_sf, simple_line_sf) #this one
