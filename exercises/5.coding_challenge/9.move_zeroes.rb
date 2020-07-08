=begin
Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of
 the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.
=end

# Running time O(n^2): One way to bring the running time down would be to use an extra array to store the non zero 
#         elements and then append the appropriate number of zeros.
# Space complexity: O(1) : increases to O(n) for extra space.
def move_zeroes(nums)
  zero_cnt = 0
  nums.each_with_index do |n, i|
    if n == 0
      zero_cnt += 1
    end
  end
  
  for i in 0...nums.length do
    if nums[i] == 0
      for j in i...nums.length do
        nums[j] = nums[j+1]
      end
    end
  end
  
  len = nums.length - zero_cnt
  if zero_cnt != 0
    (1..zero_cnt).each do |i|
      nums[len] = 0
      len += 1 
    end
  end
  nums
end

# Time complexity: O(n) However, the total number of operations are sub-optimal
# Space complexity: O(n)
def move_zeroes_extra_space(nums)
  ans = []
  zero_cnt = 0
  nums.each_with_index do |n, i|
    if n == 0
      zero_cnt += 1
    end
  end
  
  nums.each do |n|
    ans << n if n != 0
  end
  
  zero_cnt.times { ans << 0 }
  
  for i in 0...nums.length
    nums[i] = ans[i]
  end
  nums
end


# Bring all the non 0 elements to the front of array keeping their relative order same.
# Time complexity: O(n), However, the total number of operations are still sub-optimal. 
  # The total operations (array writes) that code does is n (Total number of elements).
# Space complexity: O(1)
def move_zeroes_space_optimal(nums)
  lastFoundNonZero = 0
  for i in (0...nums.length)
    if nums[i] != 0
      nums[lastFoundNonZero] = nums[i]
      lastFoundNonZero += 1
    end
  end
  
  for i in (lastFoundNonZero...nums.size)
    nums[i] = 0
  end
  nums
end

nums = [0,1,0,3,12]
puts move_zeroes(nums)
puts move_zeroes_extra_space(nums)
puts move_zeroes_space_optimal(nums)