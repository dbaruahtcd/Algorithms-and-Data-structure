=begin
Given an integer array nums, find the contiguous subarray (containing at least one number) which 
has the largest sum and return its sum.

Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Example 2:

Input: nums = [1]
Output: 1
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23

=end

# Time complexity: O(n^2)
# Space complexity: O(1)
def max_sub_array(nums)
  max_sum = -2**(0.size * 8 - 2) # Ruby uses an extra 1 bit to mark the value as an integer as opposed to a pointer.
  for i in (0...nums.length)
    sum_sub_array = 0
    for j in (i...nums.length)
      sum_sub_array += nums[j]
      max_sum = [max_sum, sum_sub_array].max
    end
  end
  max_sum
end

nums = [-2,1,-3,4,-1,2,1,-5,4]
nums2 = [1]

puts max_sub_array(nums)
puts max_sub_array(nums2)