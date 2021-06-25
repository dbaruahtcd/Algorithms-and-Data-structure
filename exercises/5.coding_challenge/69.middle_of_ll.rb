# Find the middle of a linked list with only one pass

require_relative '../../spec_helper'

def mid_ll(head)
  fast, slow = head, head

  while(fast.next && fast.next.next)
    slow = slow.next
    fast = fast.next.next
  end
  slow.to_s
end


class Node
  attr_accessor :val, :next
  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end

  def to_s
    "Value is: #{@val}"
  end
end


ll = Node.new(2)
ll.next = Node.new(5)
ll.next.next = Node.new(6)
ll.next.next.next = Node.new(7)

assert_equal(mid_ll(ll), "Value is: 5")