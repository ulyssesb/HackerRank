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
    end
    output[i+1] = n
    return output
  end

  def insertSort
    out = self
    for i in 0..self.size-2 do
      out = out[0..i].sortedInsert(self[i+1])
      puts out.lineInspect
    end
  end
end


## MAIN
# Array size
$size = $stdin.gets.chomp.to_i

# Read the sorted Array
$array = $stdin.gets.split.map{|x| x.to_i}

# Sorted insert all elements in array 
$array.insertSort