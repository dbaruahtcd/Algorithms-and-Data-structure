=begin
Given a binary tree, determine if it is a valid binary search tree (BST).
Assume a BST is defined as follows:
The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.
=end
require_relative '../../spec_helper'

# Initial solution is to check at every node if the right is greater than root and left is smaller than
# root. But the problem with this method is that even though it might hold true for just the three nodes in 
# question, but if we take the entire left and right tree rooted at the base, all elements to the right must begin
# bigger than the root and all on the left must be smaller. So instead of keeping track of the current nodes,
# we need to keep track of the biggest and smallest till now.
# If we don't have the biggest and smallest we compare with the current values.

# Time complexity : O(N) since we visit each node exactly once.
# Space complexity : O(N) since we keep up to the entire tree.
class RecursiveSolution
  
  def initialize(val)
    @root = TreeNode.new(val)
  end
  
  def is_valid_bst?
    valid?(@root, nil, nil)
  end
  
  def insert(val)
    insert_into(@root, val)
  end
  
  private
  def valid?(node, lower, upper)
    return true if node.nil?
    
    val = node.val
    return false if(!lower.nil? && val < lower )
    return false if(!upper.nil? && val > upper )
    
    return false if(!valid?(node.right, val, upper))
    return false if(!valid?(node.left, lower, val))
    return true
  end
  
  def insert_into(node, val)
    return TreeNode.new(val) if node.nil?
    
    case node.val <=> val
    when 1
      node.left = insert_into(node.left, val)
    when -1 
      node.right = insert_into(node.right, val)
    when 0
      return node
    end
    node
  end
end

# Compute inorder traversal list inorder.
# Check if each element in inorder is smaller than the next one.

# Time complexity : O(N) in the worst case when the tree is BST or the "bad" element is a rightmost leaf.
# Space complexity : O(N) to keep stack.
class InorderSolution
  def initialize(val)
    @root = TreeNode.new(val)
  end
  
  def insert(val)
    insert_into(@root, val)
  end
  
  def is_valid_bst?
    root = @root
    stack = []
    inorder = -2 ** (2.size * 8 - 1)
    while(!stack.empty?)
      while(!root.nil?)
        stack.push(root)
        root = root.left
      end
      root = stack.pop
      return false if root.val < inorder
      inorder = root.val
      root = root.right
    end 
  end
  
  private
  def insert_into(node, val)
    return TreeNode.new(val) if node.nil?
    
    case node.val <=> val
    when 1
      node.left = insert_into(node.left, val)
    when -1 
      node.right = insert_into(node.right, val)
    when 0
      node
    end
    node
  end
end

class TreeNode
  attr_accessor :val
  attr_accessor :left, :right
  
  def initialize(val)
    @val = val
  end
end

# bst = RecursiveSolution.new(5)
bst = RecursiveSolution.new(5)
[1, 6, nil, nil, 4, 7].each {|v| bst.insert(v) }
puts bst.inspect
puts bst.is_valid_bst?

