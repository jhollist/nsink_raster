#Add in multiple segements to see how this works.
library(sf)
library(dplyr)
l1 <- st_linestring(matrix(c(3,5,3,4), ncol = 2, byrow = TRUE))
l2 <- st_linestring(matrix(c(3,4,3,3.5,2.5,3,3,2), ncol = 2, byrow = TRUE))
l3 <- st_linestring(matrix(c(3,2,3,0), ncol = 2, byrow = TRUE))
simple_line_sfc <- st_sfc(l1,l2,l3)
simple_line_sf <- st_sf(ids = c(1,2,3), 
                        geometery = simple_line_sfc,
                        stringsAsFactors = FALSE)
l1_2 <- st_linestring(matrix(c(1,5,3,4), ncol = 2, byrow = TRUE))
l2_2 <- st_linestring(matrix(c(3,4,3,2), ncol = 2, byrow = TRUE))
l3_2 <- st_linestring(matrix(c(3,2,4,0), ncol = 2, byrow = TRUE))
simple_line2 <- st_linestring(matrix(c(1,5,3,4,3,2,4,0), ncol = 2, byrow=TRUE)) 
simple_line2_sfc <- st_sfc(simple_line2)
simple_line2_sf <- st_sf(ids = "A", 
                         geometry = simple_line2_sfc,
                         stringsAsFactors = FALSE)
plot(st_geometry(simple_line_sf), col = simple_line_sf$ids)
plot(st_geometry(simple_line2_sf), col = "pink", add = T)


l1 <- st_linestring(matrix(c(5,10,5,6), ncol = 2, byrow = TRUE))
l2 <- st_linestring(matrix(c(5,6,5,0), ncol = 2, byrow = TRUE))
line <- st_sfc(l1, l2)
line_sf <- st_sf(ids = c("A", "B"), geometry = line1)

z <- st_linestring(matrix(c(2,8,8,8,2,5,8,5), ncol = 2, byrow = TRUE))
zee <- st_sfc(z1)
zee_sf <- st_sf(ids = 1, geometry = zee1)

lwgeom::st_split(zee_sf, st_combine(line_sf)) %>%
  st_collection_extract("LINESTRING") -> zee_split

line_zee_inter <- st_intersection(zee_sf, line_sf) %>%
  st_coordinates()

get_path_ends <- function(fp, streams){
  # remove linear intersections
  streams <- st_difference(st_combine(streams), st_combine(fp))
  splits <- st_split(fp, st_combine(streams))
  splits <- st_collection_extract(splits, "LINESTRING")
  ends <- rbind(splits[1,], splits[nrow(splits),])
  ends
}

path_ends <- get_path_ends(simple_line2_sf, simple_line_sf)

get_flow_lines <- function(fp_ends, streams){
  flowlines <- st_split(streams, st_combine(fp_ends))
  flowlines <- st_collection_extract(flowlines, "LINESTRING")
  flowlines <- flowlines[c(-1,-nrow(flowlines)),]
  flowlines
}

flowlines <- get_flow_lines(path_ends, simple_line_sf)

combined_flow_path <- st_union(path_ends, flowlines)

