=begin
Given an array of integers numbers that is already sorted in ascending order, find two numbers such that they add up 
to a specific target number.

Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, 
where 1 <= answer[0] < answer[1] <= numbers.length.

You may assume that each input would have exactly one solution and you may not use the same element twice.

Example 1:

Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
Example 2:

Input: numbers = [2,3,4], target = 6
Output: [1,3]
Example 3:

Input: numbers = [-1,0], target = -1
Output: [1,2]
=end

# Time complexity O(n)
# Space complexity: O(n)
def two_sum(nums, target)
  hsh = Hash.new
  nums.each_with_index do |n, i|
    hsh[n] = i+1
  end
  
  nums.each_with_index do |val, ind|
    second = target - val
    if hsh.include?(second) && nums.index(second) != ind
      return [ind+1, nums.index(second)+1]
    end
  end
end

# Use two pointer starting at the front and end. If sum is greater reduce bigger. Used to make using the fact that the array is sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def two_sum_ptr(nums, target)
  low, high = 0, nums.length - 1
  while( low < high)
    if(nums[low] + nums[high] == target)
      return [low + 1, high + 1]
    elsif nums[low] + nums[high] < target
      low += 1
    else
      high -= 1
    end
  end
end

nums = [2, 3, 4]
target = 6

nums1 = [2,7,11,15]
target1 = 9

nums2 = [0,0,3,4]
target2 = 0

# print two_sum(nums, target)
# print two_sum(nums1, target1)
# print two_sum(nums2, target2)
print two_sum_ptr(nums, target)
print two_sum_ptr(nums1, target1)
print two_sum_ptr(nums2, target2)