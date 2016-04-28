#this is my command file, run file is April15open2.R
library(phytools)
library(ape)
library(geiger)

GetCladeCounts <- function(phy) {
  X <- nodeHeights(phy)
  focal.row <- which.min(X[,2])
  split.node <- phy$edge[focal.row,2]
  AB.nodes <- phy$edge[which(phy$edge[,1]==split.node),2]
  C.possible.node <- phy$edge[which(X[,1]==0),2]
  C.node <- C.possible.node[-which(C.possible.node==split.node)]
  final.result <- c(sort(c(CountDescendantTips(phy, AB.nodes[1]), CountDescendantTips(phy, AB.nodes[2]))), CountDescendantTips(phy, C.node))
  names(final.result) <- c("A", "B", "C")
  return(final.result)
}

CountDescendantTips <- function(phy, node) {
  all.descendants <- getDescendants(phy, node)
  return(length(which(all.descendants <= Ntip(phy))))
}


