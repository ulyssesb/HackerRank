#!/usr/bin/ruby

###
# SOLUTION
###
# The number of uniques paths, that leads to an unique last stone number, is 
# equal to N, the number of steps. 
# Varying the number of occurrencies of a from N-1 down to 0 and b from 0 to N
# we'll all possibles values for the last stone.
# Example: N=3, a=1, b=2, 
# => i*a + j*b 
# 	2*1 + 0*2 = 2
# 	1*1 + 1*2 = 3
# 	0*1 + 2*2 = 4

###
# HELPERS & CONSTANTS
###

def possibles_last_stone_values(n, a, b)
	last_stones_values = []

	# i = Number of occurrencies of a in path (0..N-1)
	# j = Number of occurrencies of b in path (N-1..0)
	for j in 0..n-1
		i = (n-1) - j
		last_stones_values << i*a + j*b
	end
	return last_stones_values
end

###
# MAIN
###

# Read the numbers test cases
$t_cases = $stdin.gets.chomp.to_i

# Process all test cases
$t_cases.times do 
	# Read number of steps, a and b
	steps = $stdin.gets.chomp.to_i
	a = $stdin.gets.chomp.to_i
	b = $stdin.gets.chomp.to_i

	# Find all possible values of the last stone
	puts possibles_last_stone_values(steps, a, b).sort.join(" ")
end