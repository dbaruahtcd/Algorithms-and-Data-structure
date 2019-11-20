=begin
  Describe how you could use a single array to implement three stacks
=end

require '../spec_helper'

class StackData
  attr_reader :stack_arr
  @@stack_size = 100

  def initialize
    @stack_pointer = [-1, -1, -1]
    @buffer_size = @@stack_size * 3
    @stack_arr = Array.new(@buffer_size, -1)
  end

  def push(stack_num, data)
    if @stack_pointer[stack_num] < @buffer_size
      @stack_pointer[stack_num] += 1
      @stack_arr[top_of_stack(stack_num)] = data

    end
  end

  def pop(stack_num)
    unless is_empty?(stack_num)
      index = top_of_stack(stack_num)
      popped_element = @stack_arr[index]
      @stack_arr[index] = -1
      @stack_pointer[stack_num] -= 1
      return popped_element
    end
  end

  def is_empty?(stack_num)
    @stack_pointer[stack_num] == -1
  end

  def peek(stack_num)
    @stack_arr[top_of_stack(stack_num)]
  end


  private
  def top_of_stack(stack_num)
    stack_num * @@stack_size + @stack_pointer[stack_num]
  end
end

stack = StackData.new
stack.push(0, 11)
stack.push(1, 22)
stack.push(2, 33)

# checking push
assert_equal(11, stack.stack_arr[0])
assert_equal(22, stack.stack_arr[100])
assert_equal(33, stack.stack_arr[200])

#checking peek
assert_equal(11, stack.peek(0))
assert_equal(22, stack.peek(1))
assert_equal(33, stack.peek(2))

# checking is_empty
assert(!stack.is_empty?(0))
assert(!stack.is_empty?(1))
assert(!stack.is_empty?(2))

# checking pop operation
assert_equal(11, stack.pop(0))
assert_equal(22, stack.pop(1))
assert_equal(33, stack.pop(2))

# checking is_empty
assert(stack.is_empty?(0))
assert(stack.is_empty?(1))
assert(stack.is_empty?(2))
