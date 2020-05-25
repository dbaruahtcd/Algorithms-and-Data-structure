# Given a linked list, determine if it has a cycle in it.

# solution 1

# using a hash table to check if the node has already been visited
# Time complexity: O(n) We visit each of the n elements in the list 
# at most once. Adding a node to the hash table costs only O(1) time.
# space complexity: O(n). The space depends on the number of elements added to the hash table, which contains at most n elements.
def has_cycle(head)
  curr = head
  seen_node = {}
  while(curr)
    if(seen_node.has_key?(curr))
      return true
    else 
      seen_node[curr] = :true
    end
    curr = curr.next
  end
  false
end


# We have two pointers on slow and the other fast and if there is a cycle the fast would eventually catchup 
# to the slow one. If there is no cycle the fast pointer would reach the end first.
# Running time: O(n)
# Space complexity: O(1)
def has_cycle_two_pointer(head)
  return false if head.nil? || head.next.nil?
  slow = head
  fast = head.next
  while(fast)
    return true if(fast == slow)
    slow = slow.next
    fast = fast&.next&.next
  end
  false
end

class ListNode
  attr_accessor :val, :next
  
  def initialize(val, _next=nil)
    @val = val
    @next = _next
  end
end

node1 = ListNode.new(1)
node1.next = ListNode.new(2)
node1.next.next = ListNode.new(3)
node1.next.next.next = ListNode.new(4)
node1.next.next.next.next = node1


puts has_cycle(node1)
puts has_cycle_two_pointer(node1)