
#What I have
l1 <- st_linestring(matrix(c(1,1,2,2,3,1),ncol = 2, byrow = T))
l2 <- st_linestring(matrix(c(3,1,3,2,4,2),ncol = 2, byrow = T))
l3 <- st_linestring(matrix(c(4,2,5,1,6,1),ncol = 2, byrow = T))
all_lines <- st_sfc(l1,l2,l3)

#What I want
goal_line <- st_linestring(matrix(c(1,1,2,2,3,1,3,2,4,2,5,1,6,1),
                                  ncol = 2, byrow = T))

#What I needed to do
goal_line_solution <- st_linestring(unique(st_coordinates(all_lines)[,-3]))

