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


# All elements to the left of the current element are sorted. If an element isn't is in it's correct place,
# it needs to be put in its correct place before moving to the next element.
def insertion_sort_second(arr)
  i = 1
  while i < arr.length
    j = i
    while(less(arr[j], arr[j-1]) && j >= 1)
      swap(arr, j, j -1)
      j -= 1
    end
    i += 1
  end
  arr
end

def swap(arr, i, j)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end

def less(a, b)
  (a <=> b) == -1
end

arr1 = [3, 7, 4, 9, 5, 2, 6, 1]
# print insertion_sort(arr1)

assert_equal([1, 2, 3, 4, 5, 6, 7, 9], insertion_sort(arr1))