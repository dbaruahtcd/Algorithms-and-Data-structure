=begin
Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, 
return the index where it would be if it were inserted in order.
Example 1:

Input: nums = [1,3,5,6], target = 5
Output: 2
Example 2:

Input: nums = [1,3,5,6], target = 2
Output: 1
Example 3:

Input: nums = [1,3,5,6], target = 7
Output: 4
Example 4:

Input: nums = [1,3,5,6], target = 0
Output: 0
Example 5:

Input: nums = [1], target = 0
Output: 0
=end
require '../../spec_helper'
def search_insert(nums, target)
  for i in (0...nums.length) do
    return i if nums[i] == target
    if nums[i] < target && (i+1) < nums.length && nums[i+1] > target
      return i + 1
    end
    if nums[i] > target
      return i
    end
  end
  nums.length
end

nums = [1, 3, 5, 6]
target = 5

nums2 = [1,3,5,6]
target2 = 2

nums3 = [1,3,5,6]
target3 = 7

nums4 = [1,3,5,6]
target4 = 0

nums5 = [1]
target5 = 0

assert_equal(search_insert(nums, target), 2)
assert_equal(search_insert(nums2, target2), 1)
assert_equal(search_insert(nums3, target3), 4)
assert_equal(search_insert(nums4, target4), 0)
assert_equal(search_insert(nums5, target5), 0)