# Project Euler problem #2
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
#
# See https://projecteuler.net/problem=3
#
# The Idea here is to:
#
# 1) Search all even / uneven natural numbers up to the square root of n (600851475143), 
#    thus finding all possible factors, as potential factors larger than the square root 
#    must have necessarily have twin-factors below the root
#
# 2) To find (potential) twin factors
#
# 3) Test each one for being a factor of n. Then to test all of the factors found if they are prime
#
# 4) Take the sum of the primes - hooray!

# Setting up the initial numbers:

  n <- 600851475143
  n_squared <- sqrt(n)
    
# Testing if n is even or not (just as a shortcut)
  
  if(n %% 2==0){
    cat("number is even, proceeding")
    i <- 2
  } else if (n %% 2!=0) {
    cat("number is uneven, proceeding")
    i <- 3
  }
  
# Creating empty vector to hold the factors
  
  factors <- vector()
  p <- 1
  
# Testing all natural (un)even numbers from 2 to n-squared
  
  while(i <= n_squared){
    f <- n/i
    if(f%%1==0){
      factors[p] <- i
      p <- p+1
    }
    i <- i+2
  }
  
# Finding twins for each factor and reducing to a vector of all factors to n
  
  factors <- sort(union(factors, n/factors))
  
# Defining function to test if prime (thanks to http://stackoverflow.com/questions/19767408/prime-number-function-in-r  !!)
  
  is.prime <- function(n) n == 2L || n == 3L || all(n %% 2L:ceiling(sqrt(n)) != 0)
  
# Testing for primes

  factors_prime <- sapply(factors, FUN=is.prime)
  
# Getting highest prime factor
  
  solution <- tail(factors[factors_prime], n=1)
  
  cat("The solution is: ", solution)
