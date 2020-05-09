# Given an array of integers, return indices of the two numbers such that 
#  they add up to a specific target.  
require 'byebug'

def two_sum(arr, target)
  # arr.sort!
  for i in (0...arr.length)
    for j in (1...arr.length)
      if ((arr[i] > target) || (arr[j] > target))
        continue
      else
        return ["#{i}".to_i, "#{j}".to_i] if ((arr[i] + arr[j]) == target) 
      end
    end
  end
end

arr = [1, 3, 5, 6]
target = 4
puts two_sum(arr, target)