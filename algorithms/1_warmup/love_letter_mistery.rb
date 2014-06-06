#!/usr/bin/ruby

###
# SOLUTION
###
# We have to compare the difference between the hex representation of the first 
# byte with the last, and 2nd with the String Size - 2 end so forth. 
# Result is the sum of all distances

###
# HELPERS & CONSTANTS
###
def operations_to_palindrome(input)
  n_operations = 0
  
  # i = index for walk from the begin to the middle
  # j = index for walk from the end to the middle
  for i in 0..(input.size / 2 - 1) do
    j = input.size - 1 - i
    n_operations += (input[i].unpack('U')[0] - input[j].unpack('U')[0]).abs
  end
  return n_operations
end

###
# MAIN
###

# Read the numbers test cases
$t_cases = $stdin.gets.chomp

# Read all test cases
$stdin.readlines.collect.map do |not_palindromic_string|
  puts operations_to_palindrome(not_palindromic_string.chomp)
end