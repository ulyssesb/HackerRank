#!/usr/bin/ruby

# Sorted Insert
class Array
  def lineInspect
    self.inspect.gsub(/[\[\]\,]/,'')
  end

  def sortedInsert(n)
    output = self
    i = self.size - 1

    while self[i] > n and i>=0 do 
      output[i+1] = self[i]
      i+=-1
      puts output.lineInspect
    end
    output[i+1] = n
    puts output.lineInspect
  end
end


## MAIN
# Array size
$size = $stdin.gets.chomp.to_i

# Read the sorted Array
$array = $stdin.gets.split.map{|x| x.to_i}

# Insert the last element in his correct place
$array[0..$array.size-2].sortedInsert($array[$array.size-1])