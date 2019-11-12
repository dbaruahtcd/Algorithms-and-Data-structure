=begin
Implement an algo to find the kth to last element of a singly linked list
=end

require_relative 'singly_linked_list'
require '../spec_helper'

# We wouldn't be able to return a node, to we maintain a counter variable,
# that returns when the kth to the last element(when k = 0/1, it's the last element, k=2 returns
# the second last element).
# We first recurse to the last position of the linked list and then start incrementing the counter,
# and when the counter equals to k, we return
#It takes O(n) space for each recursive calls
def nth_to_last_recursive(linkedlist_head, k)
  # return if linkedlist_head == nil
  return 0 if linkedlist_head == nil


  cntr = nth_to_last_recursive(linkedlist_head.next, k) + 1
  if(cntr == k)
    puts "The #{k}th to the last element is : #{linkedlist_head.data}"
  end
  return cntr
end

# Here we two pointers - one pointing to the first and the second pointer to
# k elements ahead. So when the last pointer hits nil, the first pointer will point
# to the kth position
# Solution that O(1) space and O(n) running time.
def nth_to_last_iterative(linkedlist_head, k)
  curr = linkedlist_head
  runner = linkedlist_head
  for i in (0...k-1) do
    return nil if runner == nil
    runner = runner.next
  end

  return nil if runner == nil

  while(runner.next)
    curr = curr.next
    runner = runner.next
  end
  return curr
end

ll = SinglyLinkedList.new
[6, 2, 3, 9, 4, 5].each { |i| ll.add_to_tail(i) }
ll.print
nth_to_last_recursive(ll.head, 3)
puts "The 3rd to the last element is: #{nth_to_last_iterative(ll.head, 3)}"
