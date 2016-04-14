my_melan_book <- read.csv ("C:\\Users\\JAL\\Desktop\\Melanthiaceae_book.csv", stringsAsFactors = FALSE, header = FALSE)
my_melan_book <- my_melan_book[,c(1:3)]
my_names <- rep(NA, dim(my_melan_book)[1])
for (i in sequence(length(my_names))) {
  my_names[i] <- paste(my_melan_book[i,], collapse="_")
}