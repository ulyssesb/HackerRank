#!/usr/bin/ruby

###
# SOLUTION
###
# Considering the limit N <= 10**10, this include only 55 Fibonacci, which is 
# fairly not much to generate in advance and work on it as a vector, searching
# with a binary algorithm. 

###
# HELPERS & CONSTANTS
###
N_MAX = 10**10

# Extends Array
class Array
  def bsearch(value, lower=0, upper=nil)
    upper = upper || self.size - 1
    return nil if lower > upper
    mid = (upper+lower)/2

    case self[mid]<=>value
      when -1 ; return bsearch(value, mid+1, upper)
      when 0  ; return mid
      when 1  ; return bsearch(value, lower, mid-1)
    end
  end
end


# Generate all fibonacci numbers <= N_MAX
def produce_fibonacci( limit=0 )
  n, n_1 = 1, 0 # n, n-1
  fibonacci = []

  while n <= limit do
    fibonacci << n 
    n_1, n = n, n+n_1
  end

  return fibonacci
end


###
# MAIN
###

# Read the numbers test cases
$t_cases = $stdin.gets.chomp.to_i

# Generate fibonacci numbers up to N_MAX
fibonacci = produce_fibonacci N_MAX

# Search for each test case 
$t_cases.times do
  n = gets.to_i

  if fibonacci.bsearch(n) then 
    puts "IsFibo"
  else 
    puts "IsNotFibo"
  end
end