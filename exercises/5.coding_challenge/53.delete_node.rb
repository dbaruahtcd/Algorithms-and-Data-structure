=begin
Write a function to delete a node in a singly-linked list. You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.

It is guaranteed that the node to be deleted is not a tail node in the list.

Example 1
head = [4,5,1,9], node = 5
Output: [4,1,9]

Example 2:
Input: head = [1,2,3,4], node = 3
Output: [1,2,4]
=end
require '../../spec_helper'
require '../../utils'
# Copy the next element to the current node and update the next pointer of the current node
# Time and space complexity: O(1)
def delete_node(node)
  node.val = node.next.val
  node.next = node.next.next
end

class ListNode
  attr_accessor :val, :next

  def initialize(_val, _next = nil)
    @val = _val
    @next = _next
  end
end

l1 = LinkedListUtils.create([4, 5, 1, 9])

LinkedListUtils.print_list(l1)
puts delete_node(l1.next)
LinkedListUtils.print_list(l1)
