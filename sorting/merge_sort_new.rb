=begin
  # find mid element
  # sort_left
  # sort_right
  # merge
=end
require 'byebug'

def sort(arr)
  merge_sort(arr, 0, (arr.length-1))
end

def merge_sort(arr, l, h)
  # l, h = 0, arr.length-1
  return if l == h
  mid = (l + h)/2
  merge_sort(arr, l, mid)
  merge_sort(arr, mid+1, h)
  merge(arr, l, mid, h)
end

def merge(arr, l, mid, h)
  return if l > h

  sorted = []
  debugger
  while(l < mid && mid < h)
    if arr[l] > arr[mid+1]
      sorted << arr[mid+1]
      mid += 1
    elsif
      sorted << arr[l]
      l += 1
    end
  end
  sorted
end

arr = [12, 11, 13, 6, 7, 5]

puts sort(arr)