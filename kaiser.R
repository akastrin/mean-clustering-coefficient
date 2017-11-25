rfind <- function(adj) seq(along = adj)[adj != 0]

cc_kaiser <- function(adj) {
  n_count <- nrow(adj)
  w <- rep(0, n_count)
  # Number of nodes with at least two neighbors
  n_neigh = 0
  for (i in 1:n_count) {
    n <- rfind(adj[i, ] + t(adj[, i]))
    n_e <- 0
    l_n <- length(n)
    for (j in 1:l_n) {
      vec <- t(as.matrix(adj[n[j], ]))
      n_v <- rfind(vec)
      n_e <- n_e + l_n + length(n_v) - length(union(n, n_v))
    }
    if (l_n > 1) {
      w[i] <- n_e / (l_n * (l_n - 1))
      n_neigh <- n_neigh + 1
    }
  }
  cl <- sum(w) / n_neigh
  return(cl)
}









