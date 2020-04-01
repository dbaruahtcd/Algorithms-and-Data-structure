require_relative '../spec_helper'
require_relative 'sort_helper'

# Shuffle Array
# partition around a pivot
# no entry to the left greater than pivot 
# no entry to the right smaller than pivot
# sort each piece recursively

class QuickSort
  include SortHelper
  
  attr_reader :arr
  def initialize(arr)
    @arr = arr
  end
  
  def sort
    # needed for performance guarantees
    arr.shuffle
    sort_rec(@arr, 0, @arr.length - 1)
  end
  
  private
  # def arr
  #   @arr
  # end
  
  def sort_rec(arr, low, high)
    return if low >= high
    j = partition(arr, low, high)
    sort_rec(arr, low, j-1)
    sort_rec(arr, j+1, high)
  end
  
  def partition(arr, low, high)
    i, j = low, high+1
    
    while(true)
      # find elements greater than pivot from the start to move right
      while(less(arr[i += 1], arr[low]))
        break if(i == high)
      end
      
      # find elements greater than pivot from the end to move left
      while(less(arr[low], arr[j -= 1]))
        break if(j == low)
      end
      
      break if(i >= j) # usually would break here
      exch(arr, i, j)
    end
    exch(arr, low, j)
    return j
  end
end

arr = [5, 3, 9, 4, 8, 2]
quick_sort = QuickSort.new(arr)
quick_sort.sort
assert_equal([2,3,4,5,8,9], quick_sort.arr)