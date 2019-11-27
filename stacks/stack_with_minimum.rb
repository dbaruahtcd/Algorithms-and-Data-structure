=begin
Design a stack which in addition to push and pop, also has a function min which returns the
minimum element. Push, pop and min should all operate in O(1) time.
=end
require_relative 'stack_linked_list'
require '../spec_helper'

class StackWithMin < StackLinkedList

  def push(val)
    min_val = [val, min].min
    super(NodeWithMin.new(val, min_val))
  end

  def pop
    super.val
  end

  def min
    is_empty? ? 999999 : peek.min
  end

  class NodeWithMin
    attr_reader :val, :min
    def initialize(val, min)
      @val = val
      @min = min
    end
  end

end

min_stack = StackWithMin.new
[7, 2, 4, 1, 9].each { |v| min_stack.push(v) }

assert_equal(9, min_stack.pop)
assert_equal(1, min_stack.min)
