library(igraph)
gdf <- data.frame(from = c(1,2,3,5), to = c(2,3,4,3), id = c("A","B","C","D"))
g1 <- graph_from_data_frame(gdf, directed = FALSE)
plot(g1)
idx <- shortest_paths(g1, "1", "4", output = "epath", mode = "out")$epath[[1]]
igraph::edge_attr(g1, "id", idx)



g2_vec <- c(1,2,2,3,3,4,4,5,5,6,7,8,8,3,9,10,10,11,11,8,12,13,13,5,14,13)
g2_df <- data.frame(matrix(g2_vec, ncol = 2, byrow = T), id = LETTERS[1:13])
g2 <- graph_from_data_frame(g2_df, directed = TRUE)
plot(g2)
