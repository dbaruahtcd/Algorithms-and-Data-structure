=begin
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.

Example 1:

Input: 3
Output: "III"
Example 2:

Input: 4
Output: "IV"
Example 3:

Input: 9
Output: "IX"
Example 4:

Input: 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.
Example 5:

Input: 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
=end

MAPPING = {
  1 => 'I',
  4 => 'IV',
  5 => 'V',
  9 => 'IX',
  10 => 'X',
  40 => 'XL',
  50 => 'L',
  90 => 'XC',
  100 => 'C',
  400 => 'CD',
  500 => 'D',
  900 => 'CM',
  1000 => 'M'
}

# Time complexity: O(1) As there is a finite set of roman numerals, there is a hard upper limit on 
# how many times the loop can iterate. This upper limit is 15 times, and it occurs for the number 3888, 
# which has a representation of MMMDCCCLXXXVIII. Therefore, we say the time complexity is constant,
# Space complexity: O(1) The amount of memory used does not change with the size of the input integer, and is therefore constant.
def int_to_roman(num)
  keys = MAPPING.keys
  result = []
  while num != 0
    max = keys.select { |v| v <= num }.last
    num = num - max
    result << MAPPING[max]
  end
  result.join('')
end

num1 = 3
num2 = 4
num3 = 58
num4 = 1994

puts int_to_roman(num1)
puts int_to_roman(num2)
puts int_to_roman(num3)
puts int_to_roman(num4)