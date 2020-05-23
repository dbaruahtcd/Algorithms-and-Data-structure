=begin
Reverse a singly linked list.
Example:
Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL
=end

def reverse_list_iterative(head)
  node_head = head
  stack = [node_head.val]
  while(node_head = node_head.next)
    stack << node_head.val
  end
  
  reversed_list = ListNode.new(stack.pop)
  curr = reversed_list
  while(!stack.empty?)
    val = stack.pop
    node = ListNode.new(val)
    curr.next = node
    curr = curr.next
  end
  reversed_list
end


# Assume that we have linked list 1 → 2 → 3 → Ø, we would like to change it to Ø ← 1 ← 2 ← 3.
# While you are traversing the list, change the current node's next pointer to point to its previous 
# element. Since a node does not have reference to its previous node, you must store its previous element 
# beforehand. You also need another pointer to store the next node before changing the reference. Do not 
# forget to return the new head reference at the end!

# Time complexity : O(n). Assume that nn is the list's length, the time complexity is O(n).
# Space complexity : O(1).
def reverse_list_iterative_second(head)
  curr = head
  prev = nil
  while(!curr.nil?)
    temp_next = curr.next
    curr.next = prev
    prev = curr
    curr = temp_next
  end
  prev
end

# def reverse_list_recursive(head)
#   if head.nil?  || head.next.nil?
#     return head
#   end
# 
#   list = reverse_list_helper(head.next)
#   head.next.next = head
#   head.next = nil
#   list
# end


class ListNode
  attr_accessor :val, :next
  
  def initialize(val, _next=nil) # prepend unused varibles with an underscore
    @val = val
    @next = _next
  end
  
  def to_s
    "Node value is: #{@val}"
  end
  
  def print(head)
    curr = head
    puts curr
    while(curr = curr.next)
      puts curr
    end
  end
end


node1 = ListNode.new(1)
node1.next = ListNode.new(2)
node1.next.next = ListNode.new(3)
node1.next.next.next = ListNode.new(4)
# node1.print(node1)
puts reverse_list_iterative(node1).inspect
puts reverse_list_iterative_second(node1).inspect
puts reverse_list_recursive(node1).inspect

