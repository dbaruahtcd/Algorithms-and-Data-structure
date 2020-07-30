=begin
Given a non-empty array of digits representing a non-negative integer, increment one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in 
the array contains a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:

Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Example 2:

Input: [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
=end
require '../../spec_helper'

# Time complexity: O(n) since it's not more than one pass along the input list.
# Space complexity: O(1)
def plus_one(digits)
  (digits.length - 1).downto(0) do |i|
    if digits[i] == 9
      digits[i] = 0
    else 
      digits[i] += 1
      return digits
    end
  end
  # If we're here all digits were 9, so we need to add a 1 to the front
  digits.unshift(1)
end

digits1 = [1,2,9]
digits2 = [9]
digits3 = [9, 9, 9]
assert_equal(plus_one(digits1), [1, 3, 0])
assert_equal(plus_one(digits2), [1, 0])
assert_equal(plus_one(digits3), [1, 0, 0, 0])
