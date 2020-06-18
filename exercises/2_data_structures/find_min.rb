=begin
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
Find the minimum element.
You may assume no duplicate exists in the array.

Example 1:
Input: [3,4,5,1,2] 
Output: 1

Example 2:
Input: [4,5,6,7,0,1,2]
Output: 0
=end
require '../../spec_helper'

# Running time: O(n)
# Space complexity: O(1)
def find_min_brute(nums)
  smallest = nums[0]
  nums.each do |n|
    (smallest = n) if n < smallest  
  end
  return smallest
end

# Since the array is sorted, we can use binary search to find the element we're looking for but the condition for the 
# search will change.
# Since the array is sorted and rotation doesn't mess up the order, we need to find the point where the order changes
# That point(point of inflection), is where 
# * all elements to the left will be bigger than the first element
# * all elements to the right of the inflection point will be smaller than the first element
# Applying binary search to this list, if the mid is greater than the first element the inflection point it to the right
# and the reverse for the other
# we have found the inflection point once (mid + 1) < mid (mid + 1 smallest) or (mid - 1) > mid (mid smallest)

# Running time: O(logn)
# Space complexity: O(1)
def find_min_binary_search(nums)
  # return if there is only one element
  return nums.first if nums.length == 1
  
  l, h  = 0, nums.length - 1
  while(l < h)
    mid = l + (h-l)/2
    if nums[mid] < nums[h]
      h = mid
      # return nums[mid] if nums[mid-1] > nums[mid]
    else
      l = mid+1
      # return nums[mid] if nums[mid-1] > nums[mid]
    end
  end
  return nums[l]
end


nums = [3,4,5,1,2]
nums1 = [4,5,6,7,0,1,2]
nums2 = [2, 1]
nums3 = [1, 2]

assert_equal(1, find_min_brute(nums))
assert_equal(0, find_min_brute(nums1))
assert_equal(1, find_min_brute(nums2))
assert_equal(1, find_min_brute(nums3))

assert_equal(1, find_min_binary_search(nums))
assert_equal(0, find_min_binary_search(nums1))
assert_equal(1, find_min_binary_search(nums2))
assert_equal(1, find_min_binary_search(nums3))

