=begin
# Container with water
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). 
n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, 
which together with x-axis forms a container, such that the container contains the most water.
=end


# Brute force way to solve this would to have two loops running over the array
# and at each step computing the maximum volume

# Running time: O(n^2) 
# Space complexity: O(1)
def max_area(height)
  len = height.length
  area = 0
  for i in (0...len)
    for j in (i+1...len)
      area = [area, (j-i) * [height[i], height[j]].min].max
    end
  end
  area
end


# improved version
# We have two pointers one pointing to the start and the other pointing to the 
# end. We only move the smaller of the two pointers and keep tabs on the max area
# seen so far.
# The reason for moving the smaller of the two pointers is that if we move the larger
# line, we wouldn't be increasing the area, since we would be decreasing (j-i) and the height 
# would be dictated by the smaller of the two lines. So we only move the smaller and fix the larger
# one. If after moving we encountered a larger one and j-i is smaller, there wouldn't be much improvement in the area.
# Similarly if encounter a smaller one, and j-i is less, we wouldn't get much improvement in the area.

# running time:  O(n)
# space complexity: O(1)
def max_area_improved(height)
  i = 0
  j = height.length - 1
  area = 0
  while(i < j)
    area = [area, (j-i) * [height[i], height[j]].min].max
    height[i] < height[j] ? (i+= 1) : (j-=1)
  end
  area
end

height = [1,8,6,2,5,4,8,3,7]
height1 = [0, 2]

puts max_area(height)
puts max_area_improved(height)

puts max_area(height1)
puts max_area_improved(height1)
