#!/usr/bin/ruby

# Extends Array
class Array
  def bsearch(value, lower=0, upper=nil)
    upper = upper || self.size - 1
    return nil if lower > upper
    mid = (upper+lower)/2

    case self[mid]<=>value
      when -1 ; return bsearch(value, mid+1, upper)
      when 0  ; return mid
      when 1  ; return bsearch(value, lower, mid-1)
    end
  end
end

## MAIN
# Read value to be searched
$value = $stdin.gets.chomp.to_i

# Array size
$size = $stdin.gets.chomp.to_i

# Read the sorted Array
$array = $stdin.gets.split.map{|x| x.to_i}

# # Find the value
puts $array.bsearch($value)