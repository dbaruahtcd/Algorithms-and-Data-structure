=begin
Write a program to sort a stack in ascending order(with biggest items on top).
You may use additional stacks to hold items, but you may not copy the elements
into any other data structure(such as an array). The stacks supports the following
operations: push, pop, peek and isEmpty
=end
require_relative '../spec_helper'

class SortStack

  def initialize
    @buffer_stack = Array.new
    @sorted_stack = Array.new
  end

  def push(val)
    @buffer_stack.push(val)
  end

  def peek
    @sorted_stack.last
  end

  def pop
    @sorted_stack.pop
  end

  def sort_arr
    while(!@buffer_stack.empty?)
      tmp = @buffer_stack.pop
      while(!@sorted_stack.empty? && peek > tmp)
        @buffer_stack.push(@sorted_stack.pop)
      end
      @sorted_stack.push(tmp)
    end
    @sorted_stack
  end
end

sort_stack = SortStack.new
[8, 3, 5, 2, 9].each { |i| sort_stack.push(i) }

assert_equal([2, 3, 5, 8, 9], sort_stack.sort_arr)
assert_equal(9, sort_stack.pop)
