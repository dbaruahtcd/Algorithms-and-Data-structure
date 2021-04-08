=begin
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. 
Return the linked list sorted as well.

Input: head = [1,1,2]
Output: [1,2]

Input: head = [1,1,2,3,3]
Output: [1,2,3]
=end
def delete_duplicates(head)
  curr = head
  while(!curr.nil? && !curr.next.nil?)
    if(curr.next.val == curr.val)
      curr.next = curr.next.next
    else
      curr = curr.next
    end
  end
  head
end

class ListNode
  attr_accessor :val, :next
  
  def initialize(_val, _next=nil)
    @val = _val
    @next = _next
  end
end

l1 = ListNode.new(1)
l1.next = ListNode.new(1)
l1.next.next = ListNode.new(2)

l2 = ListNode.new(1)
l2.next = ListNode.new(1)
l2.next.next = ListNode.new(2)
l2.next.next.next = ListNode.new(3)
l2.next.next.next.next = ListNode.new(3)

puts delete_duplicates(l1)
puts delete_duplicates(l2)