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

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. 
Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to 
the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

Example 1:
Input: "III"
Output: 3

Example 2:
Input: "IV"
Output: 4

Example 3:
Input: "IX"
Output: 9

Example 4:
Input: "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
Example 5:

Input: "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
=end
require_relative '../../spec_helper'

# Question to ask: Can we assume the input is valid? : Yes
# Going from left to right
# running time : As there is a finite set of roman numerals, the maximum number possible number can be 3999, 
# which in roman numerals is MMMCMXCIX. As such the time complexity is O(1).
# If roman numerals had an arbitrary number of symbols, then the time complexity would be proportional 
# to the length of the input, i.e. O(n). This is assuming that looking up the value of each symbol is O(1)O(1).
# space complexity: O(1) or O(n) depending on weather the chars create a new array.
ROMAN_HSH = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}.freeze

ROMAN_HSH_DOUBLE = {
  'CM' => 900, 
  'CD' => 400,
  'XC' => 90,
  'XL' => 40,
  'IX' => 9,
  'IV' => 4
}

def roman_to_int_left_right(s)
  result = 0
  char_ary = s.chars

  for i in 0...(char_ary.length) do
    if ROMAN_HSH[char_ary[i]] < (ROMAN_HSH[char_ary[i+1]] || 0)
      result -= ROMAN_HSH[char_ary[i]]
    else
      result += ROMAN_HSH[char_ary[i]]
    end
  end
  result
end

def roman_to_int_right_left(s)
  s_char = s.chars
  last = s_char.last
  result = ROMAN_HSH[last]
  
  for i in (s_char.length-2).downto(0)
    if ROMAN_HSH[s_char[i]] < ROMAN_HSH[last]
      result -= ROMAN_HSH[s_char[i]]
    else
      result += ROMAN_HSH[s_char[i]]
    end
    last = s_char[i]
  end
  result
end

# instead of using mapping for just single roman digits, we can use mapping for double roman digits to reduce the number of required opereation.
def roman_to_int_jump_by_two(s)
  i = 0
  result = 0
  while(i < s.length)
    if ROMAN_HSH_DOUBLE.include?(s[i,i+2])
      result += ROMAN_HSH_DOUBLE[s[i,i+2]]
      i += 2
    else 
      if (i+1) < s.length &&  ROMAN_HSH[s[i]] < ROMAN_HSH[s[i+1]]
        result += ROMAN_HSH[s[i+1]] - ROMAN_HSH[s[i]]
        i += 2
      else 
        result += ROMAN_HSH[s[i]]
        i += 1
      end
    end
  end
  result
end


s = "III"
s1 = 'IV'
s2 = 'IX'
s3 = 'LVIII'
s4 = 'MCMXCIV'

assert_equal(roman_to_int_left_right(s), 3)
assert_equal(roman_to_int_left_right(s1), 4)
assert_equal(roman_to_int_left_right(s2), 9)
assert_equal(roman_to_int_left_right(s3), 58)
assert_equal(roman_to_int_left_right(s4), 1994)

assert_equal(roman_to_int_right_left(s), 3)
assert_equal(roman_to_int_right_left(s1), 4)
assert_equal(roman_to_int_right_left(s2), 9)
assert_equal(roman_to_int_right_left(s3), 58)
assert_equal(roman_to_int_right_left(s4), 1994)

assert_equal(roman_to_int_jump_by_two(s), 3)
assert_equal(roman_to_int_jump_by_two(s1), 4)
assert_equal(roman_to_int_jump_by_two(s2), 9)
assert_equal(roman_to_int_jump_by_two(s3), 58)
assert_equal(roman_to_int_jump_by_two(s4), 1994)