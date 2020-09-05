############ packages required ###########

library(rmarkdown)
library(arules)
library(arulesViz)
install.packages("igraph")
library(igraph)




########### Understanding and reading the data #####

book <- read.csv(file.choose())

View(book)
colnames(book)
nrow(book)#[1] 2000
ncol(book)#[1] 11
str(book)

####  apriori algorithm ###########

rules <- apriori(as.matrix(book),parameter=list(support=0.02, confidence = 0.5,minlen=5))
?apriori

rules

inspect(head(sort(rules, by = "lift")))  

head(quality(rules))

########### Exploratory Data Analysis ##########

plot(rules,method = "scatterplot")


plot(rules,method = "grouped")


plot(rules,method = "graph")

