require_relative '../spec_helper'

# In iteration i, find the index of the smallest remaining entry
class SelectionSort
  def initialize(arr)
    @arr = arr
  end
  
  def sort
    for i in (0...@arr.length) do
      min = i
      j = i + 1
      while(j < @arr.length)
        min = j if less(@arr[j], @arr[min])
        j += 1
      end
      exch(i, min)
    end
    @arr
  end
  
  private
  def less(v, w)
    (v <=> w) == -1
  end
  
  def exch(i, j)
    swap = @arr[i]
    @arr[i] = @arr[j]
    @arr[j] = swap
  end
end

test_arr = [4, 3, 7, 7, 2]
# 10.times { test_arr << rand(1..20)}
ss = SelectionSort.new(test_arr)
assert_equal([2, 3, 4, 7, 7], ss.sort)