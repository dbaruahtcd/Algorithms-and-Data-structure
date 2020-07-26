=begin
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

    1
   / \
  2   2
 / \ / \
3  4 4  3
 

But the following [1,2,2,null,3,null,3] is not:

    1
   / \
  2   2
   \   \
   3    3
 

Follow up: Solve it both recursively and iteratively.
=end
require_relative '../../spec_helper'
# TC: O(n). Because we traverse the entire input tree once, the total run time is O(n), where n is the total number of nodes in the tree.
# SP: Space complexity : The number of recursive calls is bound by the height of the tree. In the worst case, the tree is linear and the 
# height is in O(n). Therefore, space complexity due to recursive calls on the stack is O(n) in the worst case.

def is_symmetric(root)
  is_mirror(root, root)
end

def is_mirror(node1, node2)
  return true if (node1.nil? && node2.nil?)
  return false if (node1.nil? || node2.nil?)
  
  node1.val == node2.val && is_mirror(node1.left, node2.right) && is_mirror(node1.right, node2.left)
end


def is_symmetric_iterative(root)
  queue = Queue.new
  queue.enq(root.left)
  queue.enq(root.right)
  while(!queue.empty?)
    node1 = queue.deq
    node2 = queue.deq
    next if node1.nil? && node2.nil?
    return false if node1.nil? || node2.nil?
    return false if node1.val != node2.val
    queue.enq(node1.left)
    queue.enq(node2.right)
    queue.enq(node1.right)
    queue.enq(node2.left)
  end
  true
end

class TreeNode
  attr_accessor :val, :left, :right
  
  def initialize(val, _left=nil, _right=nil)
    @val = val
    @left = _left
    @right = _right
  end
end

tree = TreeNode.new(1)
tree.left = TreeNode.new(2)
tree.right = TreeNode.new(2)
tree.left.left = TreeNode.new(3)
tree.left.right = TreeNode.new(4)
tree.right.left = TreeNode.new(4)
tree.right.right = TreeNode.new(3)

tree1 = TreeNode.new(1)
tree1.left = TreeNode.new(2)
tree1.right = TreeNode.new(2)
tree1.left.right = TreeNode.new(3)
tree1.right.right = TreeNode.new(3)

assert(is_symmetric(tree))
assert(!is_symmetric(tree1))

assert(is_symmetric_iterative(tree))
assert(!is_symmetric_iterative(tree1))

