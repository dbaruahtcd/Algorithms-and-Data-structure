# A collection of commonly used methods
class LinkedListUtils
  def self.print_list(list)
    return if list.nil?
    print "#{list.val} -> "
    print_list(list.next)
  end

  # Creates a linked list from a passed in array
  def self.create(arr)
    head = ListNode.new(0)
    curr = head
    arr.each do |a|
      curr.next = ListNode.new(a)
      curr = curr.next
    end
    head.next
  end
end