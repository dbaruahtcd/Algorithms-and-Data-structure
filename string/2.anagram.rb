=begin
  Given two string, decide if one is a permuation of the other
=end
require './spec_helper'

#Assumptions: Should the comparision be case sensitive and if spaces should be counted as
#unique. Assuming case sensitive and spaces are unique
def are_anagrams?(str1, str2)
  # if different length, then can't possibly match
  return false if str1.length != str2.length

  str1_arr = str1.split('').sort
  str2_arr = str2.split('').sort
  0.upto(str1_arr.length-1) do |i|
    return false if str1_arr[i] != str2_arr[i]
  end
  true
end

# assuming the characters belong to ascii character set.
# count the number of times a character appears in a string and then compare both
def are_anagrams_v2?(str1, str2)
  return false if str1.length != str2.length
  str1_char_count = Array.new(256, 0)
  str2_char_count = Array.new(256, 0)
  str1.each_byte do |c|
    str1_char_count[c] += 1
  end

  str2.each_byte do |c|
    str2_char_count[c] += 1
  end

  0.upto(str1_char_count.length-1) do |i|
    return false if str1_char_count[i] != str2_char_count[i]
  end
  true
end

assert(are_anagrams?('abc', 'abc'))
assert(!are_anagrams?('sdaf', 'sad'))
assert(are_anagrams?('god particle', 'dog particle'))

assert(are_anagrams_v2?('abc', 'abc'))
assert(!are_anagrams_v2?('sdaf', 'sad'))
assert(are_anagrams_v2?('god particle', 'dog particle'))
