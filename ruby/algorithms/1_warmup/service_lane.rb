#!/usr/bin/ruby

###
# SOLUTION
###
# Using the WIDTH[] array to store the segments widths, doing a linear search through it to find what is the minimum segment size is not so good.
# The strategy here is to divide the segments by size in two arrays: SEGS_BIKE[], SEGS_CAR[], so that SEGS_BIKE[j] will hold the index i where WIDTH[i]=1 (Bike)
# Using a WIDTH=[2 3 1 2 3 2 3 3], the arrays should be: SEGS_BIKE[2], SEGS_CAR[0 3 5] 
# 
# Given a i & j segments through which Calvin enters and exits the service lane, first we'll search in SEGS_BIKE an element between i & j. If something is found, it means that only a bike will be capable of usign that lane. Otherwise, we'll check in SEGS_CAR. If nothing is found, than we're ok with trucks.
#
# To search in a array for a item a binary search should be used, which works in O(log n). Ruby provides the method bsearch but only for >= 2.0.0, so a little bit more of coding will be needed 

###
# HELPERS & CONSTANTS
###

# Constants
BIKE_WIDTH 	= 1
CAR_WIDTH 	= 2
TRUCK_WIDTH = 3


# Extends Array class for binary search for a range
class Array
	# Search for a k so that v_min <= k <= v_max
	# Will return the first found value between v_min and v_max
	def bsearch_range(v_min, v_max, lower=0, upper=nil)
		upper = upper || self.size - 1
		return if lower > upper
		mid 	= (lower + upper) / 2	

		if self[mid] < v_min
			return bsearch_range(v_min,v_max, mid + 1, upper)
		elsif self[mid] > v_max
			return bsearch_range(v_min,v_max,lower, mid - 1)
		else
			return mid
		end
	end
end
	

# Find the largest vehicle type that can pass through given an entry and an exit segments
def find_largest_segment_width( widths,
																segs_bike,
																segs_car,
																entry_seg,
																exit_seg )

	# Try to find a bike or a car segment between the given entry/exit
	if segs_bike.bsearch_range(entry_seg, exit_seg)
		return BIKE_WIDTH 
  elsif segs_car.bsearch_range(entry_seg, exit_seg)
  	return CAR_WIDTH
  else 
  	return TRUCK_WIDTH
  end
end


###
# MAIN
###

# Freeway Length (Number of segments) and number of test cases 
$freeway_length, $t_cases = $stdin.gets.split.map(&:to_i)

# Read the Width segment and build the SEGS_BIKE and SEGS_CAR arrays
widths    = Array.new
segs_car  = Array.new
segs_bike = Array.new

$stdin.gets.split.map(&:to_i).each do |seg_width|

	# Find the segment's type and collect it into the corresponding array
	case seg_width
		when BIKE_WIDTH	 then segs_bike << widths.size
		when CAR_WIDTH	 then segs_car << widths.size
	end

	# Store the width 
	widths << seg_width
end

# ##
# puts "Freeway Length: #{$freeway_length}"
# puts "Number of Cases: #{$t_cases}"
# puts "Widths: #{widths.inspect}"
# puts "BIKES: #{segs_bike.inspect}"
# puts "CARS: #{segs_car.inspect}"
# ##

# Read and process all the test cases
$stdin.readlines.collect.map do |test_segment|
	entry_seg, exit_seg = test_segment.chomp.split.map(&:to_i)
	# puts "Segment: #{entry_seg} - #{exit_seg}"

	# Find which is the largest segment width for the given entry/exit
	puts find_largest_segment_width(  
		widths, segs_bike, segs_car, entry_seg, exit_seg )
end