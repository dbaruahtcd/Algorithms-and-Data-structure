=begin
Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Note:

Each element in the result should appear as many times as it shows in both arrays.
The result can be in any order.
Follow up:

What if the given array is already sorted? How would you optimize your algorithm?
What if nums1's size is small compared to nums2's size? Which algorithm is better?
What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
=end

# Questions to ask : How to handle duplicates? What about the order of inputs and outputs?

def intersect_naive(nums1, nums2)
  intersect = []
  for i in 0...nums1.length
    curr = nums1[i]
    break if nums2.length == 0
    for j in 0...nums2.length
      if curr == nums2[j]  
        intersect << nums2[j] 
        nums2.delete_at(j)
      end
    end
  end
  intersect
end

# create a hash with the elements of the smaller array and use the bigger array to interate over the hash element
# Then decrement and add to the result the current key
# Time complexity: O((n + m)) + O(1) We iterate through the first, and then through the second array; insert and lookup operations in the hash map take a constant time.
# Space complexity: O(min(m + n)) We use hash map to store numbers (and their counts) from the smaller array.
def intersect_hsh(nums1, nums2)
  hsh = ((nums1.length > nums2.length) ? create_hsh(nums2) : create_hsh(nums1))
  (nums1.length > nums2.length) ? find_common(nums1, hsh) : find_common(nums2, hsh)
end

def create_hsh(nums)
  hsh = {}
  nums.each do |n| 
    hsh.include?(n) ? (hsh[n] += 1) : (hsh[n] = 1)
  end
  hsh
end

def find_common(nums, hsh)
  result = []
  nums.each do |n|
    if hsh.include?(n)
      result << n if hsh[n] > 0
      hsh[n] -= 1
    end
  end
  result
end

require 'byebug'
# We sort both the arrays and use pointers to keep track of current element. If similar add to the result and inc pointer
# TC: O(nlogn + mlogm) where nn and mm are the lengths of the arrays. We sort two arrays independently, and then do a linear scan.
# SC: O(1) We sort the arrays in-place. We ignore the space to store the output as it is not essential to the algorithm itself.
def intersect_sort(nums1, nums2)
  nums1.sort!
  nums2.sort!
  i, j = 0, 0
  result = []
  while(i < nums1.length && j < nums2.length)
    if (nums1[i] == nums2[j])
      result << nums1[i] 
      i += 1
      j += 1
    elsif nums1[i] < nums2[j]
      i += 1
    elsif nums2[j] < nums1[i]
      j += 1
    end
    
  end
  result
end

nums1 = [1,2,2,1]
nums2 = [2,2]


nums3 = [4,9,5] 
nums4 = [9,4,9,8,4]

nums11 = [1,2,2,1]
nums12 = [2,2]

nums21 = [4,9,5] 
nums22 = [9,4,9,8,4]

puts intersect_naive(nums1, nums2).inspect
puts intersect_naive(nums3, nums4).inspect

puts intersect_hsh(nums11, nums12).inspect
puts intersect_hsh(nums21, nums22).inspect

puts intersect_sort(nums11, nums12).inspect




=begin
Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
Note:

Each element in the result must be unique.
The result can be in any order.
=end


# convert for the arrays into set and then iterate over the larger with the elements from the smaller array
require 'set'
# Time complexity: O(n+m)(for converting from array to set) + O(1) for finding if the element is included
# Space complexity: O(m+n) where all the elements in the array are different
def uniq_intersection(nums1, nums2)
  nums1_set = Set.new
  nums2_set = Set.new
  nums1.each { |n| nums1_set.add(n) }
  nums2.each { |n| nums2_set.add(n) }
  
  (nums1_set.length > nums2_set.length) ? set_intersection_helper(nums2_set, nums1_set) : 
  set_intersection_helper(nums1_set, nums2_set)
end

def set_intersection_helper(set1, set2)
  result = []
  set1.each do |s|
    result << s if set2.include?(s)
  end
  result
end

nums1 = [1,2,2,1]
nums2 = [2, 2]

nums3 = [4,9,5] 
nums4 = [9,4,9,8,4]

puts uniq_intersection(nums1, nums2).inspect
puts uniq_intersection(nums3, nums4).inspect




=begin
What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

If nums1 fits into the memory, we can use Approach 1 to collect counts for nums1 into a hash map. Then, we can sequentially load and process nums2.

If neither of the arrays fit into the memory, we can apply some partial processing strategies:

Split the numeric range into subranges that fits into the memory. Modify Approach 1 to collect counts only within a given subrange, and call the method multiple times (for each subrange).

Use an external sort for both arrays. Modify Approach 2 to load and process arrays sequentially.
=end
