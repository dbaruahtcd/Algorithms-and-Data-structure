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

s = 'abcabcbb'
s2 = 'bbbbb'
assert_equal(length_of_longest_substring(s), 3)
assert_equal(length_of_longest_substring(s2), 1)
