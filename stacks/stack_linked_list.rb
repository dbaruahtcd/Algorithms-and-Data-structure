=begin
Linked list implementation of a stack
=end

# Stack uses LIFO ordering. So all new elements goes to the top, and deletion
# happens from the top as well. It provides 3 basic operations
# push, pop and peek

class StackLinkedList
  attr_accessor :top

  def initialize
    @top = nil
  end

  def push(val)
    if(@top.nil?)
      node = Node.new(val)
      node.data = val
      @top = node
    else
      node = Node.new(val)
      node.data = val
      node.next = @top
      @top = node
    end
  end

  def pop
    unless(@top.nil?)
      item = @top.data
      @top = @top.next
      return item
    end
  end

  def peek
    unless @top.nil?
      return @top.data
    end
  end

  def display
    head = @top
    while(head)
      puts "#{head}"
      head = head.next
    end
  end

  class Node
    attr_accessor :data
    attr_accessor :next

    def initialize(data)
      @data = data
      @next = nil
    end

    def to_s
      "#{@data}"
    end
  end
end

stack = StackLinkedList.new
stack.push(11)
stack.push(3)
stack.push(5)
stack.push(1)
puts "Elements after push are : "
stack.display
puts "Popped element : #{stack.pop}"
puts "Elements after popping are : "
stack.display
puts "Top element in the stack: #{stack.peek}"
