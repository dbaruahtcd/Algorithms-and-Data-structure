=begin
Write a function that reverses a string. The input string is given as an array of characters char[].
Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
You may assume all the characters consist of printable ascii characters.
=end
require '../../spec_helper'
# s: char[]
# return : void (modify s in place)

# Time complexity: O(n)
# Space complexity: O(1)
def reverse_string(s)
  raise ArgumentError if s.empty?
  i = 0
  j = s.length - 1
  while( i < j)
    temp = s[j]
    s[j] = s[i]
    s[i] = temp
    i += 1
    j -= 1
  end
end

# We have to solve in place which means solving it without using any auxilary data structure. 
# But we are free to use recursion that uses stacks.

# Running time: O(n)
# Space complexity: O(n)
def reverse_string_recursive(s)
  reverse_string_helper(s, 0, s.length - 1)
end

def reverse_string_helper(s, i, j)
  return if i < j
  temp = s[i]
  s[j] = s[i]
  s[i] = temp
  reverse_string_helper(s, i+=1, j-=1)
end

str1 = "Hello".split('')
str2 = "Even".split('')

# reverse_string(str1)
# reverse_string(str2)
# reverse_string_recursive(str1)
# reverse_string_recursive(str2)

# puts "Reversed string: #{str1}"
# puts "Reversed string: #{str2}"

assert(str1.reverse, reverse_string(str1))
assert(str2.reverse, reverse_string(str2))
assert(str1.reverse, reverse_string_recursive(str1))
assert(str2.reverse, reverse_string_recursive(str2))