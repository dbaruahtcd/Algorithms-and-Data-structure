=begin
Given the head of a singly linked list, return true if it is a palindrome.

Example 1:
Input: head = [1,2,2,1]
Output: true

Input: head = [1,2]
Output: false
=end
require '../../spec_helper'

# Time complexityL: O(n)
# Space complexity: O(n)
def is_palindrome_with_array(head)
  arr = []
  curr = head
  while(curr)
    arr << curr.val
    curr = curr.next
  end

  i = 0
  j = arr.length - 1
  # don't need to check for == since that will be the middle element for odd sized arrays
  while(i < j)
    if arr[i] != arr[j]
      return false
    end
    i += 1
    j -= 1
  end
  true
end


# A recursive solution to the problem would involve us having to check the val of a node when a reversed ll.
# The algorithm firstly checks the rest of the Linked List. If it discovers that further down that the Linked List is not a palindrome, then it returns false.
# Running time: O(n)
# Space complexity: O(n) We would have thought the space complexity would have been O(1), since we're not using any additional data structure
# but its O(n) due to the recursive functions using stack frames to track the exection of the functions.
# In this case before any palindrome check is done, all the nodes have to be placed in the stack frame first and that requires O(n) space
class SolutionRec
  attr_accessor :front_pointer

  def is_palindrome_rec(head)
    @front_pointer = head
    recursive_check(head)
  end

  private

  def recursive_check(node)
    if (node)
      return false if(!recursive_check(node.next))
      return false if(node.val != @front_pointer.val)
      @front_pointer = @front_pointer.next
    end
    return true
  end
end

# The previous solution didn't have a O(1) solution. The only way we could do that is by updating the list in place
# Steps
# 1. Find end of the first half
# 2. Reverse the second half
# 3. Determine if its a palindrome
# 4. Restore the list and return result

# Running time: O(n)
# Space complexity: O(1): We are changing the next pointers for half of the nodes. This was all memory that had already
# been allocated, so we are not using any extra memory and therefore it is O(1).
# Downside: Can't be used in a concurrent environment accessing the same data. That's a limitation of an in place algorithm
class SolutionRecImpv
  def is_palindrome(head)
    return false if head.nil?

    first_half = first_half_end(head)
    second_half = reverse_list(first_half.next)

    p1 = head
    p2 = second_half
    result = true
    while(result && !p2.nil?)
      result = false if p1.val != p2.val
      p1 = p1.next
      p2 = p2.next
    end

    first_half.next = reverse_list(second_half)
    return result
  end

  private

  def reverse_list(head)
    prev = nil
    curr = head
    while(curr)
      tempNode = curr.next
      curr.next = prev
      prev = curr
      curr = tempNode
    end
    prev
  end

  def first_half_end(head)
    fast, slow = head, head
    while(fast.next && fast.next.next)
      slow = slow.next
      fast = fast.next.next
    end
    slow
  end
end

class ListNode
  attr_accessor :val, :next

  def initialize(_val, _next= nil)
    @val = _val
    @next = _next
  end
end

def create_list(arr)
  head = ListNode.new(0)
  curr = head
  arr.each do |a|
    curr.next = ListNode.new(a)
    curr = curr.next
  end
  head.next
end

l1 = create_list([1, 2, 1])
l2 = create_list([1, 2, 3, 1])

# solution 1
assert(is_palindrome_with_array(l1))
assert(!is_palindrome_with_array(l2))

# solution 2
assert(SolutionRec.new.is_palindrome_rec(l1))
assert(!SolutionRec.new.is_palindrome_rec(l2))

# solution 3
puts SolutionRecImpv.new.is_palindrome(l1)
puts SolutionRecImpv.new.is_palindrome(l2)