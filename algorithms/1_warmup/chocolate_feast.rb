#!/usr/bin/ruby

###
# SOLUTION
###
# The total of chocolates that Little Bob can have is:
# => A. How much he can buy with money in his pocket	
# 			total 			 = $N / $C
# => B. While there's new wrappers we should change for chocolate, considering
# the unused wrappers of the last change

###
# MAIN
###
t = gets.to_i

t.times do
	(n, c, m) = gets.split.map{|i| i.to_i}

	total 	 = n / c
	wrappers = total
	unused   = 0 

  # puts "n=#{n} c=#{c} m=#{m}"
	# puts "total = #{total}"

	# while there's wrappers, we should chnage for more chocolate!
	while wrappers >= m 
		changed_wrappers =  wrappers / m 
		
    # puts ""
    # puts "wrappers         = #{wrappers}"
    # puts "unused           = #{unused}"
    # puts "changed_wrappers = #{changed_wrappers}"
		
		total    += changed_wrappers
    unused   = wrappers % m 
		wrappers = changed_wrappers + unused

		# puts "new wrappers     = #{wrappers}"
		# puts "new unused       = #{unused}"
	end

	puts total
end