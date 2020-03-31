require_relative '../spec_helper'
require_relative 'sort_helper'

class MergeSort
  include SortHelper
  
  def initialize(arr)
    @arr = arr
  end
  
  def sort
    aux_arr = Array.new(@arr.length)
    sort_rec(@arr, aux_arr, 0, @arr.length - 1)
  end
  
  private
  
  def sort_rec(arr, aux_arr, low, high)
    return if (low >= high)
    mid = low + (high - low)/2
    sort_rec(arr, aux_arr, low, mid)
    sort_rec(arr, aux_arr, mid+1, high)
    merge(arr, aux_arr, low, mid, high)
  end
  
  def merge(arr, aux_arr, low, mid, high)
    # copy
    for k in (low..high) do
      aux_arr[k] = arr[k]
    end
    
    # merge
    i = low
    j = mid + 1
    for k in (low..high) do
      if(i > mid) 
        arr[k] = aux_arr[j]
        j += 1
      elsif( j > high)
        arr[k] = aux_arr[i]
        i += 1
      elsif( less(aux_arr[j], aux_arr[i]))
        arr[k] = aux_arr[j]
        j += 1
      else 
        arr[k] = aux_arr[i]
        i += 1
      end
    end
    @arr
  end
end

arr = [5, 3, 9, 4, 8, 2]
merge_sort = MergeSort.new(arr)
assert_equal([2,3,4,5,8,9], merge_sort.sort)