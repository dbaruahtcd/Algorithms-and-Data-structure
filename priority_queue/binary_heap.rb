# Max Binary heap maintains the property that the max element is always at the
# top of the tree and that the childrens keys are not greater than that of the
# parent
# If the parent key is at node with index i then the children will be at node 2i & 2i + 1

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
    sink(1)
    @heap[@size] = nil
    @size -= 1
    max_element
  end

  def swim(index)
    while(index >= 1)
      k = index/2
      exchange(k, index) if (less(k, index))
      index = index/2
    end
  end

  def sink(index)
    while(index <= @size)
      k = index * 2
      k += 1 if (less(k, k+1) && (k < @size))
      exchange(index, k)
      index *= 2
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
# heap.insert(1)
# heap.insert(2)
# heap.insert(3)
# heap.insert(4)
# heap.insert(5)
puts heap.heap
puts heap.size
puts "deleted : #{heap.delete_max}"
puts "deleted : #{heap.delete_max}"
puts "deleted : #{heap.delete_max}"
puts "deleted : #{heap.delete_max}"
puts "deleted : #{heap.delete_max}"
# puts heap.size
# puts heap.heap
