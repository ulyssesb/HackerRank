#!/usr/bin/ruby

###
# SOLUTION
###

###
# HELPERS & CONSTANTS
###

###
# MAIN
###

# Read the numbers test cases
#$t_cases = $stdin.gets.chomp

# Write for tests all fibonacci numbers < 10**10
n_0 = 0
n_1 = 1
i   = 2
n   = 0 
digits = 1

while n < 10**11
  n   = n_0 + n_1
  
  if digits != n.to_s.size then
    puts "i=#{i} n=#{n} ***"
  else
    puts "i=#{i} n=#{n}"
  end

  digits = n.to_s.size
  n_0 = n_1
  n_1 = n
  i   += 1
end 