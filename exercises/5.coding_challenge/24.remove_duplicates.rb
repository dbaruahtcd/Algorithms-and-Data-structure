=begin
Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

Example 1:

Given nums = [1,1,2],

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

It doesn't matter what you leave beyond the returned length.
Example 2:

Given nums = [0,0,1,1,1,2,2,3,3,4],

Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.

It doesn't matter what values are set beyond the returned length.
=end
require '../../spec_helper'
# We use two pointer - a fast and slow pointer. As long as we get to nums[i] == nums[j], we increment j.
# When we get nums[i] != nums[j], we copy j to i+1. Continue until we j reaches the end
# Time complexity: O(n) Assume that n is the length of array. Each of i and j traverses at most n steps.
# Space complexity: O(1)
def remove_duplicates(nums)
  return 0 if nums.empty?
  i, j = 0, 1
  while(j < nums.length)
    if(nums[i] != nums[j])
      i += 1
      nums[i] = nums[j]
    end
    j += 1
  end
  i + 1
end

nums = [1,1,2] # 2
nums2 = [0,0,1,1,1,2,2,3,3,4] # 5
assert_equal(2, remove_duplicates(nums))
assert_equal(5, remove_duplicates(nums2))