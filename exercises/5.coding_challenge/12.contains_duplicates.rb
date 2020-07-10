=begin
Given an array of integers, find if the array contains any duplicates.

Your function should return true if any value appears at least twice in the array, 
and it should return false if every element is distinct.

Example 1:

Input: [1,2,3,1]
Output: true
Example 2:

Input: [1,2,3,4]
Output: false
Example 3:

Input: [1,1,1,3,3,4,3,2,4,2]
Output: true
=end
require '../../spec_helper'
# time complexity: O(n). The run time can be greater than the naive approach with O(nlogn) running time
# for small n. The Big-O notation only tells us that for sufficiently large input, one will be faster 
# than the other. Therefore, when n is not sufficiently large, an O(n) algorithm can be slower than an O(nlogn) algorithm.
# space complexity: O(n)
def contains_duplicates(nums)
  hsh = { }
  nums.each do |n|
    return true if hsh.has_key?(n)
    hsh[n] = 1
  end
  false
end

nums1 =  [1,2,3,1]
nums2 = [1,2,3,4]
nums3 = [1,1,1,3,3,4,3,2,4,2]

assert(contains_duplicates(nums1))
assert(!contains_duplicates(nums2))
assert(contains_duplicates(nums3))