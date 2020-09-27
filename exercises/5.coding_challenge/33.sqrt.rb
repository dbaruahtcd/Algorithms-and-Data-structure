=begin
Implement int sqrt(int x).

Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

Example 1:

Input: 4
Output: 2
Example 2:

Input: 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since 
             the decimal part is truncated, 2 is returned.

=end
require '../../spec_helper'

# solution 1 (using formula) sqrt(x) = e^(1/2* log x)
# sqrt would fall between x^2 < y < (x+1)^2
# Time complexity: O(1)
# Space complexity: O(1)
def sqrt(x)
  return x if x < 2
  left = Math::E ** (0.5 * Math.log(x))
  right = left + 1
  (right * right) > x ? left.to_i : right.to_i
end

x = 3.14

# solution 2 newtons formula
# x(k+1) = 1/2[xk + x/xk] converges to sqrt(x) if x0 = x
# Time complexity: O(logN)
# Space complexity: O(1)
def sqrt_newton(x)
  return x if x < 2
  x0 = x
  x1 = (x0 + (x/x0))/2.0
  while((x1-x0).abs >= 1)
    x0 = x1
    x1 = (x0 + (x/x0))/2.0
  end
  x1.to_i
end

x1 = 3.14

assert_equal(1, sqrt(x))
assert_equal(1, sqrt_newton(x))

