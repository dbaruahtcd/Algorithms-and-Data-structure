=begin
Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, 
and return the new head.

Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]

Input: head = [], val = 1
Output: []

Input: head = [7,7,7,7], val = 7
Output: []
=end
# Deleting a node from the middle isn't going to be complicated but deleting from the front of the list is going to be
# Hence we need to make use of something called a sentinel node, which is a dummy node that we add to the front of the list 
# which would make the processing of the list much easier
# Running time O(n)
# Space complexity: O(1)
def remove_elements(head, val)
  sentinel = ListNode.new(0)
  sentinel.next = head
  prev = sentinel
  curr = head
  while(curr)
    if curr.val == val
      prev.next = curr.next
    else
      prev = curr
    end
    curr = curr.next
  end
  sentinel.next
end

class ListNode
  attr_accessor :val, :next
  
  def initialize(_val, _next = nil)
    @val = _val
    @next = _next
  end
end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)
l1.next.next = ListNode.new(6)
l1.next.next.next = ListNode.new(3)
v1 = 6

l2 = ListNode.new(7)
l2.next = ListNode.new(7)
l2.next.next = ListNode.new(7)
v2 = 7

puts remove_elements(l1, v1)
# puts remove_elements(l2, v2)

