=begin
Given a string s, find the length of the longest substring without repeating characters.

Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
Example 4:

Input: s = ""
Output: 0
 

Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
=end
require 'set'
require './spec_helper'

# Brute force solution
# Time complexity: O(n^3)
# Space completixy: O(min(m,n))
#  We need O(k) space for checking a substring has no duplicate characters, where k is 
# the size of the Set. The size of the Set is upper bounded by the size of the string nn and the size of the charset/alphabet m.

def length_of_longest_substring(s)
  len = s.length
  ans = 0
  for i in (0...len) do
    for j in (i+1...len) do
      if isUnique?(s, i, j)
        ans = [ans, j-i].max
      end
    end
  end
  ans
end

def isUnique?(s, first, last)
  set = Set.new
  for i in (first...last) do
    return false if set.include?(s[i])
    set.add(s[i])
  end
  true
end

# Sliding window solution
# The problem with the brute force solution is the we iterate over characters even when we know there are not repeating characters.
# With sliding window we maintain two pointers i and j and then mantain a set of the characters within that range. We could also check for 
# duplicates but thats a O(n^2) algorithm. Instead we could maintain a hashset that can do it in O(1)
# Every step we increment j by 1 unless we find a duplicate. Once we encounter any duplicates, we increment i by 1.

def length_of_longest_substring_improved(s)
  ans = 0
  len = s.length
  i, j = 0, 0
  charSet = Set.new
  while(i < len && j < len)
    if !charSet.include?(s[j])
      charSet.add(s[j])
      j += 1
      ans = [ans, j-i].max
    else
      charSet.delete(s[i])
      i += 1
    end
  end
  ans
end

# The above solution requires O(2n) time in the worst case. That can be reduced by using a hash map 
# instead of a set. Then instead of moving by one char every iteration we could move by the index stored in position corresponding to the char
# That way instead of going through they same characters one by one, once we encounter a duplicate we would move past that character and move to the
# next character pointed to by the index
def length_of_longest_substring_sl_optimised(s)
  ans = 0
  i= 0
  char_hsh = {}
  
  for j in (0...s.length) do
    if char_hsh.include?(s[j])
      i = [i, char_hsh[s[j]]].max
    end
    ans = [ans, j-i+1].max
    char_hsh[s[j]] = j+1
  end
  ans
end

s = 'abcabcbb'
s2 = 'bbbbb'
assert_equal(length_of_longest_substring(s), 3)
assert_equal(length_of_longest_substring(s2), 1)

assert_equal(length_of_longest_substring_improved(s),3)
assert_equal(length_of_longest_substring_improved(s2), 1)

assert_equal(length_of_longest_substring_sl_optimised(s), 3)
assert_equal(length_of_longest_substring_sl_optimised(s2), 1)
