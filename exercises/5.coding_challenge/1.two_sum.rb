=begin
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
=end

# running time O(n^2)
# space complexity O(1)
def two_sum(nums, target)
  for i in (0...nums.length)
    for j in (1...nums.length)
      return[i, j] if nums[i] + nums[j] == target
    end
  end
  [0, 0]
end


# running time O(n) + O(1) ~ O(n)
# space complexity O(1)
def two_sum_improved(nums, target)
  hsh = Hash.new
  i = 0
  nums.each do |n|
    hsh[n] = i
    i += 1
  end

  nums.each_with_index do |val, ind|
    second = target - val
    return [ind, nums.index(second)] if hsh.include?(second) && nums.index(second) != ind
  end
  [0, 0]
end

nums = [5,  5, 11, 15]
target = 10

puts two_sum(nums, target)
puts two_sum_improved(nums, target)