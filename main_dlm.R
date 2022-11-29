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

### Practice
These are some aspects of R that I needed to understand in order to succeed on this project

```{r}
# lists

#This is just to practice with lists a bit
telist <- list()
telist <- c(telist, list(superusers))
telist <- c(telist, list(superbooks))
teunlist <- unlist(telist, recursive = TRUE)

# Modifying elements of a dataframe

level2['currentfeat'][level2['ISBN'] == '0195153448'] <- 24
find <- level2[level2$ISBN == '0195153448',] %>%
  pull(currentfeat)

#Interacting with pipes and dplyr

# An example of select and mutate
items <- result %>%
  select(ISBN) %>%
  mutate(
    currentfeat = 0
  )


#An exmaple of filter and %in%
draw <- search %>%
  filter(User.ID %in% tester[[1]])

#Using the intersect function
crosscut <- intersect(features[[1]], features[[7]])

dft1 <- ratings %>%
  slice_sample(n = 10)
dft2 <- ratings %>%
  slice_sample(n = 10)
ccdf <- inner_join(dft1, dft2, by = "ISBN") %>%
  filter(Book.Rating.x == Book.Rating.y)

mdif <- all.equal.numeric(ccdf$Book.Rating.x, ccdf$Book.Rating.y)
all.eqNum <- function(x,y) as.numeric(sub(".*:", '', all.equal(x,y))) # Found this code snippet on rdocumentation.org, awesome! Thanks!
mdif <- all.equal(c(1,2,2), c(1,2,2))
#Using the paste function
brfinal <- paste("Comparing", i, "with", j, "matches =", length(br), sep = ' ')


dfp1 <- matrix(1:20, nrow=5, ncol=4)
practice2 <- c(1,2,3,4)
dfp2 <- dfp1 %*% practice2

dfp3 <- matrix(sample(0:5, replace = TRUE), nrow=5, ncol=4)
dfp3[dfp3 == 0] <- NA
round(rnorm(10),4)

#Troubleshooting

saved <- sampler[1]
sampler <- sampler[-1]
msamp <- data.matrix(sampler) 
class(msamp)
answer <- as.data.frame(msamp) %>%
  mutate(saved, .before = 1)

itemfeatures[itemfeatures == '1'] <- NA
itemfeatures <- itemfeatures[-1]
itemfeatures <- na.omit(itemfeatures)

factorization <- function(tbf, steps, alpha, beta){
  #tbf: to be factored
  featcount <- ncol(tbf) - 1 
  print(c("featcount", featcount))
  saved <- tbf[1]
  tbf <- tbf[-1]
  tbf <- data.matrix(tbf)
  P <- matrix(sample(1:featcount, replace = TRUE)/10, nrow=5, ncol=4)
  Q <- matrix(sample(1:featcount, replace = TRUE)/10, nrow=4, ncol=5)
  counter <- 0
  for (step in 1:steps){
    for (i in 1:nrow(tbf)){
      for (j in 1:ncol(tbf)){
        if(tbf[i,j] > 0){
          #grab both values as vectors
          loss <- tbf[i,j] - P[i,] %*% Q[,j]
          loss <- loss[1,1]
          for (feat in 1:featcount){ #update our two tables. 
            counter <- counter +1
            P[i,feat] <- P[i,feat] + alpha * (2 * loss * Q[feat,j] - beta * P[i,feat]) 
            Q[feat,j] <- Q[feat,j] + alpha * (2 * loss * P[i,feat] - beta * Q[feat,j])
          }
        }
      }
    }
  }
  print(counter)
  reconstituted <- P %*% Q
  answer <- as.data.frame(reconstituted) %>%
    mutate(saved, .before = 1)
  return (list(P,Q))
}
```