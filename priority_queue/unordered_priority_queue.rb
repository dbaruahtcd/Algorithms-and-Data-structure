#Unordered PQ implementation.
# Insertion : O(1)
# Delete max: O(n)
require_relative '../spec_helper'

class UnorderedPriorityQueue

  def initialize(capacity)
    @size = 0;
    @pq = Array.new(capacity)
  end

  def is_empty?
    @size == 0
  end

  def insert(val)
    @pq[@size] = val
    @size += 1
  end

  def delete_max
    max = 0
    for i in (0..@size-1) do
      max = i if less(max, i)
    end
    exchange(max, @size-1)
    max_val = @pq[@size-1]
    @pq[@size - 1] = nil #to prevent loitering
    @size -= 1
    max_val
  end

  private
  #dealing with indices instead of keys
  def less(max, i)
    (@pq[max] <=> @pq[i]) == -1
  end

  def exchange(max, last)
    max_val = @pq[max]
    @pq[max] = @pq[last]
    @pq[last] = max_val
  end
end

pq = UnorderedPriorityQueue.new(20)
assert(pq.is_empty?)
5.step(35, 5).each{ |i| pq.insert(i) } # starting at 5, count till 35 in steps of 5
assert(!pq.is_empty?)
assert_equal(35, pq.delete_max)
assert_equal(30, pq.delete_max)
assert_equal(25, pq.delete_max)
