=begin
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
Example 2:

Input: [4,1,2,1,2]
Output: 4
=end
require '../../spec_helper'

# running time : O(n) to create the hash and O(1) to insert and search
# Space complexity: O(n) to store n values
def single_number(nums)
  hsh = {}
  nums.each do |n|
    if hsh.include?(n)
      hsh[n] += 1
    else
      hsh[n] = 1
    end
  end
  return hsh.key(1)
end


# 2 *(a+b) - (a + a - b) = c
def single_number_maths(nums)
  sum_set, sum_num = 0, 0
  arr = []
  nums.each do |n|
    if !arr.include?(n)
      arr.push(n)
      sum_set += n
    end
    sum_num += n 
  end
  2 * sum_set - sum_num
end

arr1 = [2,2,1]
arr2 = [4,1,2,1,2]

# puts single_number(arr1)
# puts single_number_maths(arr1)
# puts single_number(arr2)
# puts single_number_maths(arr2)

assert_equal(1, single_number(arr1))
assert_equal(1, single_number_maths(arr1))
assert_equal(4, single_number(arr2))
assert_equal(4, single_number_maths(arr2))