=begin
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? 
Find all unique triplets in the array which gives the sum of zero.

Notice that the solution set must not contain duplicate triplets.

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Example 2:

Input: nums = []
Output: []
Example 3:

Input: nums = [0]
Output: []

=end

# Brute force implementation: Running time: O(n^3)

def three_sum(arr)
  len = arr.length
  result = []
  for i in (0...len)
    for j in (i+1...len)
      for k in (i+2...len)
        if arr[i] + arr[j] + arr[k] == 0
          valid = true
          curr = [arr[i], arr[j], arr[k]]
          result.each do |r|
            if (r.sort - curr.sort).empty?
              valid = false
            end
          end
          result << curr if valid == true
        end
      end
    end
  end
  result
end


class Solution 
  def three_sum
  end
end

arr = [-1,0,1,2,-1,-4]

print three_sum(arr)