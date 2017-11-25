library(igraph)
library(Rcpp)

source("./kaiser.R")
sourceCpp("./kaiser.cpp")

g <- erdos.renyi.game(100, 0.2)
adj <- get.adjacency(g, sparse = FALSE)

cc_kaiser(adj)
kaiser(adj)
