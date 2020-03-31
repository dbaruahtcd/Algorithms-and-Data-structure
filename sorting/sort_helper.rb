module SortHelper
  def less(v, w)
    (v <=> w) == -1
  end
  
  def exch(arr, i, j)
    swap = arr[i]
    arr[i] = arr[j]
    arr[j] = swap
  end
end