=begin
Given two strings s and t , write a function to determine if t is an anagram of s.
Example 1:
Input: s = "anagram", t = "nagaram"
Output: true
=end

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
def anagram(s, t)
  
end

s = 'anagram'
t = 'nagarrm'
puts anagram_brute(s, t)