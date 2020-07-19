=begin
Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

Example 1:

Input: [3,0,1]
Output: 2
Example 2:

Input: [9,6,4,2,3,5,7,0,1]
Output: 8
Note:
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
=end

# Time complexity: Run time dominated by sort so its O(nlogn)
# Space complexity: Depending on whether we sort in place or not its O(1) or O(n)
def missing_number(nums)
  nums.sort!
  # If the last and the first element are not in place
  if(nums.last != nums.length)
    return nums.length
  elsif nums[0] != 0
    return 0
  end
  
  i = 0
  # Rest of the elements are in place
  while(i < nums.length)
    return i if nums[i] != i
    i += 1
  end
  -1
end


# Time complexity: O(n)
# Space complexity: O(n)
def missing_number_hsh(nums)
  hsh = {}
  nums.each do |n|
    hsh[n] = 1
  end
  for i in (0..nums.length)
    return i if !hsh.include?(i)
  end
  -1
end

# Find the expected sum of all the numbers and then deduct it from the actual given by gausss n(n+1)/2
# TC: O(n)
# SC: o(1)
def missing_number_gauss_formula(nums)
  expected_sum = (nums.length * (nums.length + 1))/2
  actual_sum = nums.reduce(:+) # or nums.inject{ |sum, x| sum + x} / nums.inject(:+)
  return expected_sum - actual_sum
end

nums = [3,0,1]
nums2 = [9,6,4,2,3,5,7,0,1]
nums3 = [3, 2, 1]
nums4 = [0, 2, 1]

puts missing_number(nums)
puts missing_number(nums2)
puts missing_number(nums3)
puts missing_number(nums4)

puts missing_number_hsh(nums)
puts missing_number_hsh(nums2)
puts missing_number_hsh(nums3)
puts missing_number_hsh(nums4)

puts missing_number_gauss_formula(nums)
puts missing_number_gauss_formula(nums2)
puts missing_number_gauss_formula(nums3)
puts missing_number_gauss_formula(nums4)