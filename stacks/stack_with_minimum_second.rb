=begin
Design a stack which in addition to push and pop, also has a function min which returns the
minimum element. Push, pop and min should all operate in O(1) time.
=end

require '../spec_helper'
require_relative 'stack_linked_list'

# If our stack is large, we waste a lot of space by keeping track of the min.
# So instead we can use an additional stack which keeps track of the min
class StackWithMinSecond < StackLinkedList
  def push(val)
    super(val)
    if(val < min)
      min_arr.push(val)
    end
  end

  def pop
    val = super
    if(val == min_arr.last)
      min_arr.last = nil
    end
    val
  end

  def min
    min_arr.empty? ? 999999 : min_arr.last
  end

  private
  def min_arr
    @min_arr ||= Array.new
  end
end

min_stack_2 = StackWithMinSecond.new
[7, 2, 4, 1, 9].each { |v| min_stack_2.push(v) }

assert_equal(9, min_stack_2.pop)
assert_equal(1, min_stack_2.min)
