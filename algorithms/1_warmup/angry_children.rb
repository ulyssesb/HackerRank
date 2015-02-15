#!/usr/bin/ruby

###
# SOLUTION
###
# First we have to order the array of packets and then loop through it comparing
# the n[i] element with n[i+k] element, from i=0 until i=n-k.
# For each interaction n[i] holds min(xi...xk) and n[i+k] holds max(xi...xk).
# When i=0 we set MIN_UNFAIRNESS = n[k]-n[0], and for i >= 1 we update the 
# minimum: 
#   if n[i+k]-n[i] < MIN_UNFAIRNESS then MIN_UNFAIRNESS = n[i+k]-n[i]

###
# HELPERS & CONSTANTS
###
def min_unfairness (candy, n, k)
  # First, sorting the array
  candy.sort!

  # puts candy.inspect

  # Initialize with the first and k element 
  min = candy[k-1] - candy[0]

  # For each subsequential k elements, we have to find the min. unfairness
  for i in 1..(n-k) 
    # puts "i=#{i} n[i+k]=#{candy[i+k-1]} n[i]=#{candy[i]} : #{candy[i+k-1] - candy[i]} | min=#{min}"
    min = candy[i+k-1] - candy[i] if candy[i+k-1] - candy[i] < min
  end

  return min
end

###
# MAIN
###

# Code required to read in the values of k,n and candies.
n = gets.to_i
k = gets.to_i

# puts "N=#{n} K=#{k}"

candy = Array.new(n)

for i in 0..n-1
  candy[i] = gets.to_i
end

puts min_unfairness candy, n, k