=begin
Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct
numbers from the original list. Return the linked list sorted as well.

Input: head = [1,2,3,3,4,4,5]
Output: [1,2,5]

Input: head = [1,1,1,2,3]
Output: [2,3]
=end
require '../../utils'

# The idea here is to find all the subsequent elements that are the same and then point the next of the predecessor to the
# next of the current element
# Time complexity: O(n) we make one pass through the list
# Space complexity: O(1)
def delete_duplicates(head)
  sentinel = ListNode.new(0, head)
  curr = head
  prev = sentinel

  while(curr)
    if (curr.next && curr.val == curr.next.val)
      # check for all duplicates
      while(curr.next && curr.val == curr.next.val)
        curr = curr.next
      end
      prev.next = curr.next
    else
      prev = prev.next
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

l1 = LinkedListUtils.create([1, 2, 3, 3, 4, 4, 5])

LinkedListUtils.print_list(l1)
puts delete_duplicates(l1)
LinkedListUtils.print_list(l1)