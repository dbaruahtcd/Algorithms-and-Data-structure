=begin
Write code to partition a linked list around a value x, such that all nodes less than x come
before all nodes greater than or equal to x.
=end

require 'byebug'
require '../spec_helper'
require_relative 'singly_linked_list'

def partition_with_four_pointers(ll, pivot)
  before_start = nil
  before_end = nil
  after_start = nil
  after_end = nil
  node = ll.head
  while(node)
    next_node = node.next
    # we do this because we don't want to copy the link
    node.next = nil
    if(node.data < pivot)
      if(before_start == nil)
        before_start = node
        before_end = before_start
      else
        before_end.next = node
        before_end = node
      end
    else
      if(after_start == nil)
        after_start = node
        after_end = after_start
      else
        after_end.next = node
        after_end = node
      end
    end
    node = next_node
  end
  return after_start if before_start == nil

  before_end.next = after_start
  return before_start
end

# Maintaining four pointers can be messy, so instead we can do with maintaining two
# and do another iteration to merge the final list together. But instead of add at the
# tail of the list, we add in the front.
### Note the order of the elements in the two list might differ
def partition_with_two_pointers(ll, pivot)
  before_start = nil
  after_start = nil
  node = ll.head
  while(node != nil)
    next_node = node.next
    if(node.data < pivot)
      node.next = before_start
      before_start = node
    else
      node.next = after_start
      after_start = node
    end
    node = next_node
  end
  # merging the two list
  return after_start if before_start == nil

  head = before_start
  while(before_start.next)
    before_start = before_start.next
  end
  before_start.next = after_start

  head
end

def print_list(ll)
  data = ll.data
  node = ll.next
  print "#{data} "
  while(node)
    print "#{node.data} "
    node = node.next
  end
  puts ''
end

ll = SinglyLinkedList.new
[5, 3, 9, 2, 7].each { |i| ll.add_to_tail(i) }
puts "List before sorting"
ll.print
puts "List after sorting using 4 pointers"
print_list(partition_with_four_pointers(ll, 6))
puts "List after sorting using 2 pointers"
print_list(partition_with_two_pointers(ll, 6))
