=begin
Given a 32-bit signed integer, reverse digits of an integer.

Example 1:

Input: 123
Output: 321
Example 2:

Input: -123
Output: -321
Example 3:

Input: 120
Output: 21
Note:
Assume we are dealing with an environment which could only store integers within the 
32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume 
that your function returns 0 when the reversed integer overflows.
=end
require_relative '../../spec_helper'

# Time complexity: O(logn) There are logn digits in x
# Space complexity: O(1)
def reverse(x)
  negative = false
  negative = true if x < 0 
  result = 0
  divisor = 10
  x = x.abs
  while(x > 0)
    result = (result * 10) + x % divisor
    x = x / divisor 
  end
  result = result * -1 if negative
  return 0 if (result > 2147483648 || result < -2147483647)
  result
end

x = 123
x1 = -123
x2 = 120
x3 = 1534236469
x4 = -2147483412
assert_equal(reverse(x), 321)
assert_equal(reverse(x1), -321)
assert_equal(reverse(x2), 21)
assert_equal(reverse(x3), 0)
assert_equal(reverse(x4), -2143847412)
