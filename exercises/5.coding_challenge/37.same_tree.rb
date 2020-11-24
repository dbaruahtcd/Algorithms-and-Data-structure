=begin
Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

Example 1:

Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true
Example 2:

Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false
Example 3:

Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false
=end
require '../../spec_helper'
# Time complexity: O(n)
# Space complexity: O(n) worst case. O(logn) best case perfectly balanced
def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val
  return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

p = TreeNode.new(1)
p.left = TreeNode.new(2)
p.right = TreeNode.new(3)

q = TreeNode.new(1)
q.left = TreeNode.new(2)
q.right = TreeNode.new(3)

assert_equal(true, is_same_tree(p, q))