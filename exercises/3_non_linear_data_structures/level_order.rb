=begin
Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:
[
  [3],
  [9,20],
  [15,7]
]
=end

require '../../spec_helper'

# @param {TreeNode} root
# @return {Integer[][]}
# We keeps a level pointer that would check with the levels array if we are at the same depth. If we're are
# we will just insert a new array into the adjacency array.
# Time complexity: O(n) since we've to visit each node
# Space complexity: O(n) to keep track of the n nodes
class SolutionRecursive
  attr_accessor :levels
  def initialize
    @levels = []
  end

  def level_order(root)
    level_helper(root, 0)
    levels
  end

  private
  def level_helper(node, level)
    if levels.length == level
      levels.push(Array.new)
    end
    levels[level].push(node.val)
    
    if(!node.left.nil?)
      level_helper(node.left, level+1)
    end
    if (!node.right.nil?)
      level_helper(node.right, level+1)
    end
  end
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val, left = nil, right =nil)
    @val = val
    @left = left
    @right = right
  end
end

# time complexity: O(n) since each node is processed extactly once
# space complexity: O(n) to keep the output structure which contains N node values.
def level_order_iterative(root)
  levels = []
  return levels if root.nil?
  level = 0
  queue = Queue.new
  queue.enq(root)

  while(!queue.empty?)
    levels[level] = []

    level_len = queue.length

    for i in (0...level_len)
      node = queue.deq
      levels[level].push(node.val)

      queue.enq(node.left) if(!node.left.nil?)
      queue.enq(node.right) if(!node.right.nil?)
    end
    level += 1
  end
  levels
end


tree = TreeNode.new(3)
tree.left = TreeNode.new(9)
tree.right = TreeNode.new(20)
tree.right.left = TreeNode.new(15)
tree.right.right = TreeNode.new(7)

solution = SolutionRecursive.new
# puts "solution: #{solution.level_order(tree)}"
assert_equal([[3], [9, 20], [15, 7]], solution.level_order(tree))
assert_equal([[3], [9, 20], [15, 7]], level_order_iterative(tree))