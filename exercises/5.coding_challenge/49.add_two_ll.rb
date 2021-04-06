=begin
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]
Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
=end
require 'byebug'
def add_two_number(l1, l2)
  result = nil
  carry = 0
  while(!l1.nil? && !l2.nil?)
    debugger
    sum = l1.val + l2.val + carry
    first = sum % 10
    carry = sum / 10
    l1 = l1.next
    l2 = l2.next
    if result.nil?
      result = ListNode.new(first)
    elsif l1.nil? && l2.nil?
      result.next = ListNode.new(first)
      result.next = ListNode.new(carry)
    end
  end
  if carry != 0
    result.next = ListNode.new(carry)
  end
  debugger
  result
end


class ListNode
  attr_accessor :val, :next
  
  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end
end

l1 = ListNode.new(2)
l1.next = ListNode.new(4)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)

print add_two_number(l1, l2)
