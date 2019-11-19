=begin
Implement a queue using linked list
=end


# Queues implement FIFO(first in first out ordering). New elements are added to the
# tail of the linked list

require_relative '../linked_list/node'
class QueueLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(data)
    if(@head.nil?)
      @tail = Node.new(data)
      @head = @tail
    else
      @tail.next = Node.new(data)
      @tail = @tail.next
    end
  end

  def dequeue
    unless(@head.nil?)
      item = @head.data
      @head = @head.next
      item
    end
  end

  def display
    node = @head
    puts "#{node.data}"
    while(node = node.next)
      puts "#{node.data}"
    end
  end
end

queue = QueueLinkedList.new
queue.enqueue(9)
queue.enqueue(2)
queue.enqueue(1)
queue.enqueue(7)
puts "Elements after enqueing are: "
queue.display
puts "Dequeued element: #{queue.dequeue}"
puts "Elements after dequeing are: "
queue.display
