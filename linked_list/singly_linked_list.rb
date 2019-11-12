# Singly linked list

class SinglyLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def add_to_tail(data)
    if @head
      new_node = Node.new(data)
      curr_ptr = @head
      while(curr_ptr.next)
        curr_ptr = curr_ptr.next
      end
      curr_ptr.next = new_node
    else
      @head = Node.new(data)
    end
  end

  def add_after(target, value)
    node = find(target)
    return while !node

    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
  end

  def delete(value)
    if @head.data == value
      @head = @head.next
      return
    end
    node = find_before(value)
    node.next = node.next.next
  end

  def find(value)
    node = @head
    return node if node.data == value
    while(node = node.next)
      return node if node.data == value
    end
    false
  end

  def find_tail
    node = @head
    return node if !node.next
    while(node = node.next)
      return node if !node.next
    end
  end

  def find_before(value)
    node = @head
    return false if !node.next
    return node if node.next.data == value
    while(node = node.next)
      return node if node.next && node.next.data == value
    end
    false
  end

  def print
    curr = @head
    puts curr
    while(curr = curr.next)
      puts curr
    end
  end


  class Node
    attr_reader :data
    attr_accessor :next

    def initialize(data)
      @data = data
      @next = nil
    end

    def to_s
      "Node value is: #{@data}"
    end
  end
end


# ll = SinglyLinkedList.new
# puts "List after adding: "
# ll.add_to_tail(4)
# ll.add_to_tail(5)
# ll.add_to_tail(6)
# ll.print

# puts "List after deleting 5: "
# ll.delete(5)
# ll.print
#
# puts "List after adding 10 after 4 :"
# ll.add_after(4, 10)
# ll.print
#
# ll.add_to_tail(89)
# puts "Finding tail: #{ll.find_tail}"
#
# puts "Finding node before 6: #{ll.find_before(6)}"
#
# puts "Finding non existent value: #{ll.find(78)}"
# puts "Finding existent value 4: #{ll.find(4)}"
