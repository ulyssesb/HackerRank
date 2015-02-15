#!/usr/bin/ruby

###
# SOLUTION
###
# The number of pieces is the result of the number of horizontal cuts X vertical
# cuts. To maximize this output, given a K number of maximum cuts, the optimal 
# pieces will be k/2 horizontal cuts + k/2 vertical cuts

###
# HELPERS & CONSTANTS
###
def max_cuts(k)
	# H = K / 2
	# V = K - H
	# MAX = H * V	
	return k/2 * (k - k/2)
end

###
# MAIN
###

# Read the numbers test cases
$t_cases = $stdin.gets.chomp

# For each given K cuts, calculate the maximum number of pieces
$stdin.readlines.collect.map do |k|
	puts max_cuts(k.to_i)
end