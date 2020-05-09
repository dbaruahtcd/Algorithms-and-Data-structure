# Given an array of integers, return indices of the two numbers such that 
#  they add up to a specific target.  

require_relative '../../spec_helper'
# brute force method
# Time complexity O(n^2)
# Space complexity O(1)
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
  return [0, 0]
end

# If we fix one number, we only have to find the other one. 
# Running time O(n)
# Space complexity O(n) - hash storage
def two_sum_improved(nums, target)
  for i in (0...nums.length)
    first = nums[i]
    second = target - first
    if nums.include?(second) && (nums.index(second) != i)
      j = nums.index(second)
      return [i, j]
    end
  end
  return [0, 0]
end

# Further improvements can be made by putting everything into a hash with the index and doing
# so in only one iteration, instead of two
# Running time O(n)
# Space complexity O(n)
def two_sum_more_improved(nums, target)
  nums_hsh = Hash.new
  nums.each_with_index do |n, i|
    nums_hsh[n] = i
  end
  for i in (0...nums.length)
    first = nums[i]
    second = target - first
    if nums_hsh.include?(second) && nums.index(second) != i
      j = nums.index(second)
      return [i, j]
    end
    # nums_hsh[first] = i 
  end
  return [0, 0]
end

# Couple of gotcha
# The target - first number can be just the first number and that would return the first index twice, 
# which is incorrect. Hence check for the index 

# arr = [1, 3, 5, 6]
arr = [3, 2, 4]
target = 6
assert_equal([1, 2], two_sum(arr, target))
assert_equal([1, 2], two_sum_improved(arr, target))
assert_equal([1, 2], two_sum_more_improved(arr, target))