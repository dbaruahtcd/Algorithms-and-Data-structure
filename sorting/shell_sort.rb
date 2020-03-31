require_relative '../spec_helper'
require_relative 'sort_helper'

# Move entries more than one position at a time by h-sorting the array
# A g sorted array remains g sorted after h sorting it. Eg a 7 sorted array
# remains 7 sorted even after 3 sorting it
class ShellSort
  include SortHelper
  
  def initialize(arr)
    @arr = arr
  end
  
  def sort
    len = @arr.length
    h = 1
    while(h < len/3) # unless array big enough h is mostly 1
      h = (3 * h) + 1
    end
    
    while(h >= 1)
      for i in (h...len) do
        j = i # start index from the end
        while((j > 0) && less(@arr[j], @arr[j-h])) # similar to insertion sort
          exch(@arr, j, j-h)
          j -= h
        end
      end
      h = h/3
    end
    @arr
  end

end

arr = [5, 3, 9, 4, 8, 2]
shell_sort = ShellSort.new(arr)
assert_equal([2, 3, 4, 5, 8, 9], shell_sort.sort)
