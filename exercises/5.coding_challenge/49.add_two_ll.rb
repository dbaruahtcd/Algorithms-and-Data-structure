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

# Time complexity: O(max(length(l1, l2)))
# Space complexity: O(max(length(l1, l2))). Length is atmost O(max(l1, l2) + 1)

# Initialize first node of the result list to 0 and return the next other there are lot of conditionals to check
def add_two_number(l1, l2)
  m, n  = l1, l2
  result = ListNode.new(0)
  curr = result
  carry = 0
  while(!m.nil? || !n.nil?)
    x = m.nil? ? 0 : m.val
    y = n.nil? ? 0 : n.val
    sum = x + y + carry
    curr.next = ListNode.new(sum % 10)
    carry = sum / 10
    curr = curr.next
    m = m.next if !m.nil?
    n = n.next if !n.nil?
  end
  curr.next = ListNode.new(carry) if (carry > 0)
  result.next
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

print add_two_number(l1, l2) # 601
