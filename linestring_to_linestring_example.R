library(sf)

#What I have
l1 <- st_linestring(matrix(c(1,1,2,2,3,1),ncol = 2, byrow = T))
l2 <- st_linestridng(matrix(c(3,1,3,2,4,2),ncol = 2, byrow = T))
l3 <- st_linestring(matrix(c(4,2,5,1,6,1),ncol = 2, byrow = T))
all_lines <- st_sfc(l1,l2,l3)
all_lines

#What I want
goal_line <- st_linestring(matrix(c(1,1,2,2,3,1,3,2,4,2,5,1,6,1),
                                  ncol = 2, byrow = T))
goal_line <- st_sfc(goal_line)
goal_line

#What I did
goal_coords <- unique(st_coordinates(all_lines)[,-3])
goal_line_solution <- st_linestring(goal_coords)
goal_line_solution <- st_sfc(goal_line_solution)
goal_line_solution


