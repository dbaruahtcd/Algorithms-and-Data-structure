=begin
Given two strings s and t , write a function to determine if t is an anagram of s.
Example 1:
Input: s = "anagram", t = "nagaram"
Output: true
=end
require '../../spec_helper'
# Sort the characters and if both match return true
# Running time O(nlogn) (sorting ) + 0(n) (compare)
# Space complexity O(1)
def anagram_brute(s, t)
  return false if s.length != t.length
  s_char = s.chars.sort
  t_char = t.chars.sort
  s_char.eql?(t_char) ? true : false
end

# Using array in the ASNI range and then index into it to increment the value.
# We can use two counters and then compare the values
# Or we could just use one counter and use one to increment and another to decrement it.
# Time complexity : O(n).Time complexity is O(n) because accessing the counter table is a constant time operation.
# Space complexity : O(1). Although we do use extra space, the space complexity is O(1) because the table's 
# size stays constant no matter how large n is.
def anagram(s, t)
  return if s.length != t.length
  arr = Array.new(255, 0)
  # t_arr = Array.new(255, 0)
  for i in (0...s.length)
    arr[s[i].ord] += 1
    arr[t[i].ord] -= 1 
  end
  arr.any? { |a| a != 0 } ? false : true 
end

s = 'anagram'
t = 'nagaram'
t1  = 'aannrrm'

assert(anagram_brute(s, t))
assert(!anagram_brute(s, t1))
assert(anagram(s, t))
assert(!anagram(s, t1))