#April12016practice
#plot (phy)
#PhyloMethSpring2016.R is my command file and April15open2.R is my run file

source("C:\\Users\\JAL\\Desktop\\PhyloMeth\\PhyloSpring2016\\PhyloMethSpring2016.R")
my_melan_book <- read.csv ("C:\\Users\\JAL\\Desktop\\Melanthiaceae_book.csv", stringsAsFactors = FALSE, header = FALSE)
my_melan_book <- my_melan_book[,c(1:3)]
my_names <- rep(NA, dim(my_melan_book)[1])
for (i in sequence(length(my_names))) {
  my_names[i] <- paste(my_melan_book[i,], collapse="_")
}