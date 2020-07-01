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
require_relative '../../spec_helper'

# Space complexity: In the worst case every node has only left sub child, the recursive call would
# occur N times. Therefore the storage for the call stack would be O(N). But in the best case the tree
# would be completely balanced, the height is logN. Space complexity would be O(logN)
# If it is balanced, O(nlogn)
# Time complexity: O(n) Each node visited once, and we visit N nodes
def max_depth(root)
  max_depth_helper(root, 0)
end

def max_depth_helper(root, height)
  return height if(root.nil?)
  left_height = max_depth_helper(root.left, height + 1)
  right_height = max_depth_helper(root.right, height + 1)
  [left_height, right_height].max
end


# Running time: O(n)
# Space complexity: O(ln)(average case) O(n) worst case
# def max_depth_iterative(root)
#   return 0 if root.nil?
#   stack = []
#   stack.push(root)
#   while(!stack.empty?)
#     node = stack.pop
#     if(!node.left.nil?)
#       l_height += 1
#       stack.push(node.left)
#     end
#     if(!node.right.nil?)
#       r_height += 1
#       stack.push(node.right)
#     end
#   end
#   [l_height, r_height].max
# end

# Instead of using DFS, we use a queue for solving this problem using BFS
# Running time: O(n)
# Space complexity: O(n) to store the extra values
def max_depth_iterative(root)
  return 0 if root.nil?
  queue = Queue.new
  queue.enq(root)
  depth = 0
  while(!queue.empty?)
    depth += 1
    size = queue.length
    for i in 0...size
      node = queue.deq
      queue.enq(node.left) if !node.left.nil? 
      queue.enq(node.right) if !node.right.nil?
    end
  end
  depth
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val, _left = nil, _right = nil)
    @val = val
    @left = _left
    @right = _right
  end
end


# [0,2,4,1,null,3,-1,5,1,null,6,null,8]
tree = TreeNode.new(0)
tree.left = TreeNode.new(2)
tree.right = TreeNode.new(4)

tree.left.left = TreeNode.new(1)

tree.right.left = TreeNode.new(3)
tree.right.right = TreeNode.new(-1)

tree.left.left.left = TreeNode.new(5)
tree.left.left.right = TreeNode.new(1)

tree.right.left.left = TreeNode.new(nil)
tree.right.left.right = TreeNode.new(6)

tree.right.right.left = TreeNode.new(nil)
tree.right.right.right = TreeNode.new(8)

tree2 = TreeNode.new(3)
tree2.left = TreeNode.new(9)
tree2.right = TreeNode.new(20)
tree2.right.left = TreeNode.new(15)
tree2.right.right = TreeNode.new(7)

# puts max_depth(tree) 
# puts max_depth_iterative(tree2) 


assert_equal(4, max_depth(tree))
assert_equal(4, max_depth_iterative(tree))

assert_equal(3, max_depth(tree2))
assert_equal(3, max_depth_iterative(tree2))


