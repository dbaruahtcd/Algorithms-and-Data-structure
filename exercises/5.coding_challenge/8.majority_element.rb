=begin
Given an array of size n, find the majority element. The majority element is the element 
that appears more than ⌊ n/2 ⌋ times.
You may assume that the array is non-empty and the majority element always exist in 
the array.

Example 1:

Input: [3,2,3]
Output: 3
Example 2:

Input: [2,2,1,1,1,2,2]
Output: 2
=end

# Time complexity: O(n^2)
# Space complexity: O(1)
def majority_element_iterative(nums)
  nums.each do |elem|
    count = 0
    nums.each do |cnt|
      count += 1 if elem == cnt
    end
    
    return elem if count > nums.length/2
  end
  -1
end

def majority_element_hsh(nums)
  hsh = {}
  nums.each do |n|
    hsh.include?(n) ? hsh[n] += 1 : hsh[n] = 1
  end
  hsh.each do |k, v|
    return k if v >= nums.length/2
  end
end


# we sort the array and return the mid element. 
# The reasoning behind that is, in a sorted array the mid element would 
# have to be the majority element. 
# Time complexity : O(nlogn) - natively ruby uses quick sort whose average case running time is O(nlogn)
# Space complexity: O(1) or O(n) - We sorted nums in place here - if that is not allowed, then we must 
# spend linear additional space on a copy of nums and sort the copy instead.
def majority_element_mid_element(nums)
  nums.sort![nums.length/2]
end

# Because more than n/2 array indices are occupied by the majority element, a random array 
# index is likely to contain the majority element. 
# Running time: might be infinity if the while loop runs indefinitely. because the majority element 
# is guaranteed to occupy more than half of the array, the expected number of iterations will be less 
# than it would be if the element we sought occupied exactly half of the array.
# Space complexity: O(1)
def majority_element_randon(nums)
  while(true)
    m_index = rand(0...nums.length)
    candidate = nums[m_index]
    return candidate if count_occurence(nums, candidate) > nums.length/2
  end
end

def count_occurence(nums, elem)
  cnt = 0
  nums.each do |n|
    cnt += 1 if n == elem
  end
  cnt
end

###############################
# Boyer-Moore Voting Algorithm
###############################
# Here the element at index 0 is considered the tentative majority element and every subsequent 
# element that we encounter either increases the counter if the element happens to be equal to our 
# current candidate key, else we decrement until we reach 0. The next element would be our new candidate 
# key. The reasoning behind this algorithm is that since there are more majority element than minority 
# element, we would eventually find an element for which the counter would be non zero

# Time complexity: O(n)
# space complexity: O(1)

def majority_element_boyer_moore(nums)
  cntr = 1
  candidate = nums[0]
  for i in (1...nums.length)
    if cntr != 0
      nums[i] == candidate ? (cntr += 1) : (cntr -= 1)
    else 
      candidate = nums[i]
      cntr = 1
    end
  end
  candidate
end


nums1 = [3,2,3]

nums2 = [2,2,1,1,1,2,2]
nums3 = [10,9,9,9,10]

puts majority_element_iterative(nums1)
puts majority_element_iterative(nums2)
puts majority_element_iterative(nums3)

puts majority_element_hsh(nums1)
puts majority_element_hsh(nums2)

puts majority_element_mid_element(nums1)
puts majority_element_mid_element(nums2)

puts majority_element_randon(nums1)
puts majority_element_randon(nums2)

puts majority_element_boyer_moore(nums1)
puts majority_element_boyer_moore(nums2)
puts majority_element_boyer_moore(nums3)

