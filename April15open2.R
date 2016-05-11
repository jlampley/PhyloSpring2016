#plot (phy)
#PhyloMethSpring2016.R is my command file and April15open2.R is my run file

rm(list=ls())
source("C:\\Users\\JAL\\Desktop\\PhyloMeth\\PhyloSpring2016\\PhyloMethSpring2016.R")

nreps = 1000
ntax=47
all.counts <- data.frame()
for (i in sequence(nreps)) {
  new.tree <- sim.bdtree(b=1, d=0, n=ntax, stop="taxa")
  clade.counts <- GetCladeCounts(new.tree)
  all.counts <- rbind(all.counts, clade.counts)
}


colnames(all.counts) <- c("A", "B", "C")
print(all.counts)


all.counts$ABoverC <- (all.counts$A * all.counts$B) / all.counts$C
all.counts$AoverC <- (all.counts$A)/(all.counts$C)

#my observed tree_removing the outgroup also.
melantree <- read.tree("C:\\Users\\JAL\\Desktop\\PhyloMeth\\datedtrillium.tre")
melantree.reduced <- drop.tip(melantree, tip="Smilax_riparia_matK_trnLF")
plot.phylo(melantree.reduced)

#plot this. Puts your observed tree on this plot. Is it in the cloud  of points or is it weird?
plot(all.counts$AoverC, all.counts$ABoverC, main="Three Clade Diversity Comparison", 
     xlab="A/C", ylab="AB/C", type="p", col="red", cex=0.3, pch=20)
my.results <- GetCladeCounts(melantree.reduced)
#points(my.results$A / my.results$C, (my.results$A * my.results$B) / my.results$C, pch=20, col="red")
points((11/2),((11*34)/2))
points(20, 30, type="p", col="blue", cex=0.3, pch=20)
#my observed tree is not significantly different from the simulation trees.

#my_melan_book <- read.csv ("C:\\Users\\JAL\\Desktop\\Melanthiaceae_book.csv", stringsAsFactors = FALSE, header = FALSE)
#my_melan_book <- my_melan_book[,c(1:3)]
#my_names <- rep(NA, dim(my_melan_book)[1])
#for (i in sequence(length(my_names))) {
#  my_names[i] <- paste(my_melan_book[i,], collapse="_")
#}