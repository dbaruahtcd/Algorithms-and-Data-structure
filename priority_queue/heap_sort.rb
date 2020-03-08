# Implementation of in place sorting algorithm with NlogN worst case running time.
require_relative '../spec_helper'
class HeapSort
  attr_reader :arr

  def initialize(a)
    @arr = [nil]
    a.each { |i| @arr.push(i) }
    @size = @arr.size - 1  || 0
  end

  # First build a heap using bottom up method
  # Then continuously remove the max until the entire heap is sorted
  def sort
    (@size/2).downto(1) do |i|
      sink(i)
    end
    while(@size > 1)
      exchange(1, @size)
      # order is very important. Reducing size later on, leads to nasty bugs
      @size -= 1
      sink(1)
    end
    @arr
  end

  private

  def sink(index)
    while(2*index <= @size)
      k = 2 * index
      k += 1 if ((k < @size) && less(k, k+1))
      break if !less(index, k)
      exchange(index, k)
      index = k
    end
  end

  def less(a, b)
    (arr[a] <=> arr[b]) == -1
  end

  def exchange(a, b)
    temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
  end
end

arr = (1..6).to_a
heap = HeapSort.new(arr)

heap_sorted = heap.sort
heap_sorted.shift
assert_equal([1, 2, 3, 4, 5, 6], heap_sorted)
