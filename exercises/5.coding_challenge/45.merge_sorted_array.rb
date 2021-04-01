=begin
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

The number of elements initialized in nums1 and nums2 are m and n respectively. 
You may assume that nums1 has a size equal to m + n such that it has enough space to 
hold additional elements from nums2.

 
Example 1:

Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Example 2:

Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
=end

# Add num2 to the end of num1 and then sort nums1

# Time complexity. Sorting an array of size m  with a build in algo take O(mlogm). Since our array is of size m+n it takes O(m+nlog(m+n))
# Space complexity: O(n) but it can vary.
# Most programming languages have a built-in sorting algorithm that uses O(n) space
require '../../spec_helper'

def merge(nums1, m, nums2, n)
  for i in (0...n)
    nums1[m+i] = nums2[i]
  end
  nums1.sort!
end


# We maintain three pointers two to read and one to write. We copy over nums1 to an auxiliary array and then
# write the sorted array into num1
# Running time: O(m+n). We are doing 2m + n reads and writes.
# Space complexity: O(m)
def merge_three_pointers(nums1, m, nums2, n)
  nums1_copy = []
  nums1.each { |n| nums1_copy.push(n) }
  
  p, p1, p2 = 0, 0, 0
  for p in (0...(m+n))
    if (nums1_copy[p1] < nums2[p2] && p1 < m) || p2 >= n
      nums1[p] = nums1_copy[p1]
      p1 += 1
    elsif 
      nums1[p] = nums2[p2]
      p2 += 1
    end
  end
end


# Instead of using an extra array to sort the arrays we could instead sort the arrays in place 
# by using pointers that point to the last element of both arrays and then working backwards.
# Time complexity O(m+n)
# Space complexity O(1)
def merge_three_pointers_inplace(nums1, m, nums2, n)
  p1 = m - 1
  p2 = n - 1
  for p in (m+n-1).downto(0)
    if (nums1[p1] > nums2[p2] && p1 >=0 ) || p2 < 0
      nums1[p] = nums1[p1]
      p1 -= 1
    else
      nums1[p] = nums2[p2]
      p2 -= 1
    end
  end 
end

nums1 = [1,2,3,0,0,0]
m = 3
nums2 = [2,5,6]
n = 3

# nums1 = [1, 0]
# nums2 = [2]
# m, n = 1, 1

# merge(nums1, m, nums2, n)
# merge_three_pointers(nums1, m, nums2, n)
 # merge_three_pointers_inplace(nums1, m, nums2, n)
assert_equal(nums1, [1,2,2,3,5,6])
