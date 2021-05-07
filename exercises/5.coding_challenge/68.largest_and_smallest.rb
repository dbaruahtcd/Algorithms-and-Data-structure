# Given an array of numbers find the largest and the smallest numbers in the array

def largest_n_smallest(arr)
  largest = - 2.size**32
  smallest = 2.size**32
  arr.each do |num|
    if num > largest
      largest = num
    elsif num < smallest
      smallest = num
    end
  end
  "Largest: #{largest} smallest:  #{smallest}"
end


  arr = [4, 5, 6, 2, -3, 58, 1]
  puts largest_n_smallest(arr)