=begin
Given the root node of a binary search tree, return the sum of values of all nodes with a
value in the range [low, high].

Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32

Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
Output: 23
=end
require '../../spec_helper'
# Using DFS we iterate through the tree and calculate the sum if the value of the node is within
# the range specified
# Time: O(n)
# Space: O(n)
def range_sum_bst(root, low, high)
  @ans = 0
  dfs(root, low, high)
  @ans
end

def dfs(root, low, high)
  return if(root.nil?)

  if(root.val >= low && root.val <= high)
    @ans += root.val
  end
  dfs(root.left, low, high) if low < root.val
  dfs(root.right, low, high) if root.val < high
end


class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left= nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

t1 = TreeNode.new(10)
t1.left = TreeNode.new(5)
t1.right = TreeNode.new(15)
t1.left.left = TreeNode.new(3)
t1.left.right = TreeNode.new(7)
t1.right.right = TreeNode.new(18)

assert_equal(range_sum_bst(t1, 7, 15), 32)