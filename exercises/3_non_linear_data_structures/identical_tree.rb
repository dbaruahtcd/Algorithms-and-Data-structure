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
# Time complexity: O(n) since all the nodes of the tree are to be visited
# Space complexity: O(logn) in the best case of completely balanced tree(stack size = height)
#                   O(n) in the worst case.
def is_same_tree(p, q)
  # when both p and q are nil
  return true if p.nil? && q.nil?
  # when either p or q are nil
  return false if p.nil? || q.nil?
  # when the values are different
  return false if p.val != q.val
  
  return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end


def is_same_tree_iterative(p, q)
  return true if p.nil? && q.nil?
  p_queue = Queue.new
  q_queue = Queue.new
  p_queue.enq(p)
  q_queue.enq(q)
  
  while(!p_queue.empty? && !q_queue.empty?)
    p_node = p_queue.deq
    q_node = q_queue.deq
    
    return false if p_node.nil? 
    return true if p_node.left.nil? && p_node.right.nil? && q_node.left.nil? && q_node.right.nil?
    return false if p_node.val != q.node.val
    p_queue.enq(p_node.left).enq(p_node.right)
    q_queue.enq(q_node.left).enq(q_node.right)
  end
  false
end

class SolutionIterative
  def self.check(p, q)
    return true if p.nil? && q.nil? # both are nil
    return false if p.nil? || q.nil? # if either are nil
    return false if p.val != q.val
    true
  end
  
  def self.is_same_tree(p, q)
    return true if p.nil? && q.nil?
    return false if !check(p, q)
    
    p_queue = Queue.new.enq(p)
    q_queue = Queue.new.enq(q)
    while(!p_queue)
      p_node = p_queue.deq
      q_node = q_queue.deq
      
      return false if !check(p, q)
      if !p.nil?
        return false if !check(p.left, q.left)
        if !p.left.nil?
          p_queue.enq(p.left)
          q_queue.enq(q.left)
        end
        
        return false if !check(p.right, q.right)
        if !p.right.nil?
          p_queue.enq(p.right)
          q_queue.enq(q.right)
        end
      end
    end
    true
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

# balanced identical tree
p = TreeNode.new(1)
p.left = TreeNode.new(2)
p.right = TreeNode.new(3)

q = TreeNode.new(1)
q.left = TreeNode.new(2)
q.right = TreeNode.new(3)


puts is_same_tree(p, q)
puts 'iterative'
puts SolutionIterative.is_same_tree(p, q)
# balanced but mismatched value
p1 = TreeNode.new(1)
p1.left = TreeNode.new(3)
p1.right = TreeNode.new(2)

q1 = TreeNode.new(1)
q1.left = TreeNode.new(2)
q1.right = TreeNode.new(3)

puts is_same_tree(p1, q1)
puts 'iterative'
puts SolutionIterative.is_same_tree(p1, q1)

# null trees
p2, q2 = nil, nil
puts is_same_tree(p2, q2)
puts 'iterative'
puts SolutionIterative.is_same_tree(p2, q2)
# unbalanced tree
p3 = TreeNode.new(1)
p3.left = TreeNode.new(2)

q3 = TreeNode.new(1)
q3.right = TreeNode.new(3)
puts is_same_tree(p3, q3)
puts 'iterative'
puts SolutionIterative.is_same_tree(p3, q3)
