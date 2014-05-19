#!/usr/bin/ruby

###
# Main 
###

# Function to find the tree size after n_cycles
def utopian_tree_size(n)

	# Using the formula above, the solution is quite simple
	# (n) = (2^(m+1) - 2) + 1(1 - n mod 2), where m = ( n + n mod 2) / 2

	# Find the max M 
	m = ( n + n % 2) / 2

	# Get the result 
	(2**(m+1) - 2 + 1*(1 - n % 2))
end

# Read the number of test cases
T_CASES = $stdin.gets.chomp()

# Read line by line and find the growth on the Nth cycle
$stdin.readlines.collect do |cycle| 
	# Find out the tree size
	# puts "N=#{cycle}, #{utopian_tree_size(cycle.chomp.to_i)}"
	puts utopian_tree_size(cycle.chomp.to_i)
end