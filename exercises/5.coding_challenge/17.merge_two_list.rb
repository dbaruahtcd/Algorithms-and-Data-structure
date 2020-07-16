=begin
Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
=end
require 'byebug'

# We create a pre head that give us the entire list towards the end.

# Time complexity: O(n + m ) Iterate over two lists of length n and m
# Space complexity: O(1) 
def merge_two_list(l1, l2)
  # return if l1.nil? && l1.nil?
  sorted_list = ListNode.new(-1)
  curr = sorted_list
  while(!l1.nil? && !l2.nil?)
    if l1.val > l2.val
      curr.next = ListNode.new(l2.val)
      l2 = l2.next
    else
      curr.next = ListNode.new(l1.val)
      l1 = l1.next
    end
    curr = curr.next
  end
  curr.next = (l1.nil? ? l2 : l1)
  sorted_list.next
end

# Time complexity: O(n+m)
# Space comlexity: O(n+m) The first call to mergeTwoLists does 
# not return until the ends of both l1 and l2 have been reached, so n+m stack frames consume O(n+m) space.
def merge_two_list_recursive(l1, l2)
  if (l1.nil?)
    return l2
  elsif (l2.nil?)
    return l1
  elsif (l1.val < l2.val )
    l1.next = merge_two_list_recursive(l1.next, l2)
    return l1
  else
    l2.next = merge_two_list_recursive(l1, l2.next)
    return l2
  end
end


class ListNode
  attr_accessor :next, :val
  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end
  
  def self.to_s(node)
    while(node)
      print "#{node.val} -> "
      node = node.next
    end
  end
end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)
l1.next.next = ListNode.new(4)

l2 = ListNode.new(1)
l2.next = ListNode.new(3)
l2.next.next = ListNode.new(4)

l3 = nil
l4 = ListNode.new(0)

ListNode.to_s(merge_two_list(l1, l2))
ListNode.to_s(merge_two_list(l3, l4))

ListNode.to_s(merge_two_list_recursive(l1, l2))
ListNode.to_s(merge_two_list_recursive(l3, l4))