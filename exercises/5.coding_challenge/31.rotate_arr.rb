=begin
Given an array, rotate the array to the right by k steps, where k is non-negative.

Follow up:
Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
Could you do it in-place with O(1) extra space?
 
Example 1:

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
Example 2:

Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
 
Constraints:

1 <= nums.length <= 2 * 10^4
It's guaranteed that nums[i] fits in a 32 bit-signed integer.
k >= 0
=end
require '../../spec_helper'

# place elements  in their correct place using a separate array
def rotate(nums, k)
  result = []
  len = nums.length
  for i in (len-k)...len
    result <<  nums[i]
  end
  
  for i in (0...len-k)
    result << nums[i]
  end
  
  result.each_with_index do |n, j|
    nums[j] = result[j]
  end
end

# have a different array and place elements in i + k % len position
# Time complexity: O(n) + O(n) ~ O(n) One pass to move, another to copy
# Space complexity: O(n)
def rotate_imp(nums, k)
  result = []
  for i in 0...nums.length
    result[(i+k)%nums.length] = nums[i]
  end
  result.each_with_index do |n, j|
    nums[j] = n
  end
end

nums = [1,2,3,4,5,6,7]
nums1 = [-1,-100,3,99]
k = 3
k1 = 2
# assert_equal([5,6,7,1,2,3,4], rotate(nums, k))
# assert_equal([3, 99, -1, -100], rotate(nums1, k1))

rotate_imp(nums, k)
puts nums
