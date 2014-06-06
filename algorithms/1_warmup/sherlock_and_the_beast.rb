#!/usr/bin/ruby

###
# SOLUTION
###
# The reminder of N by 3 has 3 possibles outcomes:
# 0 - We can write a decent number using only 5s
# 1 - Subtracting 10 digits it's going to make the number disvible by 3
# 2 - Subtracting 5 digitis will make the number divisible by 3

###
# HELPERS & CONSTANTS
###
def decent_number(digits)

  case digits % 3
  when 0
    # Number can be written using only 5
    return "5"*digits
  when 1 
    # There will be 2 blocks of '33333'
    number_of_3_blocks = 2
  when 2
    # There will be 1 block of '33333'
    number_of_3_blocks = 1
  end

  # Check if subtracting the digits used to write he 3 blocks the number will 
  # still be positive
  if digits - 5*number_of_3_blocks >= 0 then
    return "5"*((digits - 5*number_of_3_blocks)/3)*3 + "3"*number_of_3_blocks*5
  else
    return -1
  end
end

###
# MAIN
###

# Read the numbers test cases
$t_cases = $stdin.gets.chomp

$stdin.readlines.collect.map do |n|
 puts decent_number(n.chomp.to_i)
end