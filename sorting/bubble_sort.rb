=begin
One of the simplest sorting algo, where you compare consecutive elements and keep doing it until
all elements are sorted.

=end
require '../spec_helper'

# We keep doing the even when all elements are sorted
def bubble_sort(arr)
  n = arr.length
  cnt = 0
  for i in (0...n) do
    cnt += 1
    for j in (0...n-1) do
      swap(arr, j, j+1) if arr[j] > arr[j+1]
    end
  end
  arr
end

def bubble_sort_impr(arr)
  cnt = 0
  n = arr.length
  for i in (0...n)
    swapped = false
    for j in (1...n)
      if arr[j-1] > arr[j]
        swap(arr, j-1, j)
        swapped = true
      end
    end
    cnt += 1
    break if !swapped
  end
  arr
end

def swap(arr, i, j)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
  arr
end


arr1 =  [5, 1, 4, 2, 8 ]
arr2 =  [5, 1, 4, 2, 8 ]
# cnt = bubble_sort_impr(arr1)
# puts cnt
# print arr1

assert_equal(bubble_sort_impr(arr2), bubble_sort(arr1))
