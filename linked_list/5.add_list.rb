=begin
You have two numbers represted by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list.
Write a function tthat adds the two numbers and returns the sum as a linked list.
=end
require_relative 'singly_linked_list'

def add_list(ll1, ll2, carry)
  if (ll1 == nil && ll2 == nil && carry == 0)
    return nil
  end

  result = SinglyLinkedList.new.add_to_tail(carry)

  value = carry
  if(ll1 != nil )
    value += ll1.data
  end

  if(ll2 != nil)
    value += ll2.data
  end

  result.data = value % 10

  if(ll1 != nil || ll2 != nil || value > 10)
    more = add_list(ll1 == nil ? nil : ll1.next,
                    ll2 == nil ? nil : ll2.next,
                    value >= 10 ? 1 : 0)
    result.next = more
  end
  result
end

ll1 = SinglyLinkedList.new
[7, 1, 6].each { |i| ll1.add_to_tail(i) }

ll2 = SinglyLinkedList.new
[5, 9, 2].each { |i| ll2.add_to_tail(i) }

sum =  add_list(ll1.head, ll2.head, 0)
print_list(sum)
