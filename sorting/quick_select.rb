require_relative '../spec_helper'
require_relative 'sort_helper'

# Find the kth largest elements in an array
class QuickSelect
  include SortHelper
  
  def initialize(arr)
    @arr = arr
  end
  
  def select(k)
    @arr = @arr.shuffle
    low, high = 0, @arr.length - 1
    
    while(high > low)
      j = partition(@arr, low, high)
      if(j < k)
        low = j + 1
      elsif (j > k)
        high = j - 1
      else
        return @arr[k]
      end
    end
    @arr[k]
  end
  
  private
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
q_select = QuickSelect.new(arr)
assert_equal(5, q_select.select(3))
assert_equal(3, q_select.select(1))
assert_equal(9, q_select.select(5))
