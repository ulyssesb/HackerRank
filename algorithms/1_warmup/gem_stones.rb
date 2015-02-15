#!/usr/bin/ruby

###
# SOLUTION
###
# Each rock should be analise to find it's  'Base Elements', elements that 
# compose the rock structure without repetition, given that an alement can 
# appear multiple times in a rock. Ex: 'abcdde', has the base elements 'abcde'.
#
# After finding it's base elements, an intersection must be done with the 
# previous gem-elements to findout which elements are gem-elements.
#
# This can be done using two hashs: one for base-elements and another for 
# the gem-elements. 
# Reading a rock composition will create a new base-elements hash and it should
# be used to do an intersection with the gem-elements hash.
# The numbers of elements on gem-elements hash after processing all rocks will 
# be the output


###
# HELPERS & CONSTANTS
###

# Hash extension to implement an intersection between two hashes
class Hash
	def &(other)
		reject { |k,v| !(other.include? k) }
	end
end


# Find base elements in a rock's composition
def find_base_elements(rock_composition)
	# Create a new empty base elements
	base_elements = Hash.new

	# Iterate to process all elements (letters) and build a hash with only unique
	# elements
	rock_composition.each_char{|element| base_elements.store element.to_sym, ""}
	
	return base_elements
end

# Find all gem elements in a rock's composition
def find_gem_elements( gem_elements, rock_composition)
	# First, find all the base elements in rock's composition
	base_elements = find_base_elements(rock_composition)

	# Make an intersection between the smallest hash and the other
	gem_elements.length < base_elements.length ? 
		gem_elements & base_elements : base_elements & gem_elements
end

###
# MAIN
###

# Read the numbers of rocks (test cases)
$t_cases = $stdin.gets.chomp

# Start a new gem-elements with the first rock
gem_elements = find_base_elements( $stdin.gets.chomp )

# Process each rock's composition
$stdin.readlines.collect.map do | rock_composition |
	gem_elements = find_gem_elements(gem_elements, rock_composition.chomp)
end

# Output
puts gem_elements.length