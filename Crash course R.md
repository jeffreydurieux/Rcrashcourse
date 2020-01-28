Crash course R
========================================================
author: Jeffrey Durieux, MSc
date: January 2020
autosize: true


Introduction
========================================================
Who am I:
<br>
- PhD candidate methodology and statistics department
- Project: dev. new data analysis tools for fMRI (in $\texttt{R}$)
- former M&S master student and psychology bachelor student Leiden University
- $\texttt{R}$-enthousiast: daily user of $\texttt{R}$

Learning goals 
========================================================

The main learning goals: 

<hr>

- First introduction to $\texttt{R}$ and Rstudio
- Data generation/simulation
- Basic understanding of programming/control flows 

Learning goals
=================
- Homework exercises from M&S mastercourse R (handout)
- **Important: practice everyday (e.g., 20 min)**
- $\texttt{R}$ has a notoriously steep learning curve
  - quite confusing some times
  - especially when you're used to different languages
  
email: j.durieux@fsw.leidenuniv.nl


Short Demo R and Rstudio
======


Exercise 01 - 01: R as a calculator
========


```r
1 + 10
```

```
[1] 11
```

```r
sqrt(16)
```

```
[1] 4
```

```r
?sqrt # questionmark + function to get help
```
- other help: www.google.com and google 'R: -question-'

Exercise 01 - 02: define vectors
========

```r
x <- c(0,7,1)
y <- c(1,0,-1)
```

<br>
Do exercises 01-02 - 01-04


Built-in functions
===================================
R has many built-in functions. Some examples:


```r
x1 <- rep(1, times=20)
x1
```

```
 [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
```

```r
mean(x1)
```

```
[1] 1
```

```r
length(x1)
```

```
[1] 20
```

Indexing
============

```r
vec <- c(11,12,13,14,15)
vec[1]
```

```
[1] 11
```

```r
vec[5]
```

```
[1] 15
```

```r
vec[2:4]
```

```
[1] 12 13 14
```


Simulating data 
===========
With R you can easily simulate data from a distribution


```r
y1 <- rnorm(n = 1000, mean = 0, sd = 1)
hist(y1)
```

![plot of chunk unnamed-chunk-5](Crash course R-figure/unnamed-chunk-5-1.png)

Replicating your data simulation
============

```r
set.seed(1)
x <- rnorm(n = 5)
x
```

```
[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
```



Homework
============
- All exercises of chapter 1
- 02-01, 02-05 and 02-06
- Extra: master assignment 1


Week 2
==============================

Main learning goals:

- Perform simple data analysis
- programming skills
  - user defined functions
  - for loop
  - conditionals (if ifelse)
- Miscellaneous / useful stuff for a simulation study

Simple data analysis
==============================

```r
# 04-03 a
data("mtcars")
#View(mtcars)
row.names(mtcars)
```

```
 [1] "Mazda RX4"           "Mazda RX4 Wag"       "Datsun 710"         
 [4] "Hornet 4 Drive"      "Hornet Sportabout"   "Valiant"            
 [7] "Duster 360"          "Merc 240D"           "Merc 230"           
[10] "Merc 280"            "Merc 280C"           "Merc 450SE"         
[13] "Merc 450SL"          "Merc 450SLC"         "Cadillac Fleetwood" 
[16] "Lincoln Continental" "Chrysler Imperial"   "Fiat 128"           
[19] "Honda Civic"         "Toyota Corolla"      "Toyota Corona"      
[22] "Dodge Challenger"    "AMC Javelin"         "Camaro Z28"         
[25] "Pontiac Firebird"    "Fiat X1-9"           "Porsche 914-2"      
[28] "Lotus Europa"        "Ford Pantera L"      "Ferrari Dino"       
[31] "Maserati Bora"       "Volvo 142E"         
```

Simple data analysis
==============================

```r
# 04-03 b
aggregate(mtcars$hp~mtcars$am, FUN = mean)
```

```
  mtcars$am mtcars$hp
1         0  160.2632
2         1  126.8462
```

Simple data analysis
==============================

```r
# 04-03 b boxplot
boxplot(mtcars$hp~mtcars$am)
```

![plot of chunk unnamed-chunk-9](Crash course R-figure/unnamed-chunk-9-1.png)

Simple data analysis
==============================

```r
# 04-03 c anova
aov(mtcars$hp~mtcars$am)
```

```
Call:
   aov(formula = mtcars$hp ~ mtcars$am)

Terms:
                mtcars$am Residuals
Sum of Squares     8619.5  137107.4
Deg. of Freedom         1        30

Residual standard error: 67.60359
Estimated effects may be unbalanced
```

Simple data analysis
==============================

```r
# 04-03 c anova
myanova <- aov(mtcars$hp~mtcars$am)
summary(myanova)
```

```
            Df Sum Sq Mean Sq F value Pr(>F)
mtcars$am    1   8619    8619   1.886   0.18
Residuals   30 137107    4570               
```


<!-- Simple data analysis -->
<!-- ============================== -->
<!-- ```{r} -->
<!-- ## 04-03 e anova -->
<!-- myanova <- aov( mtcars$hp ~ mtcars$am * mtcars$qsec ) -->
<!-- summary(myanova) -->
<!-- ``` -->



Programming skills: user defined functions
==============================

```r
# user defined function skeleton
myfun <- function(arg1, arg2){
  # do something with input arguments
  result <- arg1 + arg2 
  return( result )
}
myfun(1,5)
```

```
[1] 6
```

Programming skills: for loop
==============================

```r
# for loop skeleton
for( i in 1:5){
  cat("This is iteration " , i, "\n")
}
```

```
This is iteration  1 
This is iteration  2 
This is iteration  3 
This is iteration  4 
This is iteration  5 
```

Programming skills: if statement
==============================

```r
x <- 20
if(x == 20){
  cat("This code is executed")
}
```

```
This code is executed
```

Programming skills: if else statement
==============================

```r
x <- "red"
if(x == "red"){
  cat("This code is only executed when value of x = 'red'")
}else{
  cat("This code is only executed when value of x = is different than 'red' ")
}
```

```
This code is only executed when value of x = 'red'
```



Programming skills: pseudocode simulation study
==============================

```r
# for loop pseudocode

MyResults <- numeric() # initialize a vector to be filled
for( simulation in 1:1000){
  set.seed(simulation) # or use a different seed
  
  # simulate data 
  
  # perform the analysis 
  
  # check performance 
  
  # store results in MyResults
  MyResults[simulation] <- result
}
```

Programming skills: Miscellaneous
==============================

- set.seed()
- expand.grid()
- setwd()
- save()

Master assignment 
==============================
Write a R-script that:
- step1: simulates 100 samples from a standard normal distribution
- step2: performs a one sample t-test on that sampled data
- step3: store the computed p-value in an object

do step 1 - step 3 10000 times and comment on your findings about the 10000 computed p-values
