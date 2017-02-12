# Project Euler problem #1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
# See https://projecteuler.net/problem=1

  three <- seq(from=0, to=999, by=3)
  five <- seq(from=0, to=999, by=5)
  
  solution <- sum(union(three, five))
  cat("The solution is: ", solution)
