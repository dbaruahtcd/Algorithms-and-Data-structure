=begin
  Remove duplicates from an unsorted linked list
=end

require_relative 'singly_linked_list'

# runtime of O(n), n is the number of nodes in the ll
def delete_duplicates_with_buffer(linkedList)
  list_hash = Hash.new
  prev = nil
  node = linkedList.head
  while(node)
    if list_hash.has_key?(node.data)
      prev.next = node.next
    else
      list_hash[node.data] = true
      prev = node
    end
    node = node.next
  end
  prev
end

# takes O(1) space but runtime is O(n^2)
def delete_duplicates_without_buffer(linkedlist)
  return if linkedlist == nil
  curr = linkedlist.head
  runner = curr.next
  while(curr)
    while(runner)
      if(runner.data == curr.data)
        runner.next = runner.next.next
      else
        runner = runner.next
      end
    end
    curr = curr.next
  end
  runner
end

ll = SinglyLinkedList.new
[4, 3, 6, 7, 1, 3, 9, 4].each { |i| ll.add_to_tail(i) }
puts "List with duplicates: "
ll.print
puts "List without duplicates using with buffer solution: "
delete_duplicates_with_buffer(ll)
ll.print
puts "List without duplicates using without buffer solution: "
delete_duplicates_without_buffer(ll)
ll.print
