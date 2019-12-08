=begin
Implement a MyQueue class which implements a queue using two stacks.
=end
require '../spec_helper'

class MyQueue

  attr_reader :new_stack, :old_stack

  def initialize
    @new_stack = Array.new
    @old_stack = Array.new
  end

  def dequeue
    move_stacks
    @old_stack.pop
  end

  def enqueue(val)
    @new_stack.push(val)
  end

  def peek
    move_stacks
    @old_stack.last
  end

  def size
    @new_stack.size + @old_stack.size
  end

  private

  def move_stacks
    # wait for old stack to get empty before pushing new elements
    # onto the old stack from the new

    if(@old_stack.empty?)
      for i in (0...@new_stack.size)
        @old_stack.push(@new_stack.pop)
      end
    end
  end
end

my_queue = MyQueue.new
[5, 4, 8, 6].each { |i| my_queue.enqueue(i) }

# puts "Elements in new queue are: #{my_queue.new_stack}"
# puts "Elements in old queue are: #{my_queue.old_stack}"
# puts "Popped element: #{my_queue.dequeue}"
# puts "Added element: #{my_queue.enqueue(10)}"
# puts "Elements in new queue are: #{my_queue.new_stack}"
# puts "Elements in old queue are: #{my_queue.old_stack}"

#after adding initial elements
assert_equal([5, 4, 8, 6], my_queue.new_stack)
assert_equal([], my_queue.old_stack)

#after popping an element
assert_equal(5, my_queue.dequeue)
assert_equal([], my_queue.new_stack)
assert_equal([6, 8, 4], my_queue.old_stack)

#after adding more elements
assert_equal([18], my_queue.enqueue(18))
assert_equal([6, 8, 4], my_queue.old_stack)
