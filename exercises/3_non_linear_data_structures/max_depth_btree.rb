=begin
Given a binary tree, find its maximum depth.
The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
Note: A leaf is a node with no children.
Example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its depth = 3.
=end
require '../../spec_helper'
# At each node the height would be the max of the height of left or right subtree + 1
# Running time: O(n) since each node needs to be visited
# Space complexity: O(n) worst case(tree is unbalanced, all nodes left leaning), O(logn) best case perfectly balanced
def max_depth_recursive(root)
  return 0 if root.nil?
  left = max_depth_recursive(root.left) 
  right = max_depth_recursive(root.right)
  return [left, right].max + 1
end

# def max_depth_iterative(root)
#   return 0 if root.nil?
#   queue = Queue.new
#   depths = []
#   queue.enq(root)
#   depths.push(1)
# 
#   current_depth = 0
#   depth = 0
#   while(!queue.empty?)
#     root = queue.deq
#     current_depth = depths.pop
#     if(!root.nil?)
#       depth = [current_depth, depth].max
#       queue.enq(root.left)
#       queue.enq(root.right)
#       depths.push(current_depth + 1)
#       depths.push(current_depth + 1)
#     end
#   end
#   depth
# end
# def max_depth_iterative1(root)
#   return 0 if root.nil?
#   stack = []
#   depths = []
#   stack.push(root)
#   depths.push(1)
# 
#   current_depth = 0
#   depth = 0
#   while(!stack.empty?)
#     root = stack.pop
#     current_depth = depths.pop
#     if(!root.nil?)
#       depth = [current_depth, depth].max
#       stack.push(root.left)
#       stack.push(root.right)
#       depths.push(current_depth + 1)
#       depths.push(current_depth + 1)
#     end
#   end
#   depth
# end

class TreeNode
  attr_accessor :val, :left, :right
  
  def initialize(val, _left = nil, _right = nil)
    @val = val
    @left = _left
    @right = _right
  end
end

tree = TreeNode.new(3)
tree.left = TreeNode.new(9)
tree.right = TreeNode.new(20)
tree.right.left = TreeNode.new(15)
tree.right.right = TreeNode.new(7)

# puts max_depth_recursive(tree)
# puts max_depth_iterative(tree)
# puts max_depth_iterative1(tree)
assert_equal(3, max_depth_recursive(tree))