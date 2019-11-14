# Delete a node from the middle of a singly linked list, given only access
# to that node

require_relative 'singly_linked_list'
require '../spec_helper'

# We could copy over all the elements from the middle until the end of the ll
def delete_node?(mid_node)
  return false if (mid_node == nil || mid_node.next == nil)

  # **** Important ***
  # The problem can't be solved if the given node is the last node of
  # ll.
  next_node = mid_node.next
  mid_node.data = next_node.data
  mid_node.next = next_node.next
  return true
end

ll = SinglyLinkedList.new
[1, 2, 3, 4, 5].each {|i| ll.add_to_tail(i) }
mid = ll.find(3)
last = ll.find(5)
assert(delete_node?(mid))
assert(!delete_node?(last))
