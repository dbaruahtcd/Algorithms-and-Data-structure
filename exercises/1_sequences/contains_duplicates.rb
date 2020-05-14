# Given an array of integers find if the array contains any duplicates
require_relative '../../spec_helper'

# brute force implementation
# Running time: O(n^2)
# Space complexityO(1)
def contains_duplicates_brute?(num)
  for i in (0...num.length-1)
    for j in (i+1...num.length)
      return true if num[i] == num[j]
    end
  end
  false
end

# find duplicates by sweeping through the array after sorting it
# Time complexity O(nlogn)(sorting) + O(n)(sweeping)
# Space complexity O(1)
def contains_duplicates_intermediate?(num)
  num.sort!
  for i in (0...num.length-1)
    return true if num[i] == num[i+1]
  end
  false
end

# binary search tree performs search and inserts in O(logn)
# Hash table does the same in O(1). So will be going with hash table
def contains_duplicates?(num)
  num_hash = {}
  num.each do |n|
    return true if num_hash.has_key?(n)
    num_hash[n] = true
  end
  false
end

num = [2, 3]
assert(!contains_duplicates_brute?(num))
assert(!contains_duplicates_intermediate?(num))
assert(!contains_duplicates?(num))

num1 = [1, 2, 3, 4, 1]
assert(contains_duplicates_brute?(num1))
assert(contains_duplicates_intermediate?(num1))
assert(contains_duplicates?(num1))