library(igraph)
gdf <- data.frame(from = c(1,2,3,5), to = c(2,3,4,3), id = c("A","B","C","D"))
g1 <- graph_from_data_frame(gdf, directed = TRUE)
plot(g1)
#Shortest Path with the fromnode at the top and fromnode at the bottom
#edge_attr will return labels (use stream_comid)
#not working completely yet.
idx <- all_simple_paths(g1, 5, 4, "all")[[1]]
igraph::edge_attr(g1, "id")[idx]


#g1_vec <- c(1,2,2,3,3,4,4,5,5,6,7,8,8,3,9,10,10,11,11,8,12,13,13,5,14,13)
#g1_df <- data.frame(matrix(g1_vec, ncol = 2, byrow = T), id = LETTERS[1:13])
#g1 <- graph_from_data_frame(g1_df, directed = TRUE)