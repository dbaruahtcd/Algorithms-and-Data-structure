require_relative '../spec_helper'
require_relative 'sort_helper'

# in iteration i, swap[i] with each larger entry to its left.
class InsertionSort
  include SortHelper
  
  def initialize(arr)
    @arr = arr
  end
  
  def sort
    for i in (0...@arr.length)
      j = i
      while(j > 0) #  putting the >= here leads to bug, because we pass the array range
        if less(@arr[j], @arr[j-1])
          exch(@arr, j, j-1)
        else
          break # we don't move further because the list to the left is already sorted
        end
        j -= 1
      end
    end
    @arr
  end
end

arr = [5, 3, 9, 4, 8, 2]
insertion_sort = InsertionSort.new(arr)
assert_equal([2, 3, 4, 5, 8, 9], insertion_sort.sort)
