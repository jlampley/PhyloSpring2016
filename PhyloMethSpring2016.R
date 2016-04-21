my_melan_book <- read.csv ("C:\\Users\\JAL\\Desktop\\Melanthiaceae_book.csv", stringsAsFactors = FALSE, header = FALSE)
my_melan_book <- my_melan_book[,c(1:3)]
my_names <- rep(NA, dim(my_melan_book)[1])
for (i in sequence(length(my_names))) {
  my_names[i] <- paste(my_melan_book[i,], collapse="_")
}
nreps = 1000
all.counts <- data.frame()
for (i in sequence(nreps)) {
  new.tree <- sim.bd(b=1, d=0, ntax=60)
  clade.counts <- GetCladeCounts(new.tree)
  all.counts <- rbind(all.counts, clade.counts)
}

colnames(all.counts) <- c("A", "B", "C")
print(all.counts)

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


all.counts$ABoverC <- (all.counts$A * all.counts$B) / all.counts$C
all.counts$AoverC <- ___________

#plot this. Puts your observed tree on this plot. Is it in the cloud  of points or is it weird?
plot(all.counts$AoverC, all.counts$ABoverC)
my.results <- GetCladeCounts(my.tree)
points(my.results$A / my.results$C, (my.results$A + my.results$B) / my.results$C, pch=20, col="red")
