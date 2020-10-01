=begin
Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

Example 1:
Given tree s:

     3
    / \
   4   5
  / \
 1   2
Given tree t:
   4 
  / \
 1   2
Return true, because t has the same structure and node values with a subtree of s.
 

Example 2:
Given tree s:

     3
    / \
   4   5
  / \
 1   2
    /
   0
Given tree t:
   4
  / \
 1   2
Return false.
=end
require '../../spec_helper'

# The idea here is to generate the preorder traversal of both trees and then if t is a substring of s, 
# then the tree are identical. We will differentiate between left and right null with lnull and rnull and 
# all tree node values will be appended with a #

# Time complexity : O(m^2+n^2+m*n)A total of n nodes of the tree s and m nodes of tree t are traversed.
# Assuming string concatenation takes O(k) time for strings of length k and indexOf takes O(m*n).
# Space complexity: O(max(m, n)) The depth of the recursion tree can go upto nn for tree tt and mm for tree ss in worst case.

def is_subtree(s, t)
  pre_order_s = preorder(s, true)
  pre_order_t = preorder(t, true)
  pre_order_s.include?(pre_order_t)
end

def preorder(t, left)
  if t.nil?
    if left
      return 'lnil'
    else 
      return 'rnil'
    end
  end
  return "##{t.val} #{preorder(t.left, true)} #{preorder(t.right, false)}"
end

# For the second solution we treat all the nodes of the tree as the root and compare it against 
# the other tree to check for equality
# Time complexity : O(m*n). In worst case(skewed tree) traverse function takes O(m*n) time.
# Space complexity : O(n). The depth of the recursion tree can go upto n. n refers to the number of nodes in s.
class Solution
  def is_subtree(s, t)
    traverse(s, t)
  end
  
  def is_equal?(s, t)
    return true if (s.nil? && t.nil?)
    return false if (s.nil? || t.nil?)
    return s.val == t.val && is_equal?(s.left, t.left) && is_equal?(s.right, t.right)
  end
  
  def traverse(s, t)
    !s.nil? && (is_equal?(s, t) || traverse(s.left, t) || traverse(s.right, t))
  end
end

class TreeNode
  attr_accessor :val, :left, :right
  
  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

tree1 = TreeNode.new(3)
tree1.left = TreeNode.new(4)
tree1.right = TreeNode.new(2)

tree2 = TreeNode.new(3)
tree2.left = TreeNode.new(4)
tree2.right = TreeNode.new(2)

tree3 = TreeNode.new(5)
tree3.left = TreeNode.new(3)
tree3.left.left = TreeNode.new(4)
tree3.left.right = TreeNode.new(7)

# puts preorder(tree, true)
assert(is_subtree(tree1, tree2))
assert(!is_subtree(tree3, tree2))

sol = Solution.new
assert(sol.is_subtree(tree1, tree2))
assert(!sol.is_subtree(tree3, tree2))