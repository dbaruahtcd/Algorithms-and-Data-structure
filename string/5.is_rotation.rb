=begin
  Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings,
  s1 and s2, write code to check if s2 is a roation of s1 using only one call to isSubstring.
  (eg. "waterbottle" is a rotation of "erbottlewat")
=end
require './spec_helper'

def is_rotation?(str1, str2)
  return false if ((str1.length != str2.length) || (str1.length == 0))
  # if we find the rotation point, we can slice the word into x and y and then rearrange
  # x and y to get s2. So
  # s1 = xy
  # s2 = yx
  # Hence regardless of wherever the division is, yx will always be equal to xyxy. That is s2 will
  # always be a substring of s1s1
  s1s1 = str1 + str1
  s1s1.include?(str2) ? true : false
end

# # assert(is_rotation?('abc', 'cab'))
# # assert(!is_rotation?('abc', 'cba'))
# # assert(!is_rotation?('abc', 'abcd'))
# # assert(!is_rotation?('', ''))
# puts is_rotation?('', '')
