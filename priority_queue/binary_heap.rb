# Max Binary heap maintains the property that the max element is always at the
# top of the tree and that the childrens keys are not greater than that of the
# parent
# If the parent key is at node with index i then the children will be at node 2i & 2i + 1
require_relative '../spec_helper'

class BinaryHeap
  attr_reader :heap, :size

  def initialize
    @heap = []
    @size = 0
  end

  # For convenience we would start inserting from index 1
  def insert(key)
    @size += 1
    @heap[@size] = key
    swim(@size)
  end

  def delete_max
    max_element = @heap[1]
    exchange(1, @size)
    @heap[@size] = nil
    @size -= 1
    sink(1)
    max_element
  end

  def swim(index)
    while(index >= 1)
      k = index/2
      exchange(k, index) if (less(k, index))
      index = index/2
    end
  end

  # Dont forget to perform two checks here, one for parent and child and one
  # for both children
  def sink(index)
    while(2*index <= @size)
      k = index * 2
      k += 1 if ((k < @size) && less(k, k+1))
      break if(!less(index, k))
      exchange(index, k)
      index = k
    end
  end

  private
  def less(a, b)
    (@heap[a] <=> @heap[b]) == -1
  end

  def exchange(a, b)
    temp = @heap[a]
    @heap[a] = @heap[b]
    @heap[b] = temp
  end
end

heap = BinaryHeap.new
(1..5).to_a.each { |i| heap.insert(i) }

assert_equal([nil, 5, 4, 2, 1, 3], heap.heap)
assert_equal(5, heap.size)
assert_equal(5, heap.delete_max)

assert_equal(4, heap.delete_max)
assert_equal([nil, 3, 1, 2, nil, nil], heap.heap)

assert_equal(3, heap.size)
