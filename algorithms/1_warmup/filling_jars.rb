#!/usr/bin/ruby

###
# SOLUTION
###
# We should store in every test case read the total number of candies stored in
# total, which will be the distance between A and B (inclusive). 
# After all operations the output is what we had collect divided by M

###
# HELPERS & CONSTANTS
###

###
# MAIN
###

# Read the number of Candy Jars (N) and Operations (M)
n,m = $stdin.gets.chomp.split.map{|i| i.to_i}

# Total of candies
total = 0

# Store how much candy is stored in each jar
m.times do
  a, b, k = $stdin.gets.chomp.split.map{|i| i.to_i}

  # Sum how much candy is stored in this operation
  # We should multiply the number of candies in each jar by the number of Jars
  # in this operation. The '+1' is needed becouse A and B should be considered
  total   += (b - a + 1) * k
end

# Avarege will be the total of candies dived by the number of Jars
puts total / n