=begin
Given the root of a binary tree, return the inorder traversal of its nodes' values.
Input: root = [1,null,2,3]
Output: [1,3,2]

Example 2:
Input: root = []
Output: []

Example 3:
Input: root = [1]
Output: [1]

Example 4:
Input: root = [1,2]
Output: [2,1]

Example 5:
Input: root = [1,null,2]
Output: [1,2]
=end
require '../../spec_helper'

def inorder_traversal(root)
  return [] if root.val.nil?
  result = []
  traverse_inorder(result, root)
  result
end

def traverse_inorder(result, root)
  if !root.nil?
    traverse_inorder(result, root.left)
    result << "#{root.val}"
    traverse_inorder(result, root.right)
  end
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

empty_tree = TreeNode.new(nil)

tree = TreeNode.new(1)
tree.left = nil
tree.right = TreeNode.new(2)
tree.right.left = TreeNode.new(3)

assert_equal(['1', '3', '2'], inorder_traversal(tree))