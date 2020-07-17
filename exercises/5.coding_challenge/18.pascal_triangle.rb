=begin
  Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
  Example:

Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
=end

# If the value of inner loop equal to zero or line number we insert 1 else its the sum of the previous two numbers
# Time complexity: O(n^2)
# Space complexity: O(n^2) Because we need to store each number that we update in triangle, the space requirement is 
# the same as the time complexity.
def generate(num_rows)
  pascal_tri = []
  for i in 0...num_rows do
    line = []
    for j in 0..i do
      if j == 0 || j == i
        line << 1
      else
        line[j] = pascal_tri[i-1][j-1] + pascal_tri[i-1][j]
      end
    end
    pascal_tri << line
  end
  pascal_tri
end


num_rows = 5
print generate(num_rows)