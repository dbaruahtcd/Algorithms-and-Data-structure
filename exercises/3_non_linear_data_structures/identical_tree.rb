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

# p : TreeNode
# q : TreeNode
# return boolean
def is_same_tree(p, q)
  # when both p and q are nil
  return true if p.nil? && q.nil?
  # when either p or q are nil
  return false if p.nil? || q.nil?
  # when the values are different
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

# balanced identical tree
p = TreeNode.new(1)
p.left = TreeNode.new(2)
p.right = TreeNode.new(3)

q = TreeNode.new(1)
q.left = TreeNode.new(2)
q.right = TreeNode.new(3)

puts is_same_tree(p, q)

# balanced but mismatched value
p1 = TreeNode.new(1)
p1.left = TreeNode.new(3)
p1.right = TreeNode.new(2)

q1 = TreeNode.new(1)
q1.left = TreeNode.new(2)
q1.right = TreeNode.new(3)

puts is_same_tree(p1, q1)

# null trees
p2, q2 = nil, nil
puts is_same_tree(p2, q2)

# unbalanced tree
p3 = TreeNode.new(1)
p3.left = TreeNode.new(2)

q3 = TreeNode.new(1)
q3.right = TreeNode.new(3)
puts is_same_tree(p3, q3)
