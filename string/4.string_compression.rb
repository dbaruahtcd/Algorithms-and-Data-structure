=begin
Implement a method to perform basic string compression using the counts of repeated characters. For example, the string
aabcccaa would become a2b1c3 If the "compressed string would not become smaller than the original string your method should return the original string"
=end

require './spec_helper'

def compressBad(str)
  return str if str.empty?
  str_len = str.length
  compressed_str = ''
  str_arr = str.split('')
  prev = str_arr[0]
  count = 1
  1.upto(str_len - 1) do |i|
    curr = str_arr[i]
    if curr == prev
      count += 1
    else
      compressed_str += "#{prev}#{count}"
      prev = curr
      count = 1
    end
  end
  compressed_str += "#{prev}#{count}"
  (str.length >= compressed_str.length) ? compressed_str : str
end

assert_equal('s2t2r4y3', compressBad('ssttrrrryyy'))
assert_equal('sty', compressBad('sty'))
assert_equal('st', compressBad('st'))
assert_equal('t4', compressBad('tttt'))
