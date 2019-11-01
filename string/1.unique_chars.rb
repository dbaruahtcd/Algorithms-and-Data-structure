=begin
  Implement an algorithm to determine if a sting has all unique characters.
=end
require './spec_helper'

def is_unique_chars(str)
  # assuming the provided string is an ASCII string.
  return false if str.empty?
  char_set = []
  str.each_byte do |c|
    ascii_val = c
    if(char_set[ascii_val])
      return false
    end
    char_set[ascii_val] = true
  end
  true
end

assert(is_unique_chars('str'))
assert(!is_unique_chars('abcbca'))
assert(!is_unique_chars('strstrstr'))
assert(!is_unique_chars(''))
