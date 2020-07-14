=begin
Given a column title as appear in an Excel sheet, return its corresponding column number.
For example:

    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...
Example 1:

Input: "A"
Output: 1
Example 2:

Input: "AB"
Output: 28
Example 3:

Input: "ZY"
Output: 701
 

Constraints:

1 <= s.length <= 7
s consists only of uppercase English letters.
s is between "A" and "FXSHRXW".
=end
require_relative '../../spec_helper'
ALPHABETS = {
  'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6,
  'G' => 7, 'H' => 8, 'I' => 9, 'J' => 10, 'K' => 11, 'L' => 12,
  'M' => 13, 'N' => 14, 'O' => 15, 'P' => 16, 'Q' => 17, 'R' => 18,
  'S' => 19, 'T' => 20, 'U' => 21, 'V' => 22, 'W' => 23, 'X' => 24,
  'Y' => 25, 'Z' => 26
}

def create_alphabet_hsh
  hsh = {}
  for i in (0..25) do
    char = i + 'A'.ord # or 65
    hsh[char.chr] = i + 1
  end
  puts hsh
end

# running time: O(n)
# space complexity: O(1) No extra space used
def title_to_number(s)
  return if s.length < 1 || s.length > 7
  if s.length == 1
    return ALPHABETS[s]
  else
    result = 0
    i = 0
    len = s.length
    while i < s.length - 1
      result += (26**(len-1) * ALPHABETS[s[i]])
      # puts "result: #{result}"
      len -= 1 
      i += 1
    end
    result += ALPHABETS[s[s.length-1]] 
  end
  result 
end

def title_to_number_improved(s)
  result = 0
  for i in (0...s.length)
    result = 26 * result
    result += s[i].ord - 'A'.ord + 1
  end
  result
end

s = 'AA' #27
s1 = 'ZY' # 701
s2 = 'AAA' # 703
s3 = 'ABA' #729

assert_equal(title_to_number(s), 27)
assert_equal(title_to_number(s1), 701)
assert_equal(title_to_number(s2), 703)
assert_equal(title_to_number(s3), 729)

assert_equal(title_to_number_improved(s), 27)
assert_equal(title_to_number_improved(s1), 701)
assert_equal(title_to_number_improved(s2), 703)
assert_equal(title_to_number_improved(s3), 729)