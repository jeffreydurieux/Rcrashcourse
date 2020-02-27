# Thu Feb 27 11:37:08 2020 ------------------------------

###### Introduction #######


# master assignment small simulation study
# code a small simulation study where you draw 100 samples from a standard normal
# conduct a one-sample t-test on the simulated data
# store p-values in a vector
# repeat this 10000 times and comment on the results


#### seeds used #######
set.seed(123)


# set my working directory
setwd(dir = "/Users/jeffreydurieux/Documents/Rcrashcourse/")

# source some user defined functions from a R script folder on your laptop
# not used for this script, just an example about the sourcing function
# source("my_functions.R")


###### my simulation ######

pvals <- numeric()

for (i in 1:10000) {
  
  # step 1:
  data <- rnorm(n = 200, mean = 0, sd = 1)
  
  # step 2:
  my_ttest <- t.test(x = data, alternative = 'two.sided', mu = 0)
  
  # step 3:
  pvals[i] <- my_ttest$p.value
  
}

save(pvals, file = 'my_simulation_results.Rdata')

# remove all objects
rm(list = ls())

load(file = 'my_simulation_results.Rdata')

hist(pvals)
abline(v = 0.05, col = 'blue', lwd = 3)

# type 1 error frequency
table( pvals <= 0.05 ) 
sum(pvals <= 0.05) / length(pvals)



### factorial simulation study example ####

factors <- expand.grid(mean = c(0, 1), sd = c(1, 10))
factors

mylist <- list()
# double for loop!

for(fac in 1:4){
    
    pvals <- numeric()
    
    for (i in 1:10000) {
    
    # step 1:
    data <- rnorm(n = 200, mean = factors$mean[fac], 
                  sd = factors$sd[fac])
    
    # step 2:
    my_ttest <- t.test(x = data, alternative = 'two.sided',
                       mu = 0)
    
    # step 3:
    pvals[i] <- my_ttest$p.value
    
  }
  mylist[[fac]] <- pvals
}

factors
hist(mylist[[1]]); abline(v = 0.05, col = 'red', lwd = 3)
hist(mylist[[2]]); abline(v = 0.05, col = 'red', lwd = 3)
hist(mylist[[3]]); abline(v = 0.05, col = 'red', lwd = 3)
hist(mylist[[4]]); abline(v = 0.05, col = 'red', lwd = 3)
