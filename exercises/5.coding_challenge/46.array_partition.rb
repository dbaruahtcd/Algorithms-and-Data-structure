=begin
Given an integer array nums of 2n integers, group these integers into n pairs (a1, b1), (a2, b2), ..., (an, bn) such that the sum
of min(ai, bi) for all i is maximized. Return the maximized sum.

Example 1:

Input: nums = [1,4,3,2]
Output: 4
Explanation: All possible pairings (ignoring the ordering of elements) are:
1. (1, 4), (2, 3) -> min(1, 4) + min(2, 3) = 1 + 2 = 3
2. (1, 3), (2, 4) -> min(1, 3) + min(2, 4) = 1 + 2 = 3
3. (1, 2), (3, 4) -> min(1, 2) + min(3, 4) = 1 + 3 = 4
So the maximum possible sum is 4.
Example 2:

Input: nums = [6,2,6,5,1,2]
Output: 9
Explanation: The optimal pairing is (2, 1), (2, 5), (6, 6). min(2, 1) + min(2, 5) + min(6, 6) = 1 + 2 + 6 = 9.
=end

# We sort the elements. So in order to maximize the sum we need the difference of the two numbers to be small.
# Time complexity: O(nlogn) Essentially the sorting time and then we iterate over the array once
# Space complexity: O(n) or O(logN)
require '../../spec_helper'
def array_pair_sum(nums)
  sum = 0
  nums.sort!
  (0...nums.length).step(2) do |n|
    sum += nums[n]
  end
  sum
end

nums = [1, 4, 3, 2]
nums1 = [6,2,6,5,1,2] #

assert_equal(array_pair_sum(nums), 4)
assert_equal(array_pair_sum(nums1), 9)