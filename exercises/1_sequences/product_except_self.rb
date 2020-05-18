=begin
Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
Example:
Input:  [1,2,3,4]
Output: [24,12,8,6]
Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
Note: Please solve it without division and in O(n).
Follow up:
Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
=end
require '../../spec_helper'
# brute force solution would be to find the product and then divide it by the element to get the value at an index.

# product at an index i is the product of all the number to the left * numbers to the right of i.
# We could solve it using two arrays, but that would take an O(n) space. We would like to do it in O(1)(the output array doesn't count here in the space complexity)
# We initialize the element at index 0 for the left array to 1, as there are no elements to the right of it.
def product_except_self_two_arry(nums)
  len = nums.length
  left = Array.new(len)
  right = Array.new(len)
  result = Array.new(len)
  
  left[0] = 1
  right[len-1] = 1
  for i in 1...len
    left[i] = left[i-1] * nums[i-1]
  end
  
  right[len-1] = 1
  (len-2).downto(0) do |i|
    right[i] = right[i+1] * nums[i+1]
  end
  
  for i in (0...len)
    result[i] = left[i] * right[i]
  end
  result
end

nums = [1, 2, 3, 4]
assert_equal([24, 12, 8, 6],product_except_self_two_arry(nums))
