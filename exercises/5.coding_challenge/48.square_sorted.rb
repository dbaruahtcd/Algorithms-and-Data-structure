=begin
Given an integer array nums sorted in non-decreasing order, return an array of the 
squares of each number sorted in non-decreasing order.

Example 1:

Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].
Example 2:

Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]

=end

# We could go for the naive solution where the running time would be O(nlogn) or space complexity O(log n) or O(n) depending on the implementation
# However we could do better if we make use of two pointers to keeps track of the which absolute value is greater. We can conclude that either the leftmost
# rightmost element value in the array would occupy the  righmost element in the final sorted array
# Running time O(nlogn)
# Space complexity: O(n)
def sorted_square(nums)
  result = []
  ptr = nums.length - 1
  l, r = 0, nums.length - 1
  while( l < r)
    if(nums[l].abs >= nums[r].abs)
      result[ptr] = nums[l]**2
      l += 1
    else
      result[ptr] = nums[r]**2
      r -= 1
    end
    ptr -= 1
  end
  result
end

nums = [-3, 1, 2]
nums1 = [-7,-3,2,3,11]
print sorted_square(nums)
print sorted_square(nums1)