=begin
Given a sequence of integers, return the sum of all the integers that have an even index, multiplied by the integer at the last index.

Indices in sequence start from 0.

If the sequence is empty, you should return 0.
=end
require_relative '../../spec_helper'

def even_last(numbers)
  sum = 0
  numbers.each_with_index do |n, i|
    sum += n if i % 2 == 0
  end
  sum * numbers.last.to_i
end

puts even_last([2, 3, 4, 5]) # 30
puts even_last([]) # 0