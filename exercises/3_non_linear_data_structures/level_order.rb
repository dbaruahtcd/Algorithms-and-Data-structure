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

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  levels = []
  if root.nil?
    level
  end
end

def level_helper(node, level)
  if node.nil?
    
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
