=begin
  Write a method to replace all spaces in a stiring with '%20'. You may assume that the string has sufficient
  space at the end of the string to hold the additional characters and that you are given the "true" length of the string.
=end
require './spec_helper'

def replace_spaces(str)
  str_arr = str.split('')

  blank_count = str_arr.select {|c| c == ' '}.count
  new_str_arr = Array.new(str_arr.length - 1 + blank_count * 3, '')
  len = new_str_arr.length - 1
  (str_arr.length-1).downto(0) do |i|
    if str_arr[i] == ' '
      new_str_arr[len] = '0'
      new_str_arr[len -1] = '2'
      new_str_arr[len -2] = '%'
      len = len - 3
    else
      new_str_arr[len] = str_arr[i]
      len = len - 1
    end
  end
  new_str_arr.join()
end

assert_equal('test%20str', replace_spaces('test str'))
assert_equal('%20new%20', replace_spaces(' new '))
assert_equal('%20destruct%20str', replace_spaces(' destruct str'))
assert_equal('%20destruct%20str%20', replace_spaces(' destruct str '))
