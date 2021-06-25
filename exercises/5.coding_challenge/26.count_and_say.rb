=begin
The count-and-say sequence is the sequence of integers with the first five terms as following:

1.     1
2.     11
3.     21
4.     1211
5.     111221
1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.

Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. 
You can do so recursively, in other words from the previous member read off the digits, counting 
the number of digits in groups of the same digit.

Note: Each term of the sequence of integers will be represented as a string.

 

Example 1:

Input: 1
Output: "1"
Explanation: This is the base case.
Example 2:

Input: 4
Output: "1211"
Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can 
be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", 
so the answer is the concatenation of "12" and "11" which is "1211".
=end
def count_and_say(n)
  return '1' if n == 1
  return '11' if n == 2
  curr_str = '11'
  j = 3
  while j <= n
    str_arr = curr_str.split('')
    str_at_index = ''
    for i in 0...(str_arr.length-1) do
      cnt = 1
      x = str_arr[i]
      if x == str_arr[i+1] && ((i+1) == (str_arr.length-1))
        cnt += 1
        str_at_index += "#{cnt}#{x}"
      elsif x == str_arr[i+1]
        cnt += 1
      elsif x != str_arr[i+1]
        str_at_index += "#{cnt}#{x}"
        # x = str_arr[i+1]
        # cnt = 1
      end
    end
    curr_str = str_at_index
    j += 1
  end
  curr_str
end

require '../../spec_helper'
# Space and time complexity: O(2^n)

def count_and_say_imp(n)
  next_digit = '1'
  return next_digit if n == 1
  j = 2
  prev_digit = ''
  local_running = ''
  curr = ''
  cnt = 0
  while(j <= n)
    arr = next_digit.split('')
    arr.each_with_index do |d, i|
      if prev_digit.empty?
        prev_digit = d
        cnt += 1
        next
      end
      if prev_digit == d
        cnt += 1
      else
        local_running += "#{cnt}#{prev_digit}"
        prev_digit = d
        cnt = 1
      end
    end
    next_digit = "#{local_running}#{cnt}#{prev_digit}"
    local_running = ''
    cnt = 0
    prev_digit = ''
    j += 1
  end
  next_digit
end

assert_equal(count_and_say_imp(1), '1')
assert_equal(count_and_say_imp(2), '11')
assert_equal(count_and_say_imp(3), '21')
assert_equal(count_and_say_imp(4), '1211')
assert_equal(count_and_say_imp(5), '111221')
