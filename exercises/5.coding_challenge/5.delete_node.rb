=begin
Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

Given linked list -- head = [4,5,1,9], which looks like following:
Example 1:

Input: head = [4,5,1,9], node = 5
Output: [4,1,9]
Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
Example 2:

Input: head = [4,5,1,9], node = 1
Output: [4,5,9]
Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
 
Note:
The linked list will have at least two elements.
All of the nodes' values will be unique.
The given node will not be the tail and it will always be a valid node of the linked list.
Do not return anything from your function.
=end


# basic old school way to solve this would be to recurse through the list the list to find the node 
# before the node to be deleted and then do the rest

# running time O(n): worst case in case we have to pass the entire ll
# space complexity: O(1)
def delete_node(list, head)
  curr = list
  while(curr.next.val != head.val)
    curr = curr.next
  end
  curr.next = head.next
  head = nil
end

# Instead of doing the previous way, just copy the next node ahead of the node to be deleted
# to the current node and then delete the next node
# node : ListNode (the node to be deleted)

# time complexity: O(1)
# space complexity: O(1)
def delete_node_improved(node)
  node.val = node.next.val
  node.next = node.next.next
end

class ListNode
  attr_accessor :val, :next
  
  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end
end

list = ListNode.new(4)
list.next = ListNode.new(5)
list.next.next = ListNode.new(1)
list.next.next.next = ListNode.new(9)

head = list.next

# def to_s(node)
#   while(node)
#     print "#{node.val}->"
#     node = node.next
#   end
# end

# delete_node(list, head)
delete_node_improved(head)
# to_s(list)
puts list.inspect