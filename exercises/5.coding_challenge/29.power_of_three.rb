=begin
Given an integer, write a function to determine if it is a power of three.

Example 1:

Input: 27
Output: true
Example 2:

Input: 0
Output: false
Example 3:

Input: 9
Output: true
Example 4:

Input: 45
Output: false
Follow up:
Could you do it without using any loop / recursion?
=end
require '../../spec_helper'

# Space complexity: O(1)
# Time complexity: O(log3n)
def is_power_of_three(n)
  return false if n < 1
  while(n % 3 == 0)
    n = n/3
  end
  n == 1
end

assert(is_power_of_three(27))
assert(!is_power_of_three(18))
assert(!is_power_of_three(45))
assert(!is_power_of_three(0))
assert(is_power_of_three(1))
assert(!is_power_of_three(2))