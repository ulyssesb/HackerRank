#!/usr/bin/ruby

###
# Solution
###
# Starting listing the results of a function f(n) that should return the size at 
# _n_ cycles of growth.
# 	f(0) = 1
# 	f(1) = 2
# 	f(2) = 3
# 	f(3) = 6
# 	f(4) = 7
# 	f(5) = 14
# 	f(6) = 15
#
# This also can be writing using powers of 2
# 	f(0) = 2^0
# 	f(1) = 2^1
# 	f(2) = 2^1 + 2^0
# 	f(3) = 2^2 + 2^1 
# 	f(4) = 2^2 + 2^1 + 2^0
# 	f(5) = 2^3 + 2^2 + 2^1
# 	f(6) = 2^3 + 2^2 + 2^1 + 2^0
#
# So, the f(n) function can be divided into 2 parts: a) Finding the value for the first growth of the year (n is a odd number) ; b) Incrementing the growth by 1 in the second cicle of the year (n is a even number)
#
# For _b_, we can use module to find out if _n_ is a even or odd number
# And for _a_, it will be always the sum of 2^i, 1 <= i <= m, where m = n/2 if n is even or m = (n + 1)/2, if _n_ is odd, which can be also writing using the module of 2: m = ( n + n mod 2) / 2
# The overall formula for f(n) will be:
# 	f(n) = SUM(2^i, 1<=i<=m) + 1(1 - n mod 2),
# 		where m = ( n + n mod 2) / 2
#
# Because of summation in the formula, there will be a loop in the code that will run n/2 times, which is not so bad, but it could be better.
#
# Let's rewrite the formula replacing the summation by g(m):
# 	f(x) = g(m) + 1(1 - n mod 2), where m = ( n + n mod 2) / 2
#
# g(m) should return:
# 	g(0) = 0 
# 	g(1) = 2^1 					 = 2  = 2^2 - 2 
# 	g(2) = 2^1 + 2^2 			 = 6  = 2^3 - 2
# 	g(3) = 2^1 + 2^2 + 2^3 		 = 14 = 2^4 - 2
# 	g(4) = 2^1 + 2^2 + 2^3 + 2^4 = 30 = 2^5 - 2	
# It's easy to see that g(m) can also be writing as 2^(n+1) - 2. The proof for this is not so hard to find, but it's to much for the first problem.
#
# The final formula will be a O(1) function:
# => f(n) = (2^(m+1) - 2) + 1(1 - n mod 2), where m = ( n + n mod 2) / 2


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