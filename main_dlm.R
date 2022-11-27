library(reshape2)
library(dplyr)
setwd("/home/dlmee/Info523/final_project")
getwd()
result <- read.csv(file = "Books.csv")
ratings <- read.csv(file = "Ratings.csv")
reviews <- read.csv(file = "Users.csv")

search <- ratings[ratings$Book.Rating != '0',]
curious <- result[result$ISBN %in% df4,]

#Get rid of rows that occur less than 60 times. This is making sure that we're only getting reviewers who consistently review. 
df2 <- search %>%
  group_by(User.ID) %>%
  filter(n() >= 60)

# Find everyone who rates at least one a ten, make it distinct
df3 <- df2 %>%
  filter(grepl('10', Book.Rating)) %>%
  distinct(User.ID, .keep_all = TRUE)

# Find users who rated at least 4 books a 10
features <- df3 %>%
  group_by(ISBN) %>%
  filter(n() >= 4) %>%
  distinct(ISBN, .keep_all = TRUE) %>%
  pull(User.ID)

#Identify the features, boosted to 9

#Now to build the features

# Grab user. 
step <- search %>%
  filter(grepl('277427', User.ID))

#This code is for selecting all users who had a similar rating.
allusers <- ratings %>%
  filter(grepl('002542730X', ISBN)) %>%
  filter(grepl('10', Book.Rating)) %>%
  pull(User.ID)

featselect <- function(superusers, ratings){
  ratings <- ratings[ratings$Book.Rating != '0',]
  features <- list()
  for (super in superusers){
    
  }
}
superuser <- NULL
#This is the code to select by row. Combine with the code above the for loop. 
for (row in 1:nrow(step)){
  allusers <- ratings %>%
    filter(grepl(step[row,2], ISBN)) %>%
    filter(grepl(step[row,3], Book.Rating)) %>%
    pull(User.ID)
  print(c("Finished a run:", row))
  superuser <- append(superuser, allusers)
}

# Just to show the format print(c(step[row,2], step[row,3]))

for (feat in featlist){
  # All books from superuser
  step1 <- search %>%
    filter(grepl(feat, User.ID))
  # Every user who gave one of those ratings
  users <- c()
  #loop through books add users who 
  for (row in 1:nrow(step1)){
    allusers <- ratings[ratings$ISBN == step1[row, 1] & ratings$Book.Rating == step1[row, 2]]
    users <- append(users, allusers$)
  }
}